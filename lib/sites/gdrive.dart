import 'package:direct_link/models/site_model.dart';
import 'package:requests/requests.dart';

Future<List<SiteModel>> gdrive(String url) async {
  List<SiteModel> result = [];

  /// get data from url
  var r = await Requests.get(url);
  r.raiseForStatus();

  var map = get(r.content());
  if (map != null) {
    List srx = parse(map);
    srx.forEach((e) {
      e = "https:" + convert(e) + "\"";
      if (quality(e) != null)

        /// add data to result list
        result.add(SiteModel(quality: quality(e), link: e));
    });
  }

  /// return result list
  return result;
}

String get(String content) {
  RegExp exp = RegExp("fmt_stream_map\",(.*?)]");

  for (var match in exp.allMatches(content)) {
    return match[1].replaceAll("\"", ",");
  }

  return null;
}

/// get link
List parse(String map) {
  List href = [];
  RegExp exp = RegExp("https:(.*?),");
  for (var match in exp.allMatches(map)) {
    href.add(match.group(1));
  }
  return href;
}

/// get quality
String quality(String url) {
  if (contain(url, "itag=37")) {
    return '1080p';
  } else if (contain(url, "itag=22")) {
    return '720p';
  } else if (contain(url, "itag=59")) {
    return '480p';
  } else if (contain(url, "itag=18")) {
    return '360p';
  }
  return null;
}

/// check contain
bool contain(String m, String s) {
  return m.indexOf(s) != -1;
}

/// convert \uxxx to value
String convert(String e) {
  List<String> key = [];
  List<String> value = [];

  RegExp exp = RegExp("\\u[0-9A-Fa-f]{4}");
  for (var match in exp.allMatches(e))
    if (match.group(0) != "") {
      key.add("\\" + match.group(0));
    }

  int length = key.length;
  if (length == 0) return null;

  for (int i = 0; i < length; i++) {
    String h = key[i];
    h = h.replaceAll("\\u", "");
    var code = int.parse(h, radix: 16);
    var t = String.fromCharCode(code);
    value.add(t);
  }

  Map<String, String> map = new Map.fromIterables(key, value);

  String result =
      map.entries.fold(e, (prev, e) => prev.replaceAll(e.key, e.value));

  return result;
}
