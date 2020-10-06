import 'package:direct_link/actions/parse.dart';
import 'package:direct_link/models/site_model.dart';
import 'package:requests/requests.dart';

Future<List<SiteModel>> megaup(String url) async {
  List<SiteModel> result = [];
  Parse parse = Parse();

  var r = await Requests.get(url); // get data from url
  r.raiseForStatus();

  try {
    var function = parse.split(r.content(), "ZnVuY3Rpb24gZGlzcGxheSgp");

    result
        .add(SiteModel(quality: "url", link: parse.tag(function, "aHJlZj0=")));

    return result; // return data
  } catch (_) {
    return null;
  }
}
