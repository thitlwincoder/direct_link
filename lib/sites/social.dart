part of direct_link;

mixin _social {
  static Future<SiteModel> get({
    required String url,
    String? executablePath,
    Duration? timeout,
  }) async {
    var browser = await puppeteer.launch(
      executablePath: executablePath,
      timeout: timeout,
    );
    var page = await browser.newPage();

    await page.goto('https://en.savefrom.net', wait: Until.networkIdle);

    await page.type('#sf_url', url);
    await page.click('#sf_submit');

    await page.waitForSelector('.info-box');

    var content = await page.content;
    await browser.close();

    var body = parse(content);

    String? thumbnail =
        body.querySelector(".media-result .clip img")?.attributes['src'];

    var info = body.querySelector('.info-box')!;

    String? title = info.querySelector(".title")?.text;
    String? duration = info.querySelector(".duration")?.text;

    var linkGroup = info.querySelectorAll('.link-group a');

    var links = <Link>[];

    if (linkGroup.isNotEmpty) {
      for (var e in linkGroup) {
        links.add(parseModel(e));
      }
    }

    if (links.isEmpty) {
      var single = body.querySelector('.def-btn-box a');
      if (single != null) links.add(parseModel(single));
    }

    return SiteModel(
      title: title,
      thumbnail: thumbnail,
      duration: duration,
      links: links,
    );
  }

  static Link parseModel(Element e) {
    var attr = e.attributes;
    var quality = e.querySelector('span')?.text ?? e.text;

    return Link(
      quality: quality,
      type: attr['data-type'],
      link: attr['href']!,
    );
  }
}
