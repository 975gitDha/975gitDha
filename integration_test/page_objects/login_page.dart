import 'package:flutter_test/flutter_test.dart';

import '../support/finders.dart';
import '../support/keys.dart';

class LoginPage {
  final WidgetTester tester;

  const LoginPage(this.tester);

  Future<void> login(String username, String password) async {
    await WidgetActions.enterTextByKey(tester, AppKeys.loginUsernameField, username);
    await WidgetActions.enterTextByKey(tester, AppKeys.loginPasswordField, password);
    await WidgetActions.tapByKey(tester, AppKeys.loginSubmitButton);
    await tester.pumpAndSettle();
  }
}
