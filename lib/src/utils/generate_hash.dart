/// Utilities for generating non-deterministic SHA-256 hashes used
/// by the `direct_link` package.
///
/// This file exposes a small helper `generateHash` which produces a
/// hexadecimal SHA-256 digest string based on the provided `url`, the
/// current timestamp in milliseconds, and an internal seed value.
///
/// Example
/// ```dart
/// final token = generateHash('https://example.com/path');
/// print(token); // 64-char hex string
/// ```
library;

import 'dart:convert';

import 'package:crypto/crypto.dart';

/// Internal seed value used as part of the hash input.
///
/// Keep this value private in your system — changing it will change
/// all generated hashes. It is intentionally exposed as a top-level
/// variable here for backwards compatibility; consider making it
/// private (`_hashed`) if you don't need external access.
var hashed = "b7944d7a59c9cb654228624880e7de59a53842c2d912b449fdf11febcf81cb21";

/// Generates a SHA-256 hash string for the given `url`.
///
/// The returned value is the hex representation of the SHA-256 digest
/// computed over the concatenation of:
/// - the provided `url`
/// - the current Unix epoch milliseconds (non-deterministic)
/// - the internal `hashed` seed
///
/// Because the current timestamp is included, calling this function
/// multiple times with the same `url` will produce different hashes.
///
/// Parameters:
/// - `url`: The URL (or any string) to include in the hash input.
///
/// Returns: A 64-character hexadecimal SHA-256 digest string.
String generateHash(String url) {
  var data = '$url${DateTime.now().millisecondsSinceEpoch}$hashed';
  var bytes = utf8.encode(data);
  var digest = sha256.convert(bytes);
  return digest.toString();
}
