library direct_link;

import 'actions/exp.dart';
import 'models/site_model.dart';
import 'sites/dropbox.dart';
import 'sites/facebook.dart';
import 'sites/mediafire.dart';
import 'sites/megaup.dart';
import 'sites/pcloud.dart';
import 'sites/solidfiles.dart';
import 'sites/youtube.dart';

class DirectLink {
  const DirectLink();

  static Future<List<SiteModel>> check(String url) {
    Exp exp = Exp();

    if (exp.fb.hasMatch(url)) // check facebook link
      return facebook(url);
    else if (exp.yt.hasMatch(url)) // check youtube link
      return youtube(url);
    else if (exp.mf.hasMatch(url)) // check mediafire link
      return mediafire(url);
    else if (exp.mup.hasMatch(url)) // check megaup link
      return megaup(url);
    else if (exp.db.hasMatch(url)) // check dropbox link
      return dropbox(url);
    else if (exp.sf.hasMatch(url)) // check solidfiles link
      return solidfiles(url);
    else if (exp.pc.hasMatch(url)) // check pcloud link
      return pcloud(url);
    else
      return null; // if url is not contain in my support sites return null;
  }
}
