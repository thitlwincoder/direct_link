import 'dart:convert';

import 'package:direct_link/models/site_model.dart';
import 'package:requests/requests.dart';

Future<List<SiteModel>> youtube(String url) async {
  List<SiteModel> result = [];

  // get data from url
  var r = await Requests.get(url);
  r.raiseForStatus();

  try {
    // get content
    var content = r.content().replaceAll("\\\"", "\"");

    // content replace
    content = content.replaceAll("\\\\", "");
    content = content.replaceAll("\\\/", "/");
    content = content.replaceAll("\"\"", "\"");
    content = content.replaceAll("\\\\u0026", "&");
    content = content.replaceAll("codecs=\"", "codecs=");
    // get start index
    var start = content.indexOf("\"streamingData\":");

    // get end index
    var end = content.indexOf(",\"playbackTracking\"");

    // transform to json
    content = '{' + content.substring(start, end) + '}';

    // json decode
    var data = json.decode(content.toString());

    // get data
    data = data["streamingData"];

    for (var item in data["formats"]) {
      // get label
      var label = "qualityLabel";

      // get url
      var url = "url";

      if (item[label] != null || item[url] != null)
        // add data to result list
        result
            .add(SiteModel(quality: item[label], link: item[url])); // add data
    }

    // return result list
    return result;
  } catch (_) {
    return null;
  }
}
