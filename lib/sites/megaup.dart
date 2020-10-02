import 'package:direct_link/actions/parse.dart';
import 'package:requests/requests.dart';

Future megaup(String url) async {
  Parse parse = Parse();
  Map<String, dynamic> result = {};

  var r = await Requests.get(url); // get data from url
  r.raiseForStatus();

  var function = parse.split(r.content(), "ZnVuY3Rpb24gZGlzcGxheSgp");

  result["url"] = parse.tag(function, "aHJlZj0=");

  return result; // return data
}
