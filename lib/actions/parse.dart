class Parse {
  tag(String content, String value) {
    var length = content.indexOf(value) + value.length;

    if (content.substring(length, length + 1) == "\"") // check "
      return content.split(value + "\"")[1].split("\"")[0];
    else if (content.substring(length, length + 1) == "\'") // check '
      return content.split(value + "\'")[1].split("\'")[0];
  }
}
