import 'package:direct_link/direct_link.dart';

void main() async {
  var check = await DirectLink.check(
      'https://www.facebook.com/asx.empty/videos/183052913119601/');

  check.forEach((element) {
    print(element.quality);
    print(element.link);
  });
}
