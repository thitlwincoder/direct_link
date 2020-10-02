library direct_link;

import 'actions/exp.dart';
import 'sites/facebook.dart';
import 'sites/youtube.dart';

class DirectLink {
  static check(String url) async {
    Exp exp = Exp();

    if (exp.fb.hasMatch(url)) // check facebook link
      return facebook(url); // return data
    if (exp.yt.hasMatch(url)) // check youtube link
      return youtube(url);
    else
      return null; // if url is not contain in my support sites return null;
  }
}
