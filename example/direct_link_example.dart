import 'package:direct_link/direct_link.dart';

void main() async {
  var check = await DirectLink.check('url'); // add your url

  for (var element in check!) {
    print(element.quality);
    print(element.link);
  }
}
