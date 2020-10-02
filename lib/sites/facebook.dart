import 'package:direct_link/actions/parse.dart';
import 'package:requests/requests.dart';

Future facebook(String url) async {
  Map<String, dynamic> result = {};
  Parse parse = Parse();
  var hd, sd, mp3;

  var r = await Requests.get(url); // get data from url
  r.raiseForStatus();

  hd = parse.tag(r.content(), "aGRfc3JjOg==");
  sd = parse.tag(r.content(), "c2Rfc3JjOg==");

  if (!r.content().contains(parse.decode("YXVkaW86W10="))) {
    mp3 = parse.tag(r.content(), "YXVkaW86W3t1cmw6");
  }

  if (sd != null) result["sd"] = sd;
  if (hd != null) result["hd"] = hd;
  if (mp3 != null) result["mp3"] = mp3;

  return result; // return data
}
