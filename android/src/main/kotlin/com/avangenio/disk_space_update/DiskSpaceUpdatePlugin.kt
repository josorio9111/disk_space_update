package com.avangenio.disk_space_update

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodChannel

class DiskSpaceUpdatePlugin : FlutterPlugin {
  companion object {
    private var channel: MethodChannel? = null
    private val handler: MethodHandlerImpl = MethodHandlerImpl()

    private fun registerChannel(messenger: BinaryMessenger) {
      channel = MethodChannel(messenger, "disk_space_update")
      channel?.setMethodCallHandler(handler)
    }
  }

  override fun onAttachedToEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    registerChannel(binding.binaryMessenger)
  }

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    channel?.setMethodCallHandler(null)
    channel = null
  }
}