part of '../direct_link_impl.dart';

mixin _Social {
  static Future<SiteModel?> get({
    required String url,
    String? executablePath,
    Duration? timeout,
  }) async {
    if (kIsWeb || Platform.isAndroid || Platform.isIOS) {
      return _getWithInAppWebView(url: url);
    }

    return _getWithPuppeteer(
      url: url,
      timeout: timeout,
      executablePath: executablePath,
    );
  }

  static Future<SiteModel?> _getWithPuppeteer({
    required String url,
    String? executablePath,
    Duration? timeout,
  }) async {
    var browser = await puppeteer.launch(
      executablePath: executablePath,
      timeout: timeout,
    );
    var page = await browser.newPage();

    await page.goto('https://en.savefrom.net/', wait: Until.networkIdle);

    await page.type('#sf_url', url);
    await page.click('#sf_submit');

    await page.waitForSelector(
      '#sf_result > .media-result',
      timeout: Duration(seconds: 10),
    );

    var content = await page.content;
    await browser.close();

    return _parseContent(content);
  }

  static Future<SiteModel?> _getWithInAppWebView({required String url}) async {
    final Completer<SiteModel?> model = Completer<SiteModel?>();

    HeadlessInAppWebView(
      initialSettings: InAppWebViewSettings(
        incognito: true,
        useOnLoadResource: true,
        isInspectable: kDebugMode,
        mediaPlaybackRequiresUserGesture: false,
        javaScriptCanOpenWindowsAutomatically: true,
      ),
      initialUrlRequest: URLRequest(url: WebUri('https://en.savefrom.net/')),
      onLoadStop: (controller, uri) async {
        await controller.evaluateJavascript(source: '''
          document.querySelector('#sf_url').value = '$url'
          document.querySelector('#sf_submit').click()
        ''');

        var data = await Future.delayed(
          Duration(seconds: 10),
          () async {
            var content = await controller.getHtml();
            return _parseContent(content);
          },
        );
        if (!model.isCompleted) model.complete(data);
      },
    )
      ..run()
      ..dispose();
    return model.future;
  }

  static Link _parseLink(Element e) {
    var attr = e.attributes;
    var quality = e.querySelector('span')?.text ?? e.text;

    return Link(quality: quality, link: attr['href']!, type: attr['data-type']);
  }

  static SiteModel? _parseContent(String? content) {
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

    String? thumbnail =
        body.querySelector(".media-result .clip img")?.attributes['src'];

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
}
