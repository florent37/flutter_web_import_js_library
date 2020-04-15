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
}

void importJsLibrary(String url) {
  ImportJsLibrary.import(url);
}

bool isJsLibraryImported(String url) {
  return ImportJsLibrary.isImported(url);
}
