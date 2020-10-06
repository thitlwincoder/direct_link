import 'package:direct_link/actions/parse.dart';
import 'package:direct_link/models/site_model.dart';
import 'package:requests/requests.dart';

Future<List<SiteModel>> pcloud(String url) async {
  List<SiteModel> result = [];
  Parse parse = Parse();

  var r = await Requests.get(url); // get data from url
  r.raiseForStatus();

  try {
    result.add(SiteModel(
      quality: "url",
      link: parse.tag(r.content(), "ZG93bmxvYWRsaW5rIjo="),
    ));

    return result; // return data
  } catch (_) {
    return null;
  }
}
