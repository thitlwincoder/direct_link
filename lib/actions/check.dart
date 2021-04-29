part of direct_link;

class DirectLink {
  /// check your link is contained in my supported sites
  static Future<List<SiteModel>> check(String url) {
    /// url RegExp format
    var exp = Exp();

    /// check facebook link
    if (exp.fb.hasMatch(url)) {
      return Facebook(url);
    }

    /// check youtube link
    if (exp.yt.hasMatch(url)) {
      return Youtube(url);
    }

    return Default(url);
  }
}
