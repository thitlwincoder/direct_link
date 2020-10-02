import 'package:direct_link/actions/parse.dart';
import 'package:requests/requests.dart';

Future mediafire(String url) async {
  Parse parse = Parse();
  Map<String, dynamic> result = {};

  var r = await Requests.get(url); // get data from url
  r.raiseForStatus();

  var label = parse.split(r.content(), "YXJpYS1sYWJlbD0iRG93bmxvYWQgZmlsZSI=");

  result["url"] = parse.tag(label, "aHJlZj0=");

  return result; // return data
}
