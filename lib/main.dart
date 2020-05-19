import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final String data = 'My Secret Code';
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider<String>(
      create: (context) => data,
      child: MaterialApp(
          title: 'Flutter Demo',
          home: Scaffold(
            appBar: AppBar(
              title: Text(data),
            ),
            body: Level1(),
          )),
    );
  }
}

class Level1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Level2();
  }
}

class Level2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Level3();
  }
}

class Level3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(Provider.of<String>(
      context,
      listen: false,
    ));
  }
}
