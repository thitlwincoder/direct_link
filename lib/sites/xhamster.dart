import 'dart:convert';

import 'package:direct_link/models/site_model.dart';
import 'package:requests/requests.dart';

Future<List<SiteModel>> xhamster(String url) async {
  List<SiteModel> result = [];

  /// downloader host
  var host = "https://en.fetchfile.net/";

  /// get data from host
  var r = await Requests.post(
    host + "fetch/",
    headers: {"Referer": host},
    body: {"url": url, "action": "homePure"},
  );
  r.raiseForStatus();

  try {
    var content = json.decode(r.content());

    List formats =
        content["formats"] == null ? xhamster(url) : content["formats"];

    /// formats loop
    formats.forEach((format) {
      var quality = format["format_id"].split("-")[1];
      var link = format["url"];

      /// add data to result list
      result.add(SiteModel(quality: quality, link: link));
    });

    /// return result list
    return result;
  } catch (_) {
    return null;
  }
}
