import 'package:direct_link/actions/parse.dart';
import 'package:direct_link/models/site_model.dart';
import 'package:requests/requests.dart';

Future<List<SiteModel>> solidfiles(String url) async {
  List<SiteModel> result = [];
  Parse parse = Parse();

  /// get data from url
  var r = await Requests.get(url);
  r.raiseForStatus();

  try {
    /// get link
    var link = parse.tag(r.content(), "downloadUrl\":");

    /// add data to result list
    result.add(SiteModel(quality: "url", link: link));

    /// return result list
    return result;
  } catch (_) {
    return null;
  }
}
