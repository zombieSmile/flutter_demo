class Api {
  static const bool inProduction =
      const bool.fromEnvironment("dart.vm.product");
  static const String baseUrl = 'https://testapi4.tianguiedu.com/api/';
  static const String getCityUrl = 'CityDate';
}
