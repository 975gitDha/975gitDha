class TestLog {
  static void info(String message) => print('[INFO] ' + message);
  static void step(String message) => print('[STEP] ' + message);
  static void warn(String message) => print('[WARN] ' + message);
  static void error(String message) => print('[ERROR] ' + message);
}
