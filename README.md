# direct_link

[![pub package](https://img.shields.io/pub/v/direct_link.svg?logo=dart&logoColor=00b9fc)](https://pub.dev/packages/direct_link)
[![Last Commits](https://img.shields.io/github/last-commit/thitlwincoder/direct_link?logo=git&logoColor=white)](https://github.com/thitlwincoder/direct_link/commits/master)
[![GitHub repo size](https://img.shields.io/github/repo-size/thitlwincoder/direct_link)](https://github.com/thitlwincoder/direct_link)
[![License](https://img.shields.io/github/license/thitlwincoder/direct_link?logo=open-source-initiative&logoColor=green)](https://github.com/thitlwincoder/direct_link/blob/master/LICENSE)
<br>
[![Uploaded By](https://img.shields.io/badge/uploaded%20by-thitlwincoder-blue)](https://github.com/thitlwincoder)

`direct_link` is a Flutter package for extracting direct media links and basic metadata from supported public page URLs.

Use it when you need to build a downloader, media preview, or media utility app that can resolve a shared social/video URL into playable or downloadable links.

## Features

- Extract direct media links from supported websites.
- Return media metadata such as title, thumbnail, and duration when available.
- Return multiple qualities or formats when the source provides them.
- Simple null-safe API with a single `check` method.

## Supported websites

- Facebook
- Instagram
- YouTube
- Twitter/X
- Dailymotion
- Vimeo
- VK
- SoundCloud
- TikTok
- Reddit
- Threads

Support depends on the upstream website response and the extraction service used internally. A supported website can still return `null` when the URL is private, removed, region-blocked, unsupported by the upstream service, or temporarily unavailable.

## Platform support

This package currently depends on Flutter and `flutter_inappwebview`, so it is intended for Flutter apps.

## Screenshot

<img src="https://raw.githubusercontent.com/thitlwincoder/direct_link/master/screenshots/Screenshot_1721194850.png" alt="direct_link example screenshot" width="200"/>

## Installation

Add `direct_link` to your Flutter project's `pubspec.yaml`:

```yaml
dependencies:
  direct_link: ^0.3.3
```

Then run:

```sh
flutter pub get
```

Import the package:

```dart
import 'package:direct_link/direct_link.dart';
```

## Usage

Create a `DirectLink` instance and call `check` with a supported page URL:

```dart
final directLink = DirectLink();

final data = await directLink.check(
  'https://www.youtube.com/watch?v=kzOO_uplPdk',
);

if (data == null) {
  // No media link was found, or the upstream service could not resolve it.
  return;
}

print(data.title);
print(data.thumbnail);
print(data.duration);

for (final link in data.links ?? []) {
  print(link.quality);
  print(link.type);
  print(link.link);
}
```

## API

### `DirectLink.check`

```dart
Future<SiteModel?> check(String url, {double? timeoutInterval});
```

Resolves a supported public page URL into a `SiteModel`.

Returns `null` when no media link can be extracted.

### `SiteModel`

```dart
class SiteModel {
  final String? title;
  final String? thumbnail;
  final String? duration;
  final List<Link>? links;
}
```

### `Link`

```dart
class Link {
  final String quality;
  final String link;
  final String? type;
}
```

## Notes and limitations

- This package resolves public media URLs only.
- Private, deleted, age-restricted, login-required, or region-blocked content may not resolve.
- Website markup and upstream extraction behavior can change without notice.
- The returned link list and quality labels depend on the source website and upstream service response.
- Network-based social website checks are integration tests and are not run by default.

## Testing

Run deterministic unit tests:

```sh
flutter test
```

Run real-site integration tests explicitly:

```sh
flutter test integration_test/social_test.dart
```

Integration tests depend on live third-party websites and may fail because of network issues, rate limits, region restrictions, or upstream website changes.

## Contributing

Issues and pull requests are welcome.

- Report bugs on the [issue tracker](https://github.com/thitlwincoder/direct_link/issues).
- Include a reproducible URL when reporting extraction failures.
- Keep unit tests deterministic. Put live website checks in `integration_test/`.

## License

This package is released under the [MIT License](LICENSE).
