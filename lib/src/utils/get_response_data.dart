import 'dart:async';

import 'package:direct_link/direct_link.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:html/dom.dart';
import 'package:html/parser.dart';

/// Sends a POST request with a predefined form to the service and
/// returns the decoded response body.
///
/// Parameters:
/// - `url`: The target URL that will be sent as part of the form and
///   incorporated into the `_s` token via `generateHash`.
///
/// Returns: A `Future<String>` that completes with the decoded
/// response body (UTF-8) after brotli decompression.
///
/// Example:
/// ```dart
/// final data = await getResponseData('https://example.com/video');
/// print(data);
/// ```
Future<SiteModel?> getResponseData(
  String url, {
  double? timeoutInterval,
}) async {
  final Completer<SiteModel?> model = Completer<SiteModel?>();

  HeadlessInAppWebView(
      initialSettings: .new(
        incognito: true,
        useOnLoadResource: true,
        mediaPlaybackRequiresUserGesture: false,
        javaScriptCanOpenWindowsAutomatically: true,
      ),
      initialUrlRequest: URLRequest(
        url: WebUri('https://en.savefrom.net/'),
        timeoutInterval: timeoutInterval,
      ),
      onLoadStop: (controller, uri) async {
        await controller.evaluateJavascript(
          source:
              '''
          document.querySelector('#sf_url').value = '$url'
          document.querySelector('#sf_submit').click()
        ''',
        );

        var data = await Future.delayed(Duration(seconds: 10), () async {
          var content = await controller.getHtml();
          return _parseContent(content);
        });
        if (!model.isCompleted) model.complete(data);
      },
    )
    ..run()
    ..dispose();
  return model.future;
}

SiteModel? _parseContent(String? content) {
  var body = parse(content);

  var result = body.querySelector('#sf_result');
  if (result != null) {
    var thumbnail = result.querySelector('img')?.attributes['src'];
    var title = result.querySelector('.row')?.attributes['title'];
    var href = result.querySelector('.def-btn-box > a')?.attributes['href'];

    return SiteModel(
      title: title,
      thumbnail: thumbnail,
      links: [Link(link: href!, quality: '720p', type: 'mp4')],
    );
  }

  String? thumbnail = body
      .querySelector(".media-result .clip img")
      ?.attributes['src'];

  var info = body.querySelector('.info-box');

  String? title = info?.querySelector(".title")?.text;
  String? duration = info?.querySelector(".duration")?.text;

  var linkGroup = info?.querySelectorAll('.link-group a') ?? [];

  var links = <Link>[];

  if (linkGroup.isNotEmpty) {
    for (var e in linkGroup) {
      links.add(_parseLink(e));
    }
  }

  if (links.isEmpty) {
    var single = body.querySelector('.def-btn-box a');
    if (single != null) links.add(_parseLink(single));
  }

  return SiteModel(
    title: title,
    links: links,
    duration: duration,
    thumbnail: thumbnail,
  );
}

Link _parseLink(Element e) {
  var attr = e.attributes;
  var quality = e.querySelector('span')?.text ?? e.text;

  return Link(quality: quality, link: attr['href']!, type: attr['data-type']);
}
