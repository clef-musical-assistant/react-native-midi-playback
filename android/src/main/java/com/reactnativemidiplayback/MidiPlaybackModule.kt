package com.reactnativemidiplayback

import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.bridge.ReactContextBaseJavaModule
import com.facebook.react.bridge.ReactMethod
import com.facebook.react.bridge.Promise
import android.media.MediaPlayer

class MidiPlaybackModule(reactContext: ReactApplicationContext) : ReactContextBaseJavaModule(reactContext) {

  private val playbackFile: String = "";
  private val mediaPlayer: MediaPlayer = MediaPlayer();

  override fun getName(): String {
      return "MidiPlayback"
  }

  @ReactMethod
  fun setPlaybackFile(url: String) {
    mediaPlayer.setDataSource(url);
    mediaPlayer.prepare();
  }

  @ReactMethod
  fun play() {
    mediaPlayer.start();
  }

  @ReactMethod
  fun stop() {
    mediaPlayer.stop();
  }

}
