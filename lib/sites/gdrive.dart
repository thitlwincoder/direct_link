part of direct_link;

Future<List<SiteModel>> Gdrive(String url) async {
  var result = <SiteModel>[];

  /// get data from url
  var r = await http.get(Uri.parse(url));

  var map = get(r.body);
  var srx = parse(map!);
  srx.forEach((e) {
    e = 'https:' + convert(e)! + '\"';
    result.add(SiteModel(quality: quality(e)!, link: e));
  });

  /// return result list
  return result;
}

String? get(String content) {
  var exp = RegExp('fmt_stream_map\",(.*?)]');

  for (var match in exp.allMatches(content)) {
    return match[1]!.replaceAll('\"', ',');
  }

  return null;
}

/// get link
List parse(String map) {
  var href = [];
  var exp = RegExp('https:(.*?),');
  for (var match in exp.allMatches(map)) {
    href.add(match.group(1));
  }
  return href;
}

/// get quality
String? quality(String url) {
  if (contain(url, 'itag=37')) {
    return '1080p';
  } else if (contain(url, 'itag=22')) {
    return '720p';
  } else if (contain(url, 'itag=59')) {
    return '480p';
  } else if (contain(url, 'itag=18')) {
    return '360p';
  }
  return null;
}

/// check contain
bool contain(String m, String s) {
  return m.contains(s);
}

/// convert \uxxx to value
String? convert(String e) {
  var key = <String>[];
  var value = <String>[];

  var exp = RegExp('\\u[0-9A-Fa-f]{4}');
  for (var match in exp.allMatches(e)) {
    if (match.group(0) != '') {
      key.add('\\' + match.group(0)!);
    }
  }

  var length = key.length;
  if (length == 0) return null;

  for (var i = 0; i < length; i++) {
    var h = key[i];
    h = h.replaceAll('\\u', '');
    var code = int.parse(h, radix: 16);
    var t = String.fromCharCode(code);
    value.add(t);
  }

  var map = Map<String, String>.fromIterables(key, value);

  var result = map.entries
      .fold(e, (prev, e) => prev!.toString().replaceAll(e.key, e.value));

  return result;
}
