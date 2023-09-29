part of direct_link;

mixin _social {
  static Future<List<SiteModel>?> get({
    required String url,
    String? executablePath,
    Duration? timeout,
  }) async {
    var result = <SiteModel>[];

    var browser = await puppeteer.launch(
      executablePath: executablePath,
      timeout: timeout,
    );
    var page = await browser.newPage();

    await page.goto('https://en.savefrom.net', wait: Until.networkIdle);

    await page.type('#sf_url', url);
    await page.click('#sf_submit');

    var d = await page.waitForSelector('.info-box');

    var content = await d!.page.content;
    await browser.close();

    var body = parse(content);
    var linkGroup = body.querySelectorAll('.link-group a');

    if (linkGroup.isNotEmpty) {
      for (var e in linkGroup) {
        result.add(parseModel(e));
      }

      return result;
    }

    var single = body.querySelector('.def-btn-box a');
    if (single == null) return result;

    result.add(parseModel(single));
    return result;
  }

  static SiteModel parseModel(Element e) {
    var attr = e.attributes;
    var quality = e.querySelector('span')?.text ?? e.text;

    return SiteModel(
      quality: quality,
      type: attr['data-type'],
      link: attr['href']!,
    );
  }
}
