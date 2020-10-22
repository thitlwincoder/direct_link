import 'dart:math';

class JSUnPacker {
  final String packedJS;

  JSUnPacker(this.packedJS);

  bool detect() {
    String js = packedJS.replaceAll(" ", "");
    RegExp exp = RegExp("eval\\(function\\(p,a,c,k,e,(?:r|d)");
    return exp.hasMatch(js);
  }

  String unpack() {
    RegExp exp = RegExp(
      "\\}\\s*\\('(.*)',\\s*(.*?),\\s*(\\d+),\\s*'(.*?)'\\.split\\('\\|'\\)",
      dotAll: true,
    );

    var matches = exp.allMatches(packedJS).elementAt(0);

    if (matches.groupCount == 4) {
      String payload = matches.group(1).replaceAll("\\'", "\'");
      String radixStr = matches.group(2);
      String countStr = matches.group(3);
      List sym = matches.group(4).split("\|");

      int radix = 36;
      int count = 0;

      try {
        radix = int.parse(radixStr);
      } catch (e) {}

      try {
        count = int.parse(countStr);
      } catch (e) {}

      if (sym.length != count) {
        throw new Exception("Unknown p.a.c.k.e.r. encoding");
      }

      UnBase unBase = new UnBase(radix);

      exp = RegExp(r"\b\w+\b");
      matches = exp.allMatches(payload).elementAt(0);
      int replaceOffset = 0;

      exp.allMatches(payload).forEach((element) {
        String word = element.group(0);

        String value;

        int x = unBase.unBase(word);

        if (x < sym.length) {
          value = sym[x];
        }

        if (value != null && value.length > 0) {
          payload = payload.replaceRange(element.start + replaceOffset,
              element.end + replaceOffset, value);
          replaceOffset += value.length - word.length;
        }
      });

      return payload;
    }
    return null;
  }
}

class UnBase {
  final String alpha_62 =
      "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
  final String alpha_95 =
      " !\"#\$%&\\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\\\]^_`abcdefghijklmnopqrstuvwxyz{|}~";
  String alphabet;
  Map<String, int> dictionary;
  int radix;

  UnBase(int radix) {
    this.radix = radix;

    if (radix > 36) {
      if (radix < 62)
        alphabet = alpha_62.substring(0, radix);
      else if (radix > 62 && radix < 95)
        alphabet = alpha_95.substring(0, radix);
      else if (radix == 62)
        alphabet = alpha_62;
      else if (radix == 95) alphabet = alpha_95;

      for (int i = 0; i < alphabet.length; i++) {
        dictionary[alphabet.substring(i, i + 1)] = i;
      }
    }
  }

  int unBase(String str) {
    int ret = 0;

    if (alphabet == null) {
      ret = int.parse(str, radix: radix);
    } else {
      for (int i = 0; i < str.length; i++) {
        ret += pow(radix, i) * dictionary[str.substring(i, i + 1)];
      }
    }
    return ret;
  }
}
