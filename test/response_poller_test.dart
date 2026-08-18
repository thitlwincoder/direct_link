import 'package:direct_link/src/utils/response_poller.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('pollResponseData', () {
    test('returns as soon as parsed response contains links', () async {
      var calls = 0;

      final result = await pollResponseData(
        getHtml: () async {
          calls += 1;
          if (calls == 1) return '<html></html>';
          return '''
            <div class="def-btn-box">
              <a href="https://example.com/video.mp4">Download</a>
            </div>
          ''';
        },
        timeout: const Duration(seconds: 1),
        interval: const Duration(milliseconds: 1),
      );

      expect(result?.links, hasLength(1));
      expect(result?.links?.single.link, 'https://example.com/video.mp4');
      expect(calls, 2);
    });

    test(
      'returns null when timeout expires before links are available',
      () async {
        var calls = 0;

        final result = await pollResponseData(
          getHtml: () async {
            calls += 1;
            return '<html></html>';
          },
          timeout: const Duration(milliseconds: 3),
          interval: const Duration(milliseconds: 1),
        );

        expect(result, isNull);
        expect(calls, greaterThanOrEqualTo(1));
      },
    );

    test('ignores metadata-only responses without links', () async {
      final result = await pollResponseData(
        getHtml: () async => '''
          <div class="info-box">
            <div class="title">Pending video</div>
            <div class="duration">01:23</div>
          </div>
        ''',
        timeout: const Duration(milliseconds: 3),
        interval: const Duration(milliseconds: 1),
      );

      expect(result, isNull);
    });
  });
}
