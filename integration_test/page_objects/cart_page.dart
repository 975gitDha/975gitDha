import 'package:flutter_test/flutter_test.dart';

import '../support/finders.dart';
import '../support/keys.dart';

class CartPage {
  final WidgetTester tester;

  const CartPage(this.tester);

  Future<void> proceedToCheckout() async {
    await WidgetActions.tapByKey(tester, AppKeys.proceedToCheckoutButton);
  }
}
