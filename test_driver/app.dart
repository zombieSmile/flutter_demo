import 'package:flutter_driver/driver_extension.dart';
import 'package:flutter_demo/main.dart' as app;

void main() {
  // 初始化Driver
  enableFlutterDriverExtension();

  // 启动应用程序
  app.main();

  // 执行命令 flutter drive --target=test_driver/app.dart 启动测试
}
