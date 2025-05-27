package com.example.blockflow_test

import android.content.ContentValues
import android.os.Build
import android.os.Environment
import android.provider.MediaStore
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import java.io.File
import java.io.FileInputStream

class MainActivity : FlutterActivity() {
    private val CHANNEL = "media_store_channel"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            when (call.method) {
                "saveImage" -> {
                    val path = call.argument<String>("path")!!
                    saveMedia(path, "image/jpeg")
                    result.success(null)
                }
                "saveVideo" -> {
                    val path = call.argument<String>("path")!!
                    saveMedia(path, "video/mp4")
                    result.success(null)
                }
                else -> result.notImplemented()
            }
        }
    }

    private fun saveMedia(filePath: String, mimeType: String) {
        val file = File(filePath)
        val filename = file.name

        val values = ContentValues().apply {
            put(MediaStore.MediaColumns.DISPLAY_NAME, filename)
            put(MediaStore.MediaColumns.MIME_TYPE, mimeType)
            put(MediaStore.MediaColumns.RELATIVE_PATH, Environment.DIRECTORY_DCIM + "/Camera")
        }

        val contentUri = if (mimeType.startsWith("video"))
            MediaStore.Video.Media.getContentUri(MediaStore.VOLUME_EXTERNAL_PRIMARY)
        else
            MediaStore.Images.Media.getContentUri(MediaStore.VOLUME_EXTERNAL_PRIMARY)

        val resolver = applicationContext.contentResolver
        val uri = resolver.insert(contentUri, values) ?: return

        resolver.openOutputStream(uri).use { outputStream ->
            FileInputStream(file).use { inputStream ->
                inputStream.copyTo(outputStream!!)
            }
        }
    }
}
