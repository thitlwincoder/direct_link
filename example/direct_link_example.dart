import 'package:direct_link/direct_link.dart';

void main() async {
  var check = await DirectLink.check('url'); // add your url

  check!.forEach((element) {
    print(element.quality);
    print(element.link);
  });
}
