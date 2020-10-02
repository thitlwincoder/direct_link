import 'dart:convert';

class Parse {
  tag(String content, String value) {
    value = decode(value);
    var length = content.indexOf(value) + value.length;

    if (content.substring(length, length + 1) == "\"")
      return content.split(value + "\"")[1].split("\"")[0];
    else if (content.substring(length, length + 1) == "\'")
      return content.split(value + "\'")[1].split("\'")[0];
  }

  replace(String content, String one, String two) {
    return content.replaceAll(decode(one), decode(two));
  }

  indexOf(String content, String value) {
    return content.indexOf(decode(value));
  }

  split(String content, String value) {
    return content.split(decode(value))[1];
  }

  decode(String value) {
    return utf8.decode(base64.decode(value));
  }
}
