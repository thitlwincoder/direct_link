import 'dart:convert';

import 'package:requests/requests.dart';

Future youtube(String url) async {
  Map<String, dynamic> result = {};

  var r = await Requests.get(url); // get data from url
  r.raiseForStatus();

  var content = r.content().replaceAll("\\\"", "\"");
  content = content.replaceAll("\\\/", "/");
  content = content.replaceAll("\\\\", "");
  content = content.replaceAll("codecs=\"", "codecs=");
  content = content.replaceAll("\\\\u0026", "&");
  content = content.replaceAll("\"\"", "\"");

  var start = content.indexOf('"streamingData":');
  var end = content.indexOf(',"playbackTracking"');

  content = '{' + content.substring(start, end) + '}';
  var data = json.decode(content.toString());
  data = data["streamingData"];

  for (var item in data['formats']) {
    if (item["qualityLabel"] == null || item["url"] == null)
      result[item["qualityLabel"]] = item["url"]; // add data
  }

  return result; // return data
}
