#import "MpcDartPlugin.h"
#if __has_include(<mpc_dart/mpc_dart-Swift.h>)
#import <mpc_dart/mpc_dart-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "mpc_dart-Swift.h"
#endif

@implementation MpcDartPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftMpcDartPlugin registerWithRegistrar:registrar];
}
@end
