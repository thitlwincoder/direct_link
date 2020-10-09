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
    var label = r.content().split("aria-label=\"Download file\"")[1];

    // add data to result list
    result.add(SiteModel(quality: "url", link: parse.tag(label, "href=")));

    // return result list
    return result;
  } catch (_) {
    return null;
  }
}
