/// Generates the JavaScript snippet injected into a headless webview.
///
/// The returned string wraps `decodedText` with helper behavior so the
/// script can be executed in a minimal browser-like environment. The
/// wrapper performs two purposes:
///
/// 1. Overrides `decodeURIComponent` to log any decoded payloads that
///    match `/showResult/`, ensuring the relevant JSON is printed to
///    the console where the Dart side can capture it.
/// 2. Defines `globalThis.frameElement` and a stubbed `parent`
///    structure (`parent.document.location`) that log accesses and
///    prevent runtime errors when `decodedText` expects a browser
///    environment.
///
/// Parameters:
/// - `decodedText`: The JavaScript source extracted from the remote
///   response. This string is appended at the end of the wrapper and
///   executed in the headless webview.
///
/// Returns: A `String` containing the full JavaScript source to
/// evaluate inside the webview. The wrapper is intentionally small and
/// focused on producing console output for the payload extraction
/// logic used elsewhere in the package.
String script(String decodedText) {
  return '''
const decodeURIComponentFn = decodeURIComponent.bind(decodeURIComponent)
decodeURIComponent = (uri) => {
  const decoded = decodeURIComponentFn(uri)
  if (/showResult/.test(decoded)) console.log(decoded)
  return decoded
};

Object.defineProperties(globalThis, {
    frameElement: {
        get() {
            console.log({ frameElement: true })
            return true;
        }
    },
    parent: {
        get() {
            console.log({ parent: {} })
            return {
                get document() {
                    console.log({ document: {} })
                    return {
                        get location() {
                            console.log({ location: {} })
                            return {}
                        }
                    }
                }
            }
        }
    }
});

$decodedText
''';
}
