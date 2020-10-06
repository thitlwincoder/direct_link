import 'package:direct_link/actions/parse.dart';
import 'package:direct_link/models/site_model.dart';
import 'package:requests/requests.dart';

Future<List<SiteModel>> solidfiles(String url) async {
  List<SiteModel> result = [];
  Parse parse = Parse();

  var r = await Requests.get(url); // get data from url
  r.raiseForStatus();

  result.add(SiteModel(
    quality: "url",
    link: parse.tag(r.content(), "ZG93bmxvYWRVcmwiOg=="),
  ));

  return result; // return data
}
