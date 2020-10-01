library direct_link;

import 'package:direct_link/actions/parse.dart';

import 'sites/facebook.dart';

class DirectLink {
  Parse parse = Parse();

  static check(String url) {
    RegExp fb = RegExp("http(s)?://(www\.)?facebook.([a-z]+)");

    if (fb.hasMatch(url)) return facebook(url);
  }
}
