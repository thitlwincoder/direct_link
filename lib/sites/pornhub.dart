import 'dart:convert';

import 'package:direct_link/models/site_model.dart';
import 'package:requests/requests.dart';

Future<List<SiteModel>> pornhub(String url) async {
  List<SiteModel> result = [];

  /// downloader host
  var host = "https://pornhubsave.com";

  /// get data from host
  var r = await Requests.get(host);
  r.raiseForStatus();

  /// get header
  var h = r.headers.toString();

  /// get token
  var token = h.split("csrftoken=")[1].split(";")[0];

  /// post data to host
  var p = await Requests.post(
    "$host/result",
    headers: {'Referer': host},
    body: {'csrfmiddlewaretoken': token, "url": url},
  );
  p.raiseForStatus();

  try {
    /// json decode
    var data = json.decode(p.content());

    /// get quality list
    List quality = data["quality"];

    /// quality loop
    quality.forEach((_quality) {
      /// get link
      var link = data["s$_quality"];

      /// add data to result list
      if (link != null) result.add(SiteModel(quality: _quality, link: link));
    });

    /// list reverse
    result = result.reversed.toList();

    /// return result list
    return result;
  } catch (_) {
    return null;
  }
}
