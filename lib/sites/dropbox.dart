import 'package:direct_link/actions/parse.dart';
import 'package:direct_link/models/site_model.dart';

Future<List<SiteModel>> dropbox(String url) async {
  List<SiteModel> result = [];
  Parse parse = Parse();

  // replace with download format
  var link = parse.replace(url, "d3d3", "ZGw=");

  // replace with download format
  link = parse.replace(link, "ZHJvcGJveA==", "ZHJvcGJveHVzZXJjb250ZW50");

  // add to result list
  result.add(SiteModel(quality: "url", link: link));

  // return result list
  return result;
}
