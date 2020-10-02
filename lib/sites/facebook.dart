import 'package:direct_link/actions/parse.dart';
import 'package:requests/requests.dart';

Future facebook(String url) async {
  Map<String, dynamic> result = {};
  Parse parse = Parse();
  var hd, sd, mp3;

  var r = await Requests.get(url); // get data from url
  r.raiseForStatus();

  hd = parse.tag(r.content(), "hd_src:"); // get hd link
  sd = parse.tag(r.content(), "sd_src:"); // get sd link

  if (!r.content().contains("audio:[]")) {
    mp3 = parse.tag(r.content(), "audio:[{url:"); // get audio link
  }

  if (sd != null) result["sd"] = sd; // add sd
  if (hd != null) result["hd"] = hd; // add hd
  if (mp3 != null) result["mp3"] = mp3; // add mp3

  return result; // return data
}
