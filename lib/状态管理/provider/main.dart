import 'package:flutter/material.dart';
import 'user_info.dart';
import 'user_view_model.dart';
import 'counter_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => CounterViewModel(),
        child: MyApp(),
      ),
      ChangeNotifierProvider(
        create: (context) => UserViewModel(UserInfo('wang', 18, '111')),
        child: MyApp(),
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Provider Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Provider Demo'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [ShowData1(), ShowData2(), ShowData3()],
          ),
        ),
        floatingActionButton: Selector<CounterViewModel, CounterViewModel>(
          selector: (context, counterVM) => counterVM,
          shouldRebuild: (prev, next) => false,
          builder: (context, counterVM, child) {
            return FloatingActionButton(
              child: child,
              onPressed: () {
                counterVM.counter += 1;
              },
            );
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}

class ShowData1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int _counter = Provider.of<CounterViewModel>(context).counter;
    return Card(
      color: Colors.red,
      child: Text('当前计数：$_counter', style: TextStyle(fontSize: 30)),
    );
    ;
  }
}

class ShowData2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Consumer<CounterViewModel>(builder: (context, counterVM, child) {
        return Text(
          '当前计数：${counterVM.counter}',
          style: TextStyle(fontSize: 30),
        );
      }),
    );
  }
}

class ShowData3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer2<UserViewModel, CounterViewModel>(
        builder: (context, userVM, counterVM, child) {
      return Text(
        'nickName：${userVM.user.nickName} counter:${counterVM.counter}',
        style: TextStyle(fontSize: 20),
      );
    });
  }
}
