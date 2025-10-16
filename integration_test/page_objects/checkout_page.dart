import 'package:flutter_test/flutter_test.dart';

import '../support/finders.dart';
import '../support/keys.dart';

class CheckoutPage {
  final WidgetTester tester;

  const CheckoutPage(this.tester);

  Future<void> payCash() async {
    await WidgetActions.tapByKey(tester, AppKeys.payCashButton);
  }

  Future<void> confirmPayment() async {
    await WidgetActions.tapByKey(tester, AppKeys.confirmPaymentButton);
  }

  Future<void> waitForSuccess() async {
    final finder = WidgetActions.byKeyString(AppKeys.successDialog);
    // Wait briefly until success appears and then settles
    await tester.pumpAndSettle();
    expect(finder, findsOneWidget);
  }
}
