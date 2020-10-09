import 'package:direct_link/models/site_model.dart';

Future<List<SiteModel>> dropbox(String url) async {
  List<SiteModel> result = [];

  /// replace with download format
  var link = url.replaceAll("www", "dl");

  /// replace with download format
  link = link.replaceAll("dropbox", "dropboxusercontent");

  /// add to result list
  result.add(SiteModel(quality: "url", link: link));

  /// return result list
  return result;
}
