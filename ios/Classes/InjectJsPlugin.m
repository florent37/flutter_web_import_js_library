#import "InjectJsPlugin.h"
#if __has_include(<inject_js_plugin/inject_js_plugin-Swift.h>)
#import <inject_js_plugin/inject_js_plugin-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "inject_js_plugin-Swift.h"
#endif

@implementation InjectJsPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftInjectJsPlugin registerWithRegistrar:registrar];
}
@end
