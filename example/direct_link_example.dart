import 'package:direct_link/direct_link.dart';

void main() async {
  var directLink = DirectLink();

  var url = 'https://www.facebook.com/watch/?v=336069382196510';
  var check = await directLink.check(url);

  if (check != null) {
    for (var element in check) {
      print(element.quality);
      print(element.type);
      print(element.link);
      print('-' * 10);
    }
  }
}
