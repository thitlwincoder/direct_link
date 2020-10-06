import 'package:direct_link/actions/parse.dart';
import 'package:direct_link/models/site_model.dart';
import 'package:requests/requests.dart';

Future<List<SiteModel>> mediafire(String url) async {
  List<SiteModel> result = [];
  Parse parse = Parse();

  var r = await Requests.get(url); // get data from url
  r.raiseForStatus();

  var label = parse.split(r.content(), "YXJpYS1sYWJlbD0iRG93bmxvYWQgZmlsZSI=");

  result.add(SiteModel(quality: "url", link: parse.tag(label, "aHJlZj0=")));

  return result; // return data
}
