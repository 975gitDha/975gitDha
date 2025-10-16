import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

abstract class WidgetActions {
  static Finder byKeyString(String keyValue) => find.byKey(ValueKey(keyValue));

  static Future<void> tapByKey(WidgetTester tester, String keyValue) async {
    final target = byKeyString(keyValue);
    await tester.ensureVisible(target);
    await tester.tap(target);
    await tester.pumpAndSettle();
  }

  static Future<void> enterTextByKey(
    WidgetTester tester,
    String keyValue,
    String text,
  ) async {
    final target = byKeyString(keyValue);
    await tester.ensureVisible(target);
    await tester.enterText(target, text);
    await tester.pumpAndSettle();
  }
}
