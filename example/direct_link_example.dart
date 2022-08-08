import 'package:direct_link/direct_link.dart';

void main() async {
  var check = await DirectLink.check('https://fb.watch/eMNKASZ4_b/'); // add your url

  if (check != null) {
    for (var element in check) {
      print(element.quality);
      print(element.link);
    }
  }
}
