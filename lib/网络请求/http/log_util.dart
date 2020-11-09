class LogUtil {
  static const String _TAG_DEFAULT = "###Lcfarm###";

  // dart.vm.product 环境标识位 Release为true debug 为false
  static const bool isRelease = const bool.fromEnvironment("dart.vm.product");

  static String tagDefault = _TAG_DEFAULT;

  static void e(Object object, {String tag}) {
    _printLog(tag, '  e  ', object);
  }

  static void v(Object object, {String tag}) {
    if (!isRelease) {
      _printLog(tag, '  v  ', object);
    }
  }

  static void _printLog(String tag, String stag, Object object) {
    StringBuffer sb = StringBuffer();
    sb.write((tag == null || tag.isEmpty) ? tagDefault : tag);
    sb.write(stag);
    sb.write(object);
    print(sb.toString());
  }
}
