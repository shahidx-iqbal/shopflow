import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shopflow/core/enums/customer_type.dart';
import 'package:shopflow/core/error/failures.dart';
import 'package:shopflow/features/customers/domain/entities/customer_entity.dart';
import 'package:shopflow/features/pos/domain/entities/cart_item_entity.dart';
import 'package:shopflow/features/pos/domain/entities/sale_entity.dart';
import 'package:shopflow/features/pos/domain/entities/sale_enums.dart';
import 'package:shopflow/features/pos/domain/usecases/check_cart_stock_availability_usecase.dart';
import 'package:shopflow/features/pos/domain/usecases/confirm_sale_usecase.dart';
import 'package:shopflow/features/pos/domain/usecases/pos_get_product_by_barcode_usecase.dart';
import 'package:shopflow/features/pos/data/models/pos_cart_draft_model.dart';
import 'package:shopflow/features/pos/domain/repositories/pos_repository.dart';
import 'package:shopflow/features/pos/presentation/bloc/pos_bloc.dart';
import 'package:shopflow/features/pos/presentation/bloc/pos_event.dart';
import 'package:shopflow/features/pos/presentation/bloc/pos_state.dart';
import 'package:shopflow/features/products/domain/entities/product_entity.dart';
import 'package:shopflow/features/products/domain/usecases/get_product_by_id_usecase.dart';

class _MockConfirmSale extends Mock implements ConfirmSaleUseCase {}

class _MockCheckCartStock extends Mock
    implements CheckCartStockAvailabilityUseCase {}

class _MockGetByBarcode extends Mock implements PosGetProductByBarcodeUseCase {}

class _MockGetProductById extends Mock implements GetProductByIdUseCase {}

class _MockPosRepository extends Mock implements PosRepository {}

void main() {
  late _MockConfirmSale confirmSale;
  late _MockCheckCartStock checkCartStock;
  late _MockGetByBarcode getByBarcode;
  late _MockGetProductById getProductById;
  late _MockPosRepository posRepository;
  late PosBloc bloc;

  final now = DateTime(2026, 1, 1);

  ProductEntity pieceProduct({int stock = 10}) => ProductEntity(
        id: 'p1',
        name: 'Soap',
        barcode: '111',
        categoryId: 'c1',
        price: 100,
        costPrice: 50,
        stock: stock,
        lowStockThreshold: 2,
        unit: 'pcs',
        createdAt: now,
        updatedAt: now,
      );

  ProductEntity weightProduct({int stock = 10}) => ProductEntity(
        id: 'p2',
        name: 'Rice',
        barcode: '222',
        categoryId: 'c1',
        price: 200,
        costPrice: 150,
        stock: stock,
        lowStockThreshold: 1,
        unit: 'kg',
        createdAt: now,
        updatedAt: now,
      );

  CustomerEntity ledgerCustomer() => CustomerEntity(
        id: 'cust1',
        name: 'Ahmed',
        phone: '0300',
        customerType: CustomerType.ledger,
        balance: 1200,
        createdAt: now,
      );

  CustomerEntity cashCustomer() => CustomerEntity(
        id: 'cust2',
        name: 'Walk-in',
        phone: '0301',
        customerType: CustomerType.cash,
        balance: 0,
        createdAt: now,
      );

  setUpAll(() {
    registerFallbackValue(
      PosBarcodeParams(barcode: 'fallback'),
    );
    registerFallbackValue(
      const CheckCartStockParams(items: []),
    );
    registerFallbackValue(
      const PosCartDraftModel(),
    );
    registerFallbackValue(
      SaleEntity(
        id: 'sale_fallback',
        items: const [],
        saleType: SaleType.cash,
        paymentStatus: PaymentStatus.paid,
        total: 0,
        createdAt: DateTime(2026),
      ),
    );
  });

  setUp(() {
    confirmSale = _MockConfirmSale();
    checkCartStock = _MockCheckCartStock();
    getByBarcode = _MockGetByBarcode();
    getProductById = _MockGetProductById();
    posRepository = _MockPosRepository();
    when(() => posRepository.loadCartDraft())
        .thenAnswer((_) async => const Right<Failure, PosCartDraftModel?>(null));
    when(() => posRepository.saveCartDraft(any()))
        .thenAnswer((_) async => const Right(unit));
    when(() => posRepository.clearCartDraft())
        .thenAnswer((_) async => const Right(unit));
    when(() => checkCartStock(any())).thenAnswer((_) async => const Right(unit));
    bloc = PosBloc(
      confirmSale,
      checkCartStock,
      getByBarcode,
      getProductById,
      posRepository,
    );
  });

  tearDown(() => bloc.close());

  group('Product selection', () {
    blocTest<PosBloc, PosState>(
      'adds piece product on tap',
      build: () => bloc,
      act: (b) => b.add(PosTapProductEvent(product: pieceProduct())),
      expect: () => [
        isA<PosState>()
            .having((s) => s.cartItems.length, 'items', 1)
            .having((s) => s.cartItems.first.quantity, 'qty', 1),
      ],
    );

    blocTest<PosBloc, PosState>(
      'merges piece product quantity on second tap',
      build: () => bloc,
      seed: () => PosState(
        cartItems: [cartLine(pieceProduct(), 1)],
      ),
      act: (b) => b.add(PosTapProductEvent(product: pieceProduct())),
      expect: () => [
        isA<PosState>().having(
          (s) => s.cartItems.first.quantity,
          'qty',
          2,
        ),
      ],
    );

    blocTest<PosBloc, PosState>(
      'opens quantity sheet for weight product',
      build: () => bloc,
      act: (b) => b.add(PosTapProductEvent(product: weightProduct())),
      expect: () => [
        isA<PosState>()
            .having((s) => s.pendingQuantityProduct?.id, 'product', 'p2')
            .having((s) => s.pendingQuantityPrefill, 'prefill', isNull)
            .having((s) => s.cartItems, 'cart', isEmpty),
      ],
    );

    blocTest<PosBloc, PosState>(
      'reopens quantity sheet pre-filled when weight product is tapped again',
      build: () => bloc,
      seed: () => PosState(
        cartItems: [cartLine(weightProduct(), 1.5)],
      ),
      act: (b) => b.add(PosTapProductEvent(product: weightProduct())),
      expect: () => [
        isA<PosState>()
            .having((s) => s.pendingQuantityProduct?.id, 'product', 'p2')
            .having((s) => s.pendingQuantityPrefill, 'prefill', 1.5),
      ],
    );

    blocTest<PosBloc, PosState>(
      'blocks out-of-stock product',
      build: () => bloc,
      act: (b) => b.add(PosTapProductEvent(product: pieceProduct(stock: 0))),
      expect: () => [
        isA<PosState>()
            .having((s) => s.cartItems, 'cart', isEmpty)
            .having((s) => s.warningMessage, 'warning', 'out_of_stock'),
      ],
    );

    blocTest<PosBloc, PosState>(
      'adds weight product by amount',
      build: () => bloc,
      act: (b) => b.add(
        PosAddProductWithQuantityEvent(
          product: weightProduct(),
          quantity: 0,
          mode: PosQuantityInputMode.byAmount,
          amount: 300,
        ),
      ),
      expect: () => [
        isA<PosState>().having(
          (s) => s.cartItems.first.quantity,
          'qty',
          1.5,
        ),
      ],
    );
  });

  group('Cart management', () {
    blocTest<PosBloc, PosState>(
      'clamps item discount to line gross',
      build: () => bloc,
      seed: () => PosState(cartItems: [cartLine(pieceProduct(), 1)]),
      act: (b) => b.add(
        const PosApplyItemDiscountEvent(productId: 'p1', discount: 500),
      ),
      expect: () => [
        isA<PosState>().having(
          (s) => s.cartItems.first.discount,
          'discount',
          100,
        ),
      ],
    );

    blocTest<PosBloc, PosState>(
      'applies cart discount after item discounts',
      build: () => bloc,
      seed: () => PosState(cartItems: [cartLine(pieceProduct(), 2)]),
      act: (b) => b.add(const PosApplyCartDiscountEvent(discount: 50)),
      expect: () => [
        isA<PosState>()
            .having((s) => s.cartDiscount, 'cartDiscount', 50)
            .having((s) => s.total, 'total', 150),
      ],
    );
  });

  group('Customer & sale type', () {
    blocTest<PosBloc, PosState>(
      'cash customer locks ledger sale',
      build: () => bloc,
      seed: () => PosState(
        selectedCustomer: cashCustomer(),
        saleType: SaleType.cash,
      ),
      act: (b) => b.add(const PosSelectSaleTypeEvent(saleType: SaleType.ledger)),
      expect: () => <PosState>[],
    );

    blocTest<PosBloc, PosState>(
      'selecting cash customer forces cash sale',
      build: () => bloc,
      seed: () => const PosState(saleType: SaleType.ledger),
      act: (b) => b.add(PosSelectCustomerEvent(customer: cashCustomer())),
      expect: () => [
        isA<PosState>()
            .having((s) => s.saleType, 'saleType', SaleType.cash)
            .having((s) => s.isLedgerSaleLocked, 'locked', true),
      ],
    );

    blocTest<PosBloc, PosState>(
      'partial ledger payment computes remainder',
      build: () => bloc,
      seed: () => PosState(
        saleType: SaleType.ledger,
        selectedCustomer: ledgerCustomer(),
        isPartialPayment: true,
        cashReceived: 100,
        cartItems: [cartLine(pieceProduct(), 2)],
      ),
      verify: (b) {
        expect(b.state.total, 200);
        expect(b.state.ledgerRemainder, 100);
        expect(b.state.amountPaidNow, 100);
      },
    );

    blocTest<PosBloc, PosState>(
      'caps ledger cash received at total',
      build: () => bloc,
      seed: () => PosState(
        saleType: SaleType.ledger,
        selectedCustomer: ledgerCustomer(),
        isPartialPayment: true,
        cartItems: [cartLine(pieceProduct(), 1)],
      ),
      act: (b) => b.add(const PosUpdateCashReceivedEvent(amount: 500)),
      expect: () => [
        isA<PosState>().having((s) => s.cashReceived, 'cash', 100),
      ],
    );
  });

  group('Payment & totals', () {
    blocTest<PosBloc, PosState>(
      'calculates change due on cash sale',
      build: () => bloc,
      seed: () => PosState(
        saleType: SaleType.cash,
        cashReceived: 250,
        cartItems: [cartLine(pieceProduct(), 2)],
      ),
      verify: (b) {
        expect(b.state.total, 200);
        expect(b.state.changeDue, 50);
      },
    );

    test('applies tax after discounts', () {
      const state = PosState(
        cartItems: [],
        cartDiscount: 10,
        taxEnabled: true,
        taxRate: 0.1,
      );
      final withItem = state.copyWith(
        cartItems: [cartLine(pieceProduct(), 1)],
      );
      expect(withItem.taxableSubtotal, 90);
      expect(withItem.tax, 9);
      expect(withItem.total, 99);
    });
  });

  group('Confirm sale validation', () {
    blocTest<PosBloc, PosState>(
      'requires cash received on cash sale',
      build: () => bloc,
      seed: () => PosState(
        cartItems: [cartLine(pieceProduct(), 1)],
        saleType: SaleType.cash,
        cashReceived: 0,
      ),
      act: (b) => b.add(const PosConfirmSaleEvent(cashReceived: 0)),
      expect: () => [
        isA<PosState>()
            .having((s) => s.status, 'status', PosStatus.error)
            .having((s) => s.message, 'message', 'cash_required'),
      ],
      verify: (_) {
        verifyNever(() => confirmSale(any()));
      },
    );

    blocTest<PosBloc, PosState>(
      'uses cash from confirm event when bloc state is stale',
      build: () {
        when(() => confirmSale(any())).thenAnswer(
          (_) async => Right(
            SaleEntity(
              id: 'sale1',
              items: [cartLine(pieceProduct(), 1)],
              saleType: SaleType.cash,
              paymentStatus: PaymentStatus.paid,
              total: 100,
              createdAt: now,
            ),
          ),
        );
        return bloc;
      },
      seed: () => PosState(
        saleType: SaleType.cash,
        cashReceived: 0,
        cartItems: [cartLine(pieceProduct(), 1)],
      ),
      act: (b) => b.add(const PosConfirmSaleEvent(cashReceived: 100)),
      expect: () => [
        isA<PosState>().having((s) => s.cashReceived, 'cash', 100),
        isA<PosState>().having((s) => s.status, 'status', PosStatus.submitting),
        isA<PosState>()
            .having((s) => s.status, 'status', PosStatus.success)
            .having((s) => s.lastCompletedSale, 'lastCompletedSale', isNotNull),
      ],
      verify: (_) {
        verify(() => confirmSale(any())).called(1);
      },
    );
  });

  group('Confirm sale stock check', () {
    blocTest<PosBloc, PosState>(
      'rejects confirm when stock check fails',
      build: () {
        when(() => checkCartStock(any())).thenAnswer(
          (_) async => const Left(
            ValidationFailure(
              message: 'Rice only has 0.5 kg left',
              code: 'insufficient_stock',
            ),
          ),
        );
        return bloc;
      },
      seed: () => PosState(
        saleType: SaleType.cash,
        cashReceived: 100,
        cartItems: [cartLine(pieceProduct(), 1)],
      ),
      act: (b) => b.add(const PosConfirmSaleEvent(cashReceived: 100)),
      expect: () => [
        isA<PosState>().having((s) => s.status, 'status', PosStatus.submitting),
        isA<PosState>()
            .having((s) => s.status, 'status', PosStatus.error)
            .having((s) => s.message, 'message', 'insufficient_stock'),
      ],
      verify: (_) {
        verifyNever(() => confirmSale(any()));
      },
    );
  });

  group('Barcode scan', () {
    blocTest<PosBloc, PosState>(
      'sets not-found barcode for unknown scan',
      build: () {
        when(() => getByBarcode(any())).thenAnswer(
          (_) async => const Left(
            ServerFailure(message: 'Not found', code: 'product_not_found'),
          ),
        );
        return bloc;
      },
      act: (b) => b.add(const PosScanBarcodeEvent(barcode: '999')),
      expect: () => [
        isA<PosState>().having((s) => s.status, 'status', PosStatus.loading),
        isA<PosState>()
            .having((s) => s.scannedBarcodeNotFound, 'barcode', '999')
            .having((s) => s.outOfStockProduct, 'outOfStock', isNull),
      ],
    );

    blocTest<PosBloc, PosState>(
      'sets out-of-stock product when scan matches zero-stock item',
      build: () {
        when(() => getByBarcode(any())).thenAnswer(
          (_) async => Right(pieceProduct(stock: 0)),
        );
        return bloc;
      },
      act: (b) => b.add(const PosScanBarcodeEvent(barcode: '111')),
      expect: () => [
        isA<PosState>().having((s) => s.status, 'status', PosStatus.loading),
        isA<PosState>()
            .having((s) => s.outOfStockProduct?.id, 'product', 'p1')
            .having((s) => s.scannedBarcodeNotFound, 'barcode', isNull)
            .having((s) => s.warningMessage, 'warning', isNull)
            .having((s) => s.cartItems, 'cart', isEmpty),
      ],
    );

    blocTest<PosBloc, PosState>(
      'prefills quantity sheet when scanned weight product is already in cart',
      build: () {
        when(() => getByBarcode(any())).thenAnswer(
          (_) async => Right(weightProduct()),
        );
        return bloc;
      },
      seed: () => PosState(
        cartItems: [cartLine(weightProduct(), 2.25)],
      ),
      act: (b) => b.add(const PosScanBarcodeEvent(barcode: '222')),
      expect: () => [
        isA<PosState>().having((s) => s.status, 'status', PosStatus.loading),
        isA<PosState>()
            .having((s) => s.pendingQuantityProduct?.id, 'product', 'p2')
            .having((s) => s.pendingQuantityPrefill, 'prefill', 2.25),
      ],
    );
  });
}

CartItemEntity cartLine(ProductEntity product, double quantity) =>
    CartItemEntity(
      productId: product.id,
      productName: product.name,
      barcode: product.barcode,
      unit: product.unit,
      unitPrice: product.price,
      quantity: quantity,
    );
