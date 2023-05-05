package com.example.quick_tile_example

import android.annotation.SuppressLint
import android.content.Intent
import android.os.Build
import android.service.quicksettings.TileService
import android.util.Log
import androidx.annotation.RequiresApi
import io.flutter.embedding.android.FlutterActivity

@SuppressLint("NewApi")
class MyTileService : TileService() {
    override fun onClick() {
        super.onClick()

        try {
            // Open App when user click on Tile
//            val intent = Intent(this, MainActivity::class.java)
//            intent.putExtra("launchFromQuickTile", true)
//            intent.flags = Intent.FLAG_ACTIVITY_NEW_TASK
//            startActivityAndCollapse(intent)

            val newIntent =
                FlutterActivity.withNewEngine().dartEntrypointArgs(listOf("Launch From Quick Tile"))
                    .build(this)
            newIntent.flags = Intent.FLAG_ACTIVITY_NEW_TASK
            startActivityAndCollapse(newIntent)

            // Open System Update when user click on Tile
//            val intent = Intent(Intent.ACTION_MAIN)
//            intent.setClassName(
//                "com.android.settings",
//                "com.android.settings.Settings\$SystemUpdateSettingsActivity"
//            )
//            intent.flags = Intent.FLAG_ACTIVITY_NEW_TASK
//            startActivityAndCollapse(intent)

        } catch (e: Exception) {
            Log.d("debug", "Exception ${e.toString()}")
        }
    }

    override fun onTileRemoved() {
        super.onTileRemoved()
        // Do something when the user removes the Tile
    }

    override fun onTileAdded() {
        super.onTileAdded()

        // Do something when the user add the Tile
    }

    override fun onStartListening() {
        super.onStartListening()

        // Called when the Tile becomes visible
    }

    override fun onStopListening() {
        super.onStopListening()

        // Called when the tile is no longer visible
    }
}