library direct_link;

import 'package:direct_link/sites/megaup.dart';

import 'actions/exp.dart';
import 'sites/facebook.dart';
import 'sites/mediafire.dart';
import 'sites/youtube.dart';

class DirectLink {
  static check(String url) async {
    Exp exp = Exp();

    if (exp.fb.hasMatch(url)) // check facebook link
      return facebook(url); // return data
    else if (exp.yt.hasMatch(url)) // check youtube link
      return youtube(url);
    else if (exp.mf.hasMatch(url))
      return mediafire(url);
    else if (exp.mup.hasMatch(url))
      return megaup(url);
    else
      return null; // if url is not contain in my support sites return null;
  }
}
