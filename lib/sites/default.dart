part of direct_link;

Future<List<SiteModel>> Default(String url) async {
  var result = <SiteModel>[];

  /// add default link to result list
  result.add(SiteModel(quality: 'not found', link: url));

  /// return result list
  return result;
}
