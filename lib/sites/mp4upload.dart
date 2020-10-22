import 'package:direct_link/actions/jsunpacker.dart';
import 'package:direct_link/actions/parse.dart';
import 'package:direct_link/models/site_model.dart';
import 'package:requests/requests.dart';

Future<List<SiteModel>> mp4upload(String url) async {
  List<SiteModel> result = [];
  Parse parse = Parse();

  /// get data from url
  var r = await Requests.get(fixedURL(url));
  r.raiseForStatus();

  /// JSUnPacker
  JSUnPacker jsUnPacker = JSUnPacker(getEvalCode(r.content()));

  /// detect
  if (jsUnPacker.detect()) {
    String src = parse.tag(jsUnPacker.unpack(), "src(");
    if (src != null && src.length > 0) {
      /// add data to result list
      result.add(SiteModel(quality: "url", link: src));
    }

    /// return result list
    return result;
  }
  return null;
}

/// change url link
String fixedURL(String url) {
  if (!url.contains("embed-")) {
    RegExp exp = RegExp("com\/([^']*)");
    var matches = exp.allMatches(url);
    var id = matches.elementAt(0).group(1);
    if (id.contains("/")) id = id.substring(0, id.lastIndexOf("/"));
    url = "https://www.mp4upload.com/embed-" + id + ".html";
  }
  return url;
}

/// get eval code
String getEvalCode(String value) {
  RegExp regex = RegExp("eval(.*)", multiLine: true);
  var matches = regex.allMatches(value);
  return matches.elementAt(0).group(0);
}
