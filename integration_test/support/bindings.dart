import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

class TestBindings {
  static IntegrationTestWidgetsFlutterBinding ensureInitialized() {
    final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();
    binding.framePolicy = LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;
    return binding;
  }
}
