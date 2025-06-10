import 'dart:convert';

import 'package:crypto/crypto.dart';

var hashed = "b7944d7a59c9cb654228624880e7de59a53842c2d912b449fdf11febcf81cb21";

String generateHash(String url) {
  var data = '$url${DateTime.now().millisecondsSinceEpoch}$hashed';
  var bytes = utf8.encode(data);
  var digest = sha256.convert(bytes);
  return digest.toString();
}
