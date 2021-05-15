part of direct_link;

Future<List<SiteModel>> Facebook(String url) async {
  var result = <SiteModel>[];

  var host = 'https://yt1s.com/api/ajaxSearch/facebook';

  // post data to host
  var r = await http.post(Uri.parse(host), body: {'q': url, 'vt': 'facebook'});

  // json decode
  var j = json.decode(r.body);

  // check status is ok
  if (j['status'] == 'ok') {
    // get links
    Map<String, dynamic> links = j['links'];

    // check hd included
    if (links.containsKey('hd')) {
      // add link to result
      result.add(SiteModel(quality: 'hd', link: links['hd']));
    }

    // check sd included
    if (links.containsKey('sd')) {
      // add link to result
      result.add(SiteModel(quality: 'sd', link: links['sd']));
    }

    /// return result list
    return result;
  } else {
    return result;
  }
}
