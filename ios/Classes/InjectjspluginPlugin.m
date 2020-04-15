#import "InjectjspluginPlugin.h"
#if __has_include(<injectjsplugin/injectjsplugin-Swift.h>)
#import <injectjsplugin/injectjsplugin-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "injectjsplugin-Swift.h"
#endif

@implementation InjectjspluginPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftInjectjspluginPlugin registerWithRegistrar:registrar];
}
@end
