import 'package:flutter_test/flutter_test.dart';
import 'package:shopflow/app.dart';

void main() {
  testWidgets('ShopFlowApp can be instantiated', (WidgetTester tester) async {
    await tester.pumpWidget(const ShopFlowApp());
    expect(tester.takeException(), isNull);
  });
}
