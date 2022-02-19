import 'package:direct_link/direct_link.dart';

void main() async {
  var check =
      await DirectLink.check('http://www.xnxx.com/video6353832/hot_moms_01_ruru_'); // add your url

  for (var element in check!) {
    print(element.quality);
    print(element.link);
  }
}
