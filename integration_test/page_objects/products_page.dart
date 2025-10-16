import 'package:flutter_test/flutter_test.dart';

import '../support/finders.dart';
import '../support/keys.dart';

class ProductsPage {
  final WidgetTester tester;

  const ProductsPage(this.tester);

  Future<void> searchProduct(String query) async {
    await WidgetActions.enterTextByKey(tester, AppKeys.searchField, query);
  }

  Future<void> addProductToCart(String productIdOrName) async {
    await WidgetActions.tapByKey(tester, AppKeys.addToCartButtonPrefix + productIdOrName);
  }

  Future<void> openCart() async {
    await WidgetActions.tapByKey(tester, AppKeys.openCartButton);
  }
}
