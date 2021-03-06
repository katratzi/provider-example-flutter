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
    return ChangeNotifierProvider<Data>(
      create: (context) => Data(),
      child: MaterialApp(
          title: 'Flutter Demo',
          home: Scaffold(
            appBar: AppBar(
              title: MyText(),
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
    return Column(
      children: <Widget>[
        MyTextField(),
        Level3(),
      ],
    );
  }
}

class Level3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      // listen is True by default so can omit
      Provider.of<Data>(context, listen: true).data,
    );
  }
}

class MyText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      Provider.of<Data>(context, listen: false).data,
    );
  }
}

class MyTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {
        Provider.of<Data>(context, listen: false).data = value;
      },
    );
  }
}

// this is the Data object that handles our logic
class Data extends ChangeNotifier {
  //get & set :)
  String _data = 'katratzi';
  String get data => _data;
  set data(String newValue) {
    _data = newValue;
    notifyListeners(); // IMPORTANT CALL :)
  }

  // use setter instead of this method
  // void changeString(String newValue) {
  //   data = newValue;
  //   notifyListeners(); // IMPORTANT CALL :)
  // }

  // cool, get & set syntax
  double _myTime = 0.5;
  double get myTime => _myTime;
  set myTime(newTime) {
    _myTime = newTime;
  }
}
