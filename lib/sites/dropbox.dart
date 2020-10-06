import 'package:direct_link/actions/parse.dart';
import 'package:direct_link/models/site_model.dart';

Future<List<SiteModel>> dropbox(String url) async {
  List<SiteModel> result = [];
  Parse parse = Parse();

  var link = parse.replace(url, "d3d3", "ZGw=");
  link = parse.replace(link, "ZHJvcGJveA==", "ZHJvcGJveHVzZXJjb250ZW50");

  result.add(SiteModel(quality: "url", link: link));

  return result; // return data
}
