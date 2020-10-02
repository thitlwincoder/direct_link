# direct_link

For those who want to create a movie and downloader app.
This is a useful package. You can get a direct link from the URL that my support sites.

## Support Sites

* Facebook
* Youtube

## Getting Started

In the `pubspec.yaml` of your flutter project, add the following dependency:

```yaml
dependencies:
  ...
  direct_link:
```

Next we need to install this

```sh
# Dart
pub get

# Flutter
flutter packages get
```

In your library add the following import:

```dart
import 'package:direct_link/direct_link.dart';
```

## Usage

Use `check` class to get json data

```dart
var check = await DirectLink.check(url); // add your url
```