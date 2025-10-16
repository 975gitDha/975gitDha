import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import '../flows/happy_flow.dart';
import '../support/bindings.dart';

void main() {
  TestBindings.ensureInitialized();

  testWidgets('POS happy flow works', (tester) async {
    final flow = await HappyFlow.create(tester);
    await flow.run();
  });
}
