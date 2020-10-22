import 'dart:convert';

import 'package:direct_link/actions/parse.dart';
import 'package:direct_link/models/site_model.dart';
import 'package:requests/requests.dart';

Future<List<SiteModel>> vimeo(String url) async {
  List<SiteModel> result = [];
  Parse parse = Parse();

  try {
    /// get data from url
    var r = await Requests.get(url);
    r.raiseForStatus();

    /// get html data
    var html =
        r.content().split("clip_page_config = ")[1].split("}};")[0] + "}}";

    /// json decode
    var data = json.decode(html);

    /// get config
    var config = data["player"]["config_url"];

    /// get data from config url
    r = await Requests.get(config);
    r.raiseForStatus();

    /// json decode
    data = json.decode(r.content());

    /// get progressive
    List progressive = data["request"]["files"]["progressive"];

    /// list for each
    progressive.forEach((_progressive) {
      /// get quality
      String quality = _progressive["quality"];

      /// get link
      var link = _progressive["url"];

      /// add data to result list
      result.add(SiteModel(quality: quality, link: link));
    });

    /// result list sort by quality
    result.sort((a, b) => parse.quality(a).compareTo(parse.quality(b)));

    /// return result list
    return result;
  } catch (_) {
    return null;
  }
}
