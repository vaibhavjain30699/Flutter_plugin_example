#import "FluttertestingPlugin.h"
#if __has_include(<fluttertesting/fluttertesting-Swift.h>)
#import <fluttertesting/fluttertesting-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "fluttertesting-Swift.h"
#endif

@implementation FluttertestingPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFluttertestingPlugin registerWithRegistrar:registrar];
}
@end
