import 'dart:convert';

import 'package:direct_link/direct_link.dart';
import 'package:flutter/material.dart';
import 'package:flutter_json_widget/flutter_json_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final controller = TextEditingController();
  String result = "{}";

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  getLink(String url) async {
    var check = await DirectLink.check(url);
    setState(() {
      result = check.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Direct Link Demo")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: TextField(controller: controller),
          ),
          SizedBox(height: 20),
          RaisedButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))),
            color: Colors.blue,
            child: Text('Get', style: TextStyle(color: Colors.white)),
            onPressed: () => getLink(controller.text),
          ),
          SizedBox(height: 40),
          JsonViewerWidget(json.decode(result)),
        ],
      ),
    );
  }
}
