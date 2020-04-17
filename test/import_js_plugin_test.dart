import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:import_js_plugin/import_js_plugin.dart';

void main() {
  const MethodChannel channel = MethodChannel('import_js_plugin');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await ImportJsPlugin.platformVersion, '42');
  });
}
