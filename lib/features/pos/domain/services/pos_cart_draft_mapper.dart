import '../../../customers/data/models/customer_model.dart';
import '../../data/models/cart_item_model.dart';
import '../../data/models/pos_cart_draft_model.dart';
import '../../presentation/bloc/pos_state.dart';

/// Maps between [PosState] and persisted [PosCartDraftModel].
class PosCartDraftMapper {
  PosCartDraftMapper._();

  static PosCartDraftModel toModel(PosState state) => PosCartDraftModel(
        items: state.cartItems.map(CartItemModel.fromEntity).toList(),
        saleType: state.saleType,
        customer: state.selectedCustomer != null
            ? CustomerModel.fromEntity(state.selectedCustomer!)
            : null,
        isPartialPayment: state.isPartialPayment,
        cashReceived: state.cashReceived,
        cartDiscount: state.cartDiscount,
        taxEnabled: state.taxEnabled,
        taxRate: state.taxRate,
      );

  static PosState fromModel(PosCartDraftModel draft) => PosState(
        status: PosStatus.ready,
        cartItems: draft.items.map((e) => e.toEntity()).toList(),
        saleType: draft.saleType,
        selectedCustomer: draft.customer?.toEntity(),
        isPartialPayment: draft.isPartialPayment,
        cashReceived: draft.cashReceived,
        cartDiscount: draft.cartDiscount,
        taxEnabled: draft.taxEnabled,
        taxRate: draft.taxRate,
      );

  static bool isNonEmpty(PosCartDraftModel? draft) =>
      draft != null && draft.items.isNotEmpty;
}
