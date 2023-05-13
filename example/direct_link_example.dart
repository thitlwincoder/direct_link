import 'package:direct_link/direct_link.dart';

void main() async {
  // var check =
  //     await DirectLink.check('https://fb.watch/eMNKASZ4_b/'); // add your url

  // print('Facebook');
  // print('-' * 10);
  // if (check != null) {
  //   for (var element in check) {
  //     print(element.quality);
  //     print(element.link);
  //   }
  // }
  // print('-' * 10);

  var check =
      await DirectLink.check('https://www.youtube.com/watch?v=jGBOsnAHyHk');
  print('Youtube');
  print('-' * 10);
  if (check != null) {
    for (var element in check) {
      print(element.quality);
      print(element.link);
    }
  }
  print('-' * 10);
}
