import 'package:integration_test/integration_test.dart';

class ScreenshotHelper {
  final IntegrationTestWidgetsFlutterBinding binding;
  final bool enabled;

  const ScreenshotHelper(this.binding, {required this.enabled});

  Future<void> capture(String name) async {
    if (!enabled) return;
    try {
      await binding.takeScreenshot(name);
    } catch (_) {
      // Ignore if screenshots are not supported in the current runtime
    }
  }
}
