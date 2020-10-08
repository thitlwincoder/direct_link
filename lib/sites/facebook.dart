import 'package:direct_link/actions/parse.dart';
import 'package:direct_link/models/site_model.dart';
import 'package:requests/requests.dart';

Future<List<SiteModel>> facebook(String url) async {
  List<SiteModel> result = [];
  Parse parse = Parse();

  // get data from url
  var r = await Requests.get(url);
  r.raiseForStatus();

  try {
    // get hd link
    var hd = parse.tag(r.content(), "aGRfc3JjOg==");

    // get sd link
    var sd = parse.tag(r.content(), "c2Rfc3JjOg==");

    // add sd link to result list
    if (sd != null) result.add(SiteModel(quality: "sd", link: sd));

    // add hd link to result list
    if (hd != null) result.add(SiteModel(quality: "hd", link: hd));

    // return result list
    return result;
  } catch (_) {
    return null;
  }
}
