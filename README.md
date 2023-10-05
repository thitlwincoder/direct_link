# direct_link

[![pub package](https://img.shields.io/pub/v/direct_link.svg?logo=dart&logoColor=00b9fc)](https://pub.dev/packages/direct_link)
[![Last Commits](https://img.shields.io/github/last-commit/thitlwincoder/direct_link?logo=git&logoColor=white)](https://github.com/thitlwincoder/direct_link/commits/master)
[![GitHub repo size](https://img.shields.io/github/repo-size/thitlwincoder/direct_link)](https://github.com/thitlwincoder/direct_link)
[![License](https://img.shields.io/github/license/thitlwincoder/direct_link?logo=open-source-initiative&logoColor=green)](https://github.com/thitlwincoder/direct_link/blob/master/LICENSE)
<br>
[![Uploaded By](https://img.shields.io/badge/uploaded%20by-thitlwincoder-blue)](https://github.com/thitlwincoder)

For those who want to create a movie and downloader app, this is a useful package.

You can get a direct link from the URL that my support sites.

## Support Websites

- Facebook
- Instagram
- Youtube
- Twitter
- Dailymotion
- Vimeo
- VK
- SoundCloud
- Tiktok
- Reddit
- Threads

## Getting Started

In the `pubspec.yaml` of your flutter project, add the following dependency:

```yaml
dependencies:
  ...
  direct_link: latest
```

In your library add the following import:

```dart
import 'package:direct_link/direct_link.dart';
```

## Usage

Use `check` class to check your link have been existed my support sites

```dart
var directLink = DirectLink();

var data = await directLink.check('url'); // add your url
```

### Example

```dart
if (data != null) {
  print(data.title);
  print(data.thumbnail);
  print(data.duration);
  for (var e in data.links!) {
    print(e.type);
    print(e.quality);
    print(e.link);
    print('-' * 20);
  }
}

```

## Contribution

Feel free to file an [issue](https://github.com/thitlwincoder/direct_link/issues/new) if you find a problem or make pull requests.

All contributions are welcome :)
