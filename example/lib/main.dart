import 'dart:developer';

import 'package:direct_link/direct_link.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Direct Link Example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Direct Link Example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: onPressed,
        tooltip: 'Check',
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> onPressed() async {
    log('Checking');

    var directLink = DirectLink();

    var url = 'https://www.tiktok.com/@selenagomez/video/7281437289602059566?lang=en';

    var model =
        await directLink.check(url, timeout: const Duration(seconds: 10));

    if (model == null) {
      return log('model is null');
    }

    log('title: ${model.title}');
    log('thumbnail: ${model.thumbnail}');
    log('duration: ${model.duration}');
    for (var e in model.links!) {
      log('type: ${e.type}');
      log('quality: ${e.quality}');
      log('link: ${e.link}');
    }
  }
}
