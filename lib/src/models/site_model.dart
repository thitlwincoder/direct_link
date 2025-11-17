/// A model containing metadata and download/playback links for a
/// single media item scraped from a website.
///
/// All fields are nullable because scraped data can be incomplete or
/// unavailable for some sites.
class SiteModel {
  /// The human-readable title of the media, if available.
  final String? title;

  /// URL to a thumbnail image for the media, if available.
  final String? thumbnail;

  /// The duration of the media as a human-readable string (for example
  /// "2:15" or "01:03:22"), if available.
  final String? duration;

  /// A list of available quality/download `Link`s for this media.
  final List<Link>? links;

  /// Creates a new [SiteModel].
  ///
  /// All parameters are optional to reflect that scraped results may not
  /// include every piece of metadata.
  SiteModel({this.title, this.thumbnail, this.duration, this.links});

  /// Serializes this model into a JSON-compatible map.
  ///
  /// Useful for sending the data over platform channels, saving to disk,
  /// or returning API responses in a platform-agnostic format.
  Map<String, dynamic> toJson() => {
    'title': title,
    'thumbnail': thumbnail,
    'duration': duration,
    'links': links?.map((x) => x.toJson()).toList(),
  };
}

/// A single downloadable/playable link for a media item.
///
/// Contains a human-friendly quality label, a direct URL to the
/// resource, and an optional `type` (for example a MIME type or file
/// extension hint such as "mp4", "webm", or "audio/mpeg").
class Link {
  /// The quality label (e.g. "720p", "1080p", "low", "audio").
  final String quality;

  /// The direct URL to the media resource.
  final String link;

  /// Optional content type or file extension (for example "mp4").
  final String? type;

  /// Creates a [Link]. `quality` and `link` are required; `type` is
  /// optional because it may not always be present in scraped data.
  Link({required this.quality, required this.link, required this.type});

  /// Serializes this link into a JSON-compatible map.
  Map<String, dynamic> toJson() => {
    'quality': quality,
    'link': link,
    'type': type,
  };
}
