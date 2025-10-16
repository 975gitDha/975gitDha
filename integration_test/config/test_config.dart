import 'dart:io';

class TestConfig {
  final String baseUrl;
  final String username;
  final String password;
  final Duration defaultTimeout;
  final bool enableScreenshots;

  const TestConfig({
    required this.baseUrl,
    required this.username,
    required this.password,
    this.defaultTimeout = const Duration(seconds: 30),
    this.enableScreenshots = false,
  });

  factory TestConfig.fromEnvironment() {
    String readEnv(String key, String fallback) {
      final envValue = Platform.environment[key];
      if (envValue == null || envValue.trim().isEmpty) return fallback;
      return envValue;
    }

    return TestConfig(
      baseUrl: readEnv('EBONO_BASE_URL', 'http://localhost:8080'),
      username: readEnv('EBONO_TEST_USER', 'cashier'),
      password: readEnv('EBONO_TEST_PASS', 'password'),
      defaultTimeout: Duration(
        seconds: int.tryParse(readEnv('EBONO_TIMEOUT_SECONDS', '45')) ?? 45,
      ),
      enableScreenshots:
          readEnv('EBONO_SCREENSHOTS', 'false').toLowerCase() == 'true',
    );
  }
}
