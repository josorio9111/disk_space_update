#import "DiskSpaceUpdatePlugin.h"
#import <disk_space_update/disk_space_update-Swift.h>

@implementation DiskSpaceUpdatePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftDiskSpaceUpdatePlugin registerWithRegistrar:registrar];
}
@end