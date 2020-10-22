import 'package:direct_link/models/site_model.dart';

class Parse {
  /// check tag and split
  String tag(String content, String value) {
    var length = content.indexOf(value) + value.length;

    if (content.substring(length, length + 1) == "\"")
      return content.split(value + "\"")[1].split("\"")[0];
    else if (content.substring(length, length + 1) == "\'")
      return content.split(value + "\'")[1].split("\'")[0];

    return null;
  }

  /// split code
  String string(String value, {String code}) {
    return value.split(code ?? "<")[0];
  }

  /// get quality
  int quality(SiteModel value) {
    return int.parse(value.quality.substring(0, value.quality.length - 1));
  }
}
