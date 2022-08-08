library direct_link;

import 'dart:convert';

import 'package:html/parser.dart';
import 'package:http/http.dart' as http;

part 'models/site_model.dart';

part 'sites/facebook.dart';

part 'sites/youtube.dart';

part 'sites/vimeo.dart';

part 'sites/imdb.dart';

part 'sites/instagram.dart';

class DirectLink {
  static Future<List<SiteModel>?>? check(String url) {
    if (_facebook.pattern.hasMatch(url)) {
      return _facebook.get(url);
    } else if (_youtube.pattern.hasMatch(url)) {
      return _youtube.get(url);
    } else if (_vimeo.pattern.hasMatch(url)) {
      return _vimeo.get(url);
    } else if (_imdb.pattern.hasMatch(url)) {
      return _imdb.get(url);
    } else if (_instagram.pattern.hasMatch(url)) {
      return _instagram.get(url);
    }
    return null;
  }
}
