import 'package:flutter_test/flutter_test.dart';
import 'package:ebono_pos/main.dart' as app;

Future<void> launchApp(WidgetTester tester) async {
  app.main();
  await tester.pumpAndSettle();
}
