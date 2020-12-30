import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {

  group("counter application test", () {
    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() {
      driver.close();
    });

    final textFinder = find.byValueKey("textKey");
    final buttonFinder = find.byValueKey("buttonKey");

    test(("text default value"), () async {
      expect(await driver.getText(textFinder), "0");
    });

    test(("floatingActionButton click"), () async {
      await driver.tap(buttonFinder);
      expect(await driver.getText(textFinder), "1");
    });
  });
}