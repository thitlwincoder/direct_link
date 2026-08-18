import 'package:direct_link/src/utils/response_parser.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('parses direct result block', () {
    final result = parseResponseData('''
      <div id="sf_result">
        <img src="https://example.com/thumb.jpg">
        <div class="row" title="Example video"></div>
        <div class="def-btn-box">
          <a href="https://example.com/video.mp4">Download</a>
        </div>
      </div>
    ''');

    expect(result?.title, 'Example video');
    expect(result?.thumbnail, 'https://example.com/thumb.jpg');
    expect(result?.links, hasLength(1));
    expect(result?.links?.single.quality, '720p');
    expect(result?.links?.single.type, 'mp4');
    expect(result?.links?.single.link, 'https://example.com/video.mp4');
  });

  test('parses info-box link groups', () {
    final result = parseResponseData('''
      <div class="media-result">
        <div class="clip"><img src="https://example.com/poster.jpg"></div>
      </div>
      <div class="info-box">
        <div class="title">Grouped video</div>
        <div class="duration">01:23</div>
        <div class="link-group">
          <a href="https://example.com/720.mp4" data-type="mp4"><span>720p</span></a>
          <a href="https://example.com/audio.mp3" data-type="mp3">Audio</a>
        </div>
      </div>
    ''');

    expect(result?.title, 'Grouped video');
    expect(result?.duration, '01:23');
    expect(result?.thumbnail, 'https://example.com/poster.jpg');
    expect(result?.links, hasLength(2));
    expect(result?.links?.first.quality, '720p');
    expect(result?.links?.last.quality, 'Audio');
  });
}
