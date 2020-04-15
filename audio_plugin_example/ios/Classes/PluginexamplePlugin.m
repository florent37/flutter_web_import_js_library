#import "PluginexamplePlugin.h"
#if __has_include(<pluginexample/pluginexample-Swift.h>)
#import <pluginexample/pluginexample-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "pluginexample-Swift.h"
#endif

@implementation PluginexamplePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftPluginexamplePlugin registerWithRegistrar:registrar];
}
@end
