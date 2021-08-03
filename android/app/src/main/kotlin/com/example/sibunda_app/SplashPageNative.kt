package com.example.sibunda_app

import android.content.Context
import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import io.flutter.embedding.android.SplashScreen

class SplashPageNative: SplashScreen {
  /**
   * Creates a `View` to be displayed as a splash screen before Flutter renders its first
   * frame.
   *
   *
   * This method can be called at any time, and may be called multiple times depending on Android
   * configuration changes that require recreation of a view hierarchy. Implementers that provide a
   * stateful splash view, such as one with animations, should take care to migrate that animation
   * state from the previously returned splash view to the newly created splash view.
   */
  override fun createSplashView(context: Context, savedInstanceState: Bundle?): View? =
    LayoutInflater.from(context).inflate(R.layout.splash_page_native, null, false)

  /**
   * Invoked by Flutter when Flutter has rendered its first frame, and would like the `splashView` to disappear.
   *
   *
   * The provided `onTransitionComplete` callback must be invoked when the splash `View` has finished transitioning itself away. The splash `View` will be removed and
   * destroyed when the callback is invoked.
   */
  override fun transitionToFlutter(onTransitionComplete: Runnable) {
    // Immediately invoke onTransitionComplete because this SplashScreen
    // doesn't display a transition animation.
    //
    // Every SplashScreen *MUST* invoke onTransitionComplete at some point
    // for the splash system to work correctly.
    onTransitionComplete.run()
  }
}