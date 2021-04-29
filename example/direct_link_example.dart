import 'package:direct_link/direct_link.dart';

void main() async {
  var check =
      await DirectLink.check('https://www.youtube.com/watch?v=plYw2dzyl1k');

  check.forEach((element) {
    print(element.quality);
    print(element.link);
  });
}
