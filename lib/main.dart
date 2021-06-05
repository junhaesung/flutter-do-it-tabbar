import 'package:flutter/material.dart';
import 'package:tabbar_example/sub/firstPage.dart';
import 'package:tabbar_example/sub/secondPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TabBar Example'),
      ),
      body: TabBarView(
        children: [FirstApp(), SecondApp()],
        controller: controller,
      ),
      bottomNavigationBar: TabBar(
        tabs: [
          Tab(
            icon: Icon(Icons.looks_one, color: Colors.blue),
          ),
          Tab(
            icon: Icon(Icons.looks_two, color: Colors.blue),
          )
        ],
        controller: controller,
      ),
    );
  }
}
