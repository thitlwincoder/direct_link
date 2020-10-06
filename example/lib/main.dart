import 'package:direct_link/direct_link.dart';
import 'package:direct_link/models/site_model.dart';
import 'package:flutter/material.dart';

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
  List<SiteModel> result;
  bool loading = false;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  getLink(String url) async {
    var check = await DirectLink.check(
        "https://www.dropbox.com/s/pheamzqgg05po44/app-debug.apk"); // get data from url
    setState(() {
      loading = false;
      result = check;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Direct Link Demo")),
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Column(
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
              onPressed: () {
                setState(() => loading = true);
                getLink(controller.text);
              },
            ),
            SizedBox(height: 40),
            loading
                ? CircularProgressIndicator()
                : result == null
                    ? Text("Data Null") // data null condition
                    : result.length > 1 // multiple links & quality
                        ? ListView.builder(
                            shrinkWrap: true,
                            physics: ClampingScrollPhysics(),
                            itemCount: result.length,
                            itemBuilder: (context, index) {
                              var data = result[index];
                              return ListTile(
                                title: Text(data.quality), // get quality
                                subtitle: Text(data.link), // get link
                              );
                            })
                        : ListTile(
                            // single link
                            title: Text(result[0].quality),
                            subtitle: Text(result[0].link),
                          ),
          ],
        ),
      ),
    );
  }
}
