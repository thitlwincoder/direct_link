import 'dart:convert';

import 'package:direct_link/actions/parse.dart';
import 'package:direct_link/models/site_model.dart';
import 'package:requests/requests.dart';

Future<List<SiteModel>> youtube(String url) async {
  List<SiteModel> result = [];
  Parse parse = Parse();

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
    content = parse.replace(content, "Y29kZWNzPSI=", "Y29kZWNzPQ==");

    // get start index
    var start = parse.indexOf(content, "InN0cmVhbWluZ0RhdGEiOg==");

    // get end index
    var end = parse.indexOf(content, "LCJwbGF5YmFja1RyYWNraW5nIg==");

    // transform to json
    content = '{' + content.substring(start, end) + '}';

    // json decode
    var data = json.decode(content.toString());

    // get data
    data = data[parse.decode("c3RyZWFtaW5nRGF0YQ==")];

    for (var item in data[parse.decode("Zm9ybWF0cw==")]) {
      // get label
      var label = parse.decode("cXVhbGl0eUxhYmVs");

      // get url
      var url = parse.decode("dXJs");

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
