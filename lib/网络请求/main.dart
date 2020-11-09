import 'package:flutter/material.dart';
import 'city_model.dart';
import 'package:flutter_demo/%E7%BD%91%E7%BB%9C%E8%AF%B7%E6%B1%82/http/api.dart';
import 'package:flutter_demo/%E7%BD%91%E7%BB%9C%E8%AF%B7%E6%B1%82/http/dio_util.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dio Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Dio Demo'),
        ),
        body: DioDemo(),
      ),
    );
  }
}

class DioDemo extends StatefulWidget {
  @override
  _DioDemoState createState() => _DioDemoState();
}

class _DioDemoState extends State<DioDemo> {
  @override
  void initState() {
    super.initState();
    getCityList().then((value) => print(value));
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

Future<List<CityModel>> getCityList() async {
  var json = await DioManager().get(url: Api.getCityUrl);
  if (json == null) {
    return null;
  }
  List jsonArray = json;
  var cityModels = List<CityModel>();
  jsonArray.forEach((element) {
    cityModels.add(CityModel.fromJson(element));
  });
  return cityModels;
}
