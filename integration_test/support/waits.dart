import 'package:flutter_test/flutter_test.dart';

class Waits {
  static Future<void> pumpUntilFound(
    WidgetTester tester,
    Finder finder, {
    Duration timeout = const Duration(seconds: 30),
    Duration pollInterval = const Duration(milliseconds: 200),
  }) async {
    final end = DateTime.now().add(timeout);
    while (DateTime.now().isBefore(end)) {
      await tester.pump(pollInterval);
      if (tester.any(finder)) {
        return;
      }
    }
    throw TestFailure('Timed out waiting for widget: ' + finder.toString());
  }

  static Future<void> pumpUntilGone(
    WidgetTester tester,
    Finder finder, {
    Duration timeout = const Duration(seconds: 30),
    Duration pollInterval = const Duration(milliseconds: 200),
  }) async {
    final end = DateTime.now().add(timeout);
    while (DateTime.now().isBefore(end)) {
      await tester.pump(pollInterval);
      if (!tester.any(finder)) {
        return;
      }
    }
    throw TestFailure('Timed out waiting for widget to disappear: ' + finder.toString());
  }
}
