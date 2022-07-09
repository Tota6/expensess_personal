import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expention personal"),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Card(
                color: Color.fromARGB(255, 235, 216, 159),
                elevation: 5,
                child: Container(width: double.infinity, child: Text("chart")),
              ),
            ),
            Card(
              color: Colors.red,
              elevation: 5,
              child: Container(child: Text("list of transaction")),
            ),
          ]),
    );
  }
}
