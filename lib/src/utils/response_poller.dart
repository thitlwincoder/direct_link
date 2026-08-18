import 'package:direct_link/src/models/site_model.dart';
import 'package:direct_link/src/utils/response_parser.dart';

/// Repeatedly reads response HTML until media links are available or [timeout]
/// expires.
Future<SiteModel?> pollResponseData({
  required Future<String?> Function() getHtml,
  Duration timeout = const Duration(seconds: 10),
  Duration interval = const Duration(milliseconds: 500),
}) async {
  final deadline = DateTime.now().add(timeout);

  while (!DateTime.now().isAfter(deadline)) {
    final model = parseResponseData(await getHtml());
    if (model?.links?.isNotEmpty ?? false) return model;

    final remaining = deadline.difference(DateTime.now());
    if (remaining <= Duration.zero) break;

    await Future<void>.delayed(remaining < interval ? remaining : interval);
  }

  return null;
}
