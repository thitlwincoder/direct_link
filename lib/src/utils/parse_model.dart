import 'package:direct_link/direct_link.dart';

/// Helpers to convert the decoded JSON payload returned by the
/// remote service into package models.
///
/// The expected input `map` is the JSON object extracted from the
/// JavaScript callback and should contain at least:
/// - `meta`: an object containing metadata such as `title` and
///   `duration`.
/// - `url`: an array of link objects where each entry includes
///   `url`, `type` and optionally `quality`.
/// - `thumb`: a thumbnail URL string.
///
/// This function constructs a `SiteModel` and a list of `Link`
/// objects by iterating over the `url` entries. It forwards the raw
/// values from the map into the model; callers should ensure the map
/// conforms to the expected structure (the function will throw if
/// required fields are missing or have unexpected types).
///
/// Example:
/// ```dart
/// final model = parseModel(decodedJsonMap);
/// print(model.title);
/// ```
SiteModel parseModel(Map<String, dynamic> map) {
  var meta = map['meta'];
  var url = map['url'];

  var links = <Link>[];

  for (var i = 0; i < url.length; i++) {
    var data = url[i];
    links.add(
      .new(
        link: data['url'],
        type: data['type'],
        quality: data['quality'] ?? 'sd',
      ),
    );
  }

  return .new(
    links: links,
    title: meta['title'],
    thumbnail: map['thumb'],
    duration: meta['duration'],
  );
}
