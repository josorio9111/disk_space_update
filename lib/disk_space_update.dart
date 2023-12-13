import 'dart:async';
import 'dart:io';
import 'package:flutter/services.dart';

/// Main class
class DiskSpace {
  /// MethodChannel instance
  static const MethodChannel _channel = MethodChannel('disk_space_update');

  /// Get platform version
  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  /// Get free disk space
  static Future<double?> get getFreeDiskSpace async {
    final double? freeDiskSpace =
        await _channel.invokeMethod('getFreeDiskSpace');
    return freeDiskSpace;
  }

  /// Get Total disk space
  static Future<double?> get getTotalDiskSpace async {
    final double? totalDiskSpace =
        await _channel.invokeMethod('getTotalDiskSpace');
    return totalDiskSpace;
  }

  /// Get free disk space for path
  /// [path] from folder location
  /// [Exception] Specified path does not exist
  static Future<double?> getFreeDiskSpaceForPath(String path) async {
    // verify folder location.
    if (!Directory(path).existsSync()) {
      throw Exception("Specified path does not exist");
    }
    final double? freeDiskSpace =
        await _channel.invokeMethod('getFreeDiskSpaceForPath', {"path": path});
    return freeDiskSpace;
  }
}
