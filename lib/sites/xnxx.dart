import 'package:direct_link/actions/parse.dart';
import 'package:direct_link/models/site_model.dart';
import 'package:requests/requests.dart';

Future<List<SiteModel>> xnxx(String url) async {
  List<SiteModel> result = [];
  Parse parse = Parse();

  /// downloader host
  var host = "http://www.xnxx-downloader.net/";

  /// get data from host
  var r = await Requests.post(
    host,
    headers: {"Referer": host},
    body: {"query": url, "submit": ""},
  );
  r.raiseForStatus();

  try {
    /// get success
    var success = r.content().split("alert alert-success")[1];

    /// get link
    var href = parse.tag(success, "href=");

    /// add data to result list
    result.add(SiteModel(quality: "url", link: href));

    /// return result list
    return result;
  } catch (_) {
    return null;
  }
}
