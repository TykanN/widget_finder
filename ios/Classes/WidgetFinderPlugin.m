#import "WidgetFinderPlugin.h"
#if __has_include(<widget_finder/widget_finder-Swift.h>)
#import <widget_finder/widget_finder-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "widget_finder-Swift.h"
#endif

@implementation WidgetFinderPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftWidgetFinderPlugin registerWithRegistrar:registrar];
}
@end
