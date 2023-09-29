// ignore_for_file: public_member_api_docs, sort_constructors_first
library direct_link;

import 'package:html/dom.dart';
import 'package:html/parser.dart';
import 'package:puppeteer/puppeteer.dart';

part 'models/site_model.dart';
part 'sites/social.dart';

class DirectLink {
  // puppeteer executablePath
  final String? executablePath;

  DirectLink({
    this.executablePath,
  });

  Future<List<SiteModel>?>? check(
    String url, {
    Duration? timeout,
  }) {
    return _social.get(
      url: url,
      timeout: timeout,
      executablePath: executablePath,
    );
  }
}
