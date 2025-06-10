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
