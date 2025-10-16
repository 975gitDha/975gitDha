import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import '../config/test_config.dart';
import 'logger.dart';
import 'screenshot.dart';
import 'waits.dart';
import 'launch.dart' as launcher;

class TestHarness {
  final WidgetTester tester;
  final TestConfig config;
  final IntegrationTestWidgetsFlutterBinding binding;
  final ScreenshotHelper screenshots;

  TestHarness({
    required this.tester,
    required this.config,
    required this.binding,
    required this.screenshots,
  });

  static Future<TestHarness> bootstrap(WidgetTester tester) async {
    final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();
    binding.framePolicy = LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;
    final config = TestConfig.fromEnvironment();
    final screenshots = ScreenshotHelper(binding, enabled: config.enableScreenshots);

    return TestHarness(
      tester: tester,
      config: config,
      binding: binding,
      screenshots: screenshots,
    );
  }

  Future<void> launchApp() async {
    TestLog.step('Launching app');
    await launcher.launchApp(tester);
    await tester.pumpAndSettle();
  }
}
