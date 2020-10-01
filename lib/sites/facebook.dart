import 'package:direct_link/actions/parse.dart';
import 'package:requests/requests.dart';

Future<Facebook> facebook(String url) async {
  Parse parse = Parse();

  var r = await Requests.get(url);
  r.raiseForStatus();

  var hd = parse.tag(r.content(), "hd_src:");
  var sd = parse.tag(r.content(), "sd_src:");

  return Facebook(hd: hd, sd: sd);
}

class Facebook {
  String hd, sd;

  Facebook({this.hd, this.sd});

  @override
  String toString() {
    return '{"hd":"$hd","sd":"$sd"}';
  }
}
