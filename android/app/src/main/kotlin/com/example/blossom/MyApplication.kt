package com.example.blossom

import co.ab180.airbridge.flutter.AirbridgeFlutter
import io.flutter.app.FlutterApplication

class MainApplication: FlutterApplication() {
    override fun onCreate() {
        super.onCreate()
        AirbridgeFlutter.init(this, "noel1", "d12cf30219bd4fe9a774b8e97510a30f")
    }
}