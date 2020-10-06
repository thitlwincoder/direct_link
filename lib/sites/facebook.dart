import 'package:direct_link/actions/parse.dart';
import 'package:direct_link/models/site_model.dart';
import 'package:requests/requests.dart';

Future<List<SiteModel>> facebook(String url) async {
  List<SiteModel> result = [];
  Parse parse = Parse();

  var r = await Requests.get(url); // get data from url
  r.raiseForStatus();

  try {
    var hd = parse.tag(r.content(), "aGRfc3JjOg==");
    var sd = parse.tag(r.content(), "c2Rfc3JjOg==");

    if (sd != null) result.add(SiteModel(quality: "sd", link: sd));
    if (hd != null) result.add(SiteModel(quality: "hd", link: hd));

    return result; // return data
  } catch (_) {
    return null;
  }
}
