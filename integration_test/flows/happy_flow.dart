import 'package:flutter_test/flutter_test.dart';

import '../config/test_config.dart';
import '../support/harness.dart';
import '../support/logger.dart';
import '../support/keys.dart';
import '../support/finders.dart';
import '../page_objects/login_page.dart';
import '../page_objects/products_page.dart';
import '../page_objects/cart_page.dart';
import '../page_objects/checkout_page.dart';

class HappyFlow {
  final TestHarness harness;
  final LoginPage loginPage;
  final ProductsPage productsPage;
  final CartPage cartPage;
  final CheckoutPage checkoutPage;

  HappyFlow._(this.harness, this.loginPage, this.productsPage, this.cartPage, this.checkoutPage);

  static Future<HappyFlow> create(WidgetTester tester) async {
    final harness = await TestHarness.bootstrap(tester);
    return HappyFlow._(
      harness,
      LoginPage(tester),
      ProductsPage(tester),
      CartPage(tester),
      CheckoutPage(tester),
    );
  }

  Future<void> run() async {
    final config = harness.config;

    await harness.launchApp();
    await harness.screenshots.capture('01_launched');

    TestLog.step('Login as ' + config.username);
    await loginPage.login(config.username, config.password);
    await harness.screenshots.capture('02_logged_in');

    TestLog.step('Search and add product to cart');
    await productsPage.searchProduct('coffee');
    await productsPage.addProductToCart('coffee');
    await harness.screenshots.capture('03_added_to_cart');

    TestLog.step('Open cart and proceed to checkout');
    await productsPage.openCart();
    await cartPage.proceedToCheckout();
    await harness.screenshots.capture('04_checkout');

    TestLog.step('Pay by cash and confirm');
    await checkoutPage.payCash();
    await checkoutPage.confirmPayment();

    final successFinder = WidgetActions.byKeyString(AppKeys.successDialog);
    expect(successFinder, findsOneWidget);
    await harness.screenshots.capture('05_success');
  }
}
