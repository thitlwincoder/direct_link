import 'package:direct_link/direct_link.dart';

void main() async {
  var directLink = DirectLink();

  var url = 'https://www.facebook.com/watch/?v=336069382196510';
  var data = await directLink.check(url);

  if (data != null) {
    print(data.title);
    print(data.thumbnail);
    print(data.duration);
    for (var e in data.links!) {
      print(e.type);
      print(e.quality);
      print('-' * 20);
    }
  }
}
