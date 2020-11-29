import 'dart:async';

import 'package:flutter/foundation.dart';

import 'import_js_library_web.dart';

class ImportJsLibrary {
  static Future<void> import(String url) {
    if (kIsWeb)
      return ImportJsLibraryWeb.import(url);
    else
      return Future.value(null);
  }

  static bool isImported(String url) {
    if (kIsWeb) {
      return ImportJsLibraryWeb.isImported(url);
    } else {
      return false;
    }
  }

  static registerWith(dynamic _) {
    // useful for flutter registrar
  }
}

String _libraryUrl(String url, String pluginName) {
  if (url.startsWith("./")) {
    url = url.replaceFirst("./", "");
    return "./assets/packages/$pluginName/$url";
  }
  if (url.startsWith("assets/")) {
    return "./assets/packages/$pluginName/$url";
  } else {
    return url;
  }
}

void importJsLibrary({required String url, String? flutterPluginName}) {
  if (flutterPluginName == null) {
    ImportJsLibrary.import(url);
  } else {
    ImportJsLibrary.import(_libraryUrl(url, flutterPluginName));
  }
}

bool isJsLibraryImported(String url, {String? flutterPluginName}) {
  if (flutterPluginName == null) {
    return ImportJsLibrary.isImported(url);
  } else {
    return ImportJsLibrary.isImported(_libraryUrl(url, flutterPluginName));
  }
}
