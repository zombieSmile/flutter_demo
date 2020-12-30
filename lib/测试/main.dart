import 'package:flutter/material.dart';

class Contacts extends StatelessWidget {
  final List<String> names;

  Contacts(this.names);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("联系人列表"),
      ),
      body: ListView(
        children: names.map((name) {
          return ListTile(
            leading: Icon(Icons.people),
            title: Text(name),
          );
        }).toList(),
      ),
    );
  }
}
