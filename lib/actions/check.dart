part of direct_link;

class DirectLink {
  /// check your link is contained in my supported sites
  static Future<List<SiteModel>>? check(String url) {
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

    /// check vimeo link
    if (exp.vi.hasMatch(url)) {
      return Vimeo(url);
    }

    /// check dailymotion link
    if (exp.dm.hasMatch(url)) {
      return DailyMotion(url);
    }

    /// check pcloud link
    if (exp.pc.hasMatch(url)) {
      return PCloud(url);
    }

    /// check megaup link
    if (exp.mup.hasMatch(url)) {
      return Megaup(url);
    }

    /// check dropbox link
    if (exp.db.hasMatch(url)) {
      return Dropbox(url);
    }

    /// check solidfile link
    if (exp.sf.hasMatch(url)) {
      return SolidFiles(url);
    }

    /// check mediafire link
    if (exp.mf.hasMatch(url)) {
      return Mediafire(url);
    }

    /// check gdrive link
    if (exp.gd.hasMatch(url)) {
      return GDrive(url);
    }

    /// check xnxx link
    if (exp.xn.hasMatch(url)) {
      return Xnxx(url);
    }

    /// check xhamster link
    if (exp.xh.hasMatch(url)) {
      return Xhamster(url);
    }

    /// check instagram link
    if (exp.inst.hasMatch(url)) {
      return Instagram(url);
    }

    /// check imdb link
    if (exp.imdb.hasMatch(url)) {
      return IMDB(url);
    }

    return null;
  }
}
