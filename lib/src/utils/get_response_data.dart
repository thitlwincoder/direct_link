import 'dart:convert';
import 'dart:typed_data';

import 'package:brotli/brotli.dart';
import 'package:direct_link/src/utils/generate_hash.dart';
import 'package:http/http.dart' as http;

/// Default HTTP headers used on outgoing requests.
///
/// These headers aim to emulate a modern browser request to avoid
/// unnecessary rejections from some endpoints. They can be copied and
/// modified by callers if needed.
var defaultHeaders = {
  'accept': '*/*',
  'accept-encoding': 'gzip, deflate, br',
  'accept-language': 'en-US,en;q=0.9',
  'sec-ch-ua':
      '"Google Chrome";v="117", "Not;A=Brand";v="8", "Chromium";v="117"',
  'sec-ch-ua-mobile': '?0',
  'sec-fetch-dest': 'empty',
  'sec-fetch-mode': 'cors',
  'sec-fetch-site': 'same-origin',
  'user-agent':
      'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36',
};

/// Sends a POST request with a predefined form to the service and
/// returns the decoded response body.
///
/// Parameters:
/// - `url`: The target URL that will be sent as part of the form and
///   incorporated into the `_s` token via `generateHash`.
///
/// Returns: A `Future<String>` that completes with the decoded
/// response body (UTF-8) after brotli decompression.
///
/// Example:
/// ```dart
/// final data = await getResponseData('https://example.com/video');
/// print(data);
/// ```
Future<String> getResponseData(String url) async {
  var form = {
    'sf_url': url,
    'sf_submit': '',
    'new': '2',
    'lang': 'en',
    'app': '',
    'country': 'en',
    'os': 'Windows',
    'browser': 'Chrome',
    'channel': 'main',
    'sf-nomad': '1',
    'url': url,
    'ts': '${DateTime.now().millisecondsSinceEpoch}',
    '_ts': '1720433117117',
    '_tsc': '0',
    // `_s` is a per-request generated token produced by
    // `generateHash`, which mixes the url, timestamp and a seed.
    '_s': generateHash(url),
    '_x': '1',
  };

  // The service endpoint is stored as a base64-encoded string to
  // avoid embedding the plain URL directly in source code.
  var hash = 'aHR0cHM6Ly93b3JrZXIuc2F2ZWZyb20ubmV0L3NhdmVmcm9tLnBocA==';

  var r = await http.post(
    Uri.parse(utf8.decode(base64.decode(hash))),
    headers: {
      ...defaultHeaders,
      'content-type': 'application/x-www-form-urlencoded',
      'origin': 'https://en.savefrom.net',
      'referer': 'https://en.savefrom.net/',
    },
    body: form,
  );

  // The remote returns brotli-compressed bytes; decode to String.
  return brotli.decodeToString(Uint16List.fromList(r.bodyBytes));
}
