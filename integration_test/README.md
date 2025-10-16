# Integration Test Framework (POS Happy Flow)

This directory hosts the `integration_test` framework for Ebono POS Flutter UI automation.

## Structure
- `config/` runtime config (env-driven)
- `support/` test harness, utils, keys, waits, logger, screenshots, launch
- `page_objects/` page object models for main POS screens
- `flows/` high-level user flows (happy path)
- `tests/` test cases invoking flows
- `/test_driver/` driver entry for device runs

## Running
- Desktop/web emulator:
```bash
flutter test integration_test/tests/happy_flow_test.dart
```

- Device/emulator with driver (screenshots enabled):
```bash
EBONO_SCREENSHOTS=true flutter drive \
  --driver=test_driver/integration_test.dart \
  --target=integration_test/tests/happy_flow_test.dart
```

## Environment Variables
- `EBONO_BASE_URL` backend base URL
- `EBONO_TEST_USER` username (default: cashier)
- `EBONO_TEST_PASS` password (default: password)
- `EBONO_TIMEOUT_SECONDS` default timeout (default: 45)
- `EBONO_SCREENSHOTS` set to `true` to enable screenshots
