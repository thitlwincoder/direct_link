import 'package:direct_link/actions/parse.dart';
import 'package:direct_link/models/site_model.dart';
import 'package:requests/requests.dart';

Future<List<SiteModel>> twitter(String url) async {
  List<SiteModel> result = [];
  Parse parse = Parse();

  /// downloader host
  var host = "https://twittervideodownloader.com";

  /// get data from host
  var r = await Requests.get(host);
  r.raiseForStatus();

  /// get header
  var h = r.headers.toString();

  /// get token
  var token = h.split("csrftoken=")[1].split(";")[0];

  /// post data to host
  var p = await Requests.post(
    "$host/download",
    headers: {'Referer': host},
    body: {'csrfmiddlewaretoken': token, "tweet": url},
  );
  p.raiseForStatus();

  try {
    /// get row list
    var row = p.content().split("<div class=\"row\">");

    /// row loop
    row.skip(1).forEach((_row) {
      /// get href
      var href = parse.tag(_row, "href=");

      /// get quality
      var p = _row.split("<p class=\"float-left\">")[1];
      p = parse.string(p, code: "x");

      /// add data to result list
      result.add(SiteModel(quality: p + "p", link: href));
    });

    /// list reverse
    result = result.reversed.toList();

    /// return result list
    return result;
  } catch (_) {
    return null;
  }
}
