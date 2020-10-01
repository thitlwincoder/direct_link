# direct_link

Direct Link Extractor From URL

## Support Sites

* Facebook

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