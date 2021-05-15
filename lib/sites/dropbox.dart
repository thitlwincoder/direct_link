part of direct_link;

Future<List<SiteModel>> Dropbox(String url) async {
  var result = <SiteModel>[];

  /// replace with download format
  var link = url.replaceAll('www', 'dl');

  /// replace with download format
  link = link.replaceAll('dropbox', 'dropboxusercontent');

  /// add to result list
  result.add(SiteModel(quality: 'url', link: link));

  /// return result list
  return result;
}
