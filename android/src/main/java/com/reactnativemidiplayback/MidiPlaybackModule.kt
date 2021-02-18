package com.reactnativemidiplayback

import android.media.MediaPlayer
import android.net.Uri
import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.bridge.ReactContextBaseJavaModule
import com.facebook.react.bridge.ReactMethod


class MidiPlaybackModule(reactContext: ReactApplicationContext) : ReactContextBaseJavaModule(reactContext) {

  private var mediaPlayer: MediaPlayer = MediaPlayer();

  override fun getName(): String {
      return "MidiPlayback"
  }

  @ReactMethod(isBlockingSynchronousMethod = true)
  fun setPlaybackFile(url: String) {
    val uri = Uri.parse(url);
    val context = reactApplicationContext;
    if (context != null) {
      mediaPlayer = MediaPlayer.create(reactApplicationContext.currentActivity, uri);
      mediaPlayer.setVolume(50F, 50F);
    };
  }

  @ReactMethod(isBlockingSynchronousMethod = true)
  fun play() {
    mediaPlayer.start();
  }

  @ReactMethod
  fun stop() {
    mediaPlayer.stop();
  }

  @ReactMethod
  fun pause() {
    mediaPlayer.pause();
  }

  @ReactMethod(isBlockingSynchronousMethod = true)
  fun isPlaying(): Boolean {
    return mediaPlayer.isPlaying;
  }

}
