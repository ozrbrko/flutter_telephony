#import "FlutterTelephonyPlugin.h"
#if __has_include(<flutter_telephony/flutter_telephony-Swift.h>)
#import <flutter_telephony/flutter_telephony-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "flutter_telephony-Swift.h"
#endif

@implementation FlutterTelephonyPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterTelephonyPlugin registerWithRegistrar:registrar];
}
@end
