import 'dart:convert';

class Parse {
  String tag(String content, String value) {
    value = decode(value);
    var length = content.indexOf(value) + value.length;

    if (content.substring(length, length + 1) == "\"")
      return content.split(value + "\"")[1].split("\"")[0];
    else if (content.substring(length, length + 1) == "\'")
      return content.split(value + "\'")[1].split("\'")[0];
  }

  String replace(String content, String one, String two) {
    return content.replaceAll(decode(one), decode(two));
  }

  int indexOf(String content, String value) {
    return content.indexOf(decode(value));
  }

  String split(String content, String value) {
    return content.split(decode(value))[1];
  }

  List splitList(String content, String value) {
    return content.split(decode(value));
  }

  String decode(String value) {
    return utf8.decode(base64.decode(value));
  }
}
