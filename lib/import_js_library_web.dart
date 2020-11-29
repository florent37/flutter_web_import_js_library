import 'dart:async';
import 'dart:html' as html;

class ImportJsLibraryWeb {
  /// Injects the library by its [url]
  static Future<void> import(String url) {
    return _importJSLibraries([url]);
  }

  static html.ScriptElement _createScriptTag(String library) {
    final html.ScriptElement script = html.ScriptElement()
      ..type = "text/javascript"
      ..charset = "utf-8"
      ..async = true
      //..defer = true
      ..src = library;
    return script;
  }

  /// Injects a bunch of libraries in the <head> and returns a
  /// Future that resolves when all load.
  static Future<void> _importJSLibraries(List<String> libraries) {
    final List<Future<void>> loading = <Future<void>>[];
    final head = html.querySelector('head');

    libraries.forEach((String library) {
      if (!isImported(library)) {
        final scriptTag = _createScriptTag(library);
        head!.children.add(scriptTag);
        loading.add(scriptTag.onLoad.first);
      }
    });

    return Future.wait(loading);
  }

  static bool _isLoaded(html.Element head, String url) {
    if (url.startsWith("./")) {
      url = url.replaceFirst("./", "");
    }
    for (var element in head.children) {
      if (element is html.ScriptElement) {
        if (element.src.endsWith(url)) {
          return true;
        }
      }
    }
    return false;
  }

  static bool isImported(String url) {
    final head = html.querySelector('head')!;
    return _isLoaded(head, url);
  }
}
