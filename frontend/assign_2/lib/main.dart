import 'package:assign_2/view_models/user.dart';
import 'package:flutter/material.dart';

import 'models/user.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Baedalgeek Assignment 2',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'User'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final userViewModel = UserViewModel();

  FutureBuilder<UserData> userDataSnackBar() {
    return FutureBuilder<UserData>(
      future: userViewModel.recentUser(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text(
            "hello, ${snapshot.data!.age} years old ${snapshot.data!.name}!",
          );
        } else if (snapshot.hasError) {
          return Text(
            "Snapshot Error",
          );
        }
        return const CircularProgressIndicator();
      },
    );
  }

  void _showSnackBar() {
    SnackBar snackBar = SnackBar(
      content: userDataSnackBar(),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Press the button',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showSnackBar,
        child: Icon(Icons.add),
      ),
    );
  }
}
