import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ProductList Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('ProductList Demo'),
        ),
        body: HomeContent(),
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: ListView(
        children: <Widget>[
          ProductItem(
              title: 'Apple1',
              desc: 'Macbook1',
              imageURL:
                  'https://tva1.sinaimg.cn/large/006y8mN6gy1g72j6nk1d4j30u00k0n0j.jpg'),
          ProductItem(
              title: 'Apple2',
              desc: 'Macbook2',
              imageURL:
                  'https://tva1.sinaimg.cn/large/006y8mN6gy1g72imm9u5zj30u00k0adf.jpg'),
          ProductItem(
              title: 'Apple2',
              desc: 'Macbook3',
              imageURL:
                  'https://tva1.sinaimg.cn/large/006y8mN6gy1g72imqlouhj30u00k00v0.jpg')
        ],
      ),
    );
  }
}

class ProductItem extends StatelessWidget {
  final String title;
  final String desc;
  final String imageURL;

  ProductItem({
    Key key,
    @required this.title,
    @required this.desc,
    @required this.imageURL,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(border: Border.all()),
      child: Column(
        children: <Widget>[
          Text(title, style: TextStyle(fontSize: 24)),
          Text(desc, style: TextStyle(fontSize: 18)),
          SizedBox(height: 10),
          Image.network(imageURL),
        ],
      ),
    );
  }
}
