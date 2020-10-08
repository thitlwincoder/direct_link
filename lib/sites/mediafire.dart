import 'package:direct_link/actions/parse.dart';
import 'package:direct_link/models/site_model.dart';
import 'package:requests/requests.dart';

Future<List<SiteModel>> mediafire(String url) async {
  List<SiteModel> result = [];
  Parse parse = Parse();

  // get data from url
  var r = await Requests.get(url);
  r.raiseForStatus();

  try {
    // get link
    var label =
        parse.split(r.content(), "YXJpYS1sYWJlbD0iRG93bmxvYWQgZmlsZSI=");

    // add data to result list
    result.add(SiteModel(quality: "url", link: parse.tag(label, "aHJlZj0=")));

    // return result list
    return result;
  } catch (_) {
    return null;
  }
}
