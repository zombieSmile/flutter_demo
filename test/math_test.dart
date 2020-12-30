import 'package:flutter_demo/%E6%B5%8B%E8%AF%95/unit/math_utils.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("test math utils file", () {
    test("math utils file sum test", () {
      final result = sum(20, 30);
      expect(result, 50);
    });

    test("math utils file mul test", () {
      final result = mul(20, 30);
      expect(result, 600);
    });
  });
}