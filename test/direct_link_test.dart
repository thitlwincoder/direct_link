import 'package:direct_link/direct_link.dart';
import 'package:test/test.dart';

void main() {
  var directLink = DirectLink();

  test('facebook', () async {
    var url = 'https://www.facebook.com/watch/?v=336069382196510';
    var r = await directLink.check(url);
    expect(r?.links?.length, 2);
  });
  test('youtube', () async {
    var url = 'https://www.youtube.com/watch?v=kzOO_uplPdk';
    var r = await directLink.check(url);
    expect(r?.links?.length, 22);
  });
  test('instagram', () async {
    var url = 'https://www.instagram.com/p/CxqNtWSL_bd';
    var r = await directLink.check(url);
    expect(r?.links?.length, 1);
  });
  test('twitter', () async {
    var url = 'https://twitter.com/i/status/1165444428988743680';
    var r = await directLink.check(url);
    expect(r?.links?.length, 3);
  });
  test('dailymotion', () async {
    var url = 'https://www.dailymotion.com/video/x84th5e';
    var r = await directLink.check(url);
    expect(r?.links?.length, 3);
  });
  test('vk', () async {
    var url = 'https://vk.com/video-213802301_456239563';
    var r = await directLink.check(url);
    expect(r?.links?.length, 14);
  });
  test('tiktok', () async {
    var url =
        'https://www.tiktok.com/@kuronushi_/video/7278649121777421576?is_from_webapp=1&sender_device=pc';
    var r = await directLink.check(url);
    expect(r?.links?.length, 2);
  });
  test('reddit', () async {
    var url =
        'https://www.reddit.com/r/Starfield/comments/16uk98o/someone_stole_my_video_and_uploaded_it_acting/';
    var r = await directLink.check(url);
    expect(r?.links?.length, 5);
  });
}
