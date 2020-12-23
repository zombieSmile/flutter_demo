import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // primarySwatch传入不是Color, 而是MaterialColor(包含了primaryColor和accentColor)
        primarySwatch: Colors.red,
        // primaryColor: 单独设置导航和TabBar的颜色
        primaryColor: Colors.orange,
        // accentColor: 单独设置FloatingActionButton、Switch等widget
        accentColor: Colors.green,
        // Button的主题
        buttonTheme: ButtonThemeData(
            height: 25, minWidth: 10, buttonColor: Colors.yellow),
        // Card的主题
        cardTheme: CardTheme(color: Colors.greenAccent, elevation: 10),
        // Text的主题
        textTheme: TextTheme(
          bodyText2: TextStyle(fontSize: 16, color: Colors.red),
          bodyText1: TextStyle(fontSize: 20, color: Colors.blue),
          headline1: TextStyle(fontSize: 14),
          headline2: TextStyle(fontSize: 16),
          headline3: TextStyle(fontSize: 18),
          headline4: TextStyle(fontSize: 20),
        ),
      ),
      home: ThemeDemo(),
    );
  }
}

class ThemeDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("首页")),
      body: Center(
        child: Column(
          children: <Widget>[
            Text("Hello World"),
            Text(
              "Hello World",
              style: TextStyle(fontSize: 14),
            ),
            Text(
              "Hello World",
              style: TextStyle(fontSize: 20),
            ),
            Text(
              "Hello World",
              style: Theme.of(context).textTheme.bodyText1,
            ),
            Text(
              "Hello World",
              style: Theme.of(context).textTheme.headline3,
            ),
            Switch(
              value: true,
              onChanged: (value) {},
            ),
            CupertinoSwitch(
              value: true,
              onChanged: (value) {},
              activeColor: Colors.red,
            ),
            RaisedButton(
              child: Text("R"),
              onPressed: () {},
            ),
            Card(
              child: Text(
                "Hello,Smile",
                style: TextStyle(fontSize: 50),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(label: '首页', icon: Icon(Icons.home)),
          BottomNavigationBarItem(label: '分类', icon: Icon(Icons.category))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (ctx) {
                return SecondPage();
              },
            ),
          );
        },
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(primaryColor: Colors.purple),
      child: Scaffold(
        appBar: AppBar(
          title: Text("第二页"),
          backgroundColor: Colors.purple,
        ),
        body: Center(
          child: Text("Second Page"),
        ),
        floatingActionButton: Theme(
          data: Theme.of(context).copyWith(
            colorScheme:
                Theme.of(context).colorScheme.copyWith(secondary: Colors.pink),
          ),
          child: FloatingActionButton(
            child: Icon(Icons.pets),
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
