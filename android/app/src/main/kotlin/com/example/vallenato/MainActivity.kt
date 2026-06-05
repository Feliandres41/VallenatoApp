package com.example.vallenato

import android.os.Bundle
import android.view.WindowManager
import androidx.core.view.WindowCompat
import io.flutter.embedding.android.FlutterActivity

class MainActivity : FlutterActivity() {
	override fun onCreate(savedInstanceState: Bundle?) {
		super.onCreate(savedInstanceState)
		// Try ADJUST_NOTHING to avoid window resizing during IME animations.
		// Keep window animations disabled. Also opt out of decor fits so
		// the app controls layout and avoids framework resizes during IME.
		window.setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_ADJUST_NOTHING)
		window.setWindowAnimations(0)
		WindowCompat.setDecorFitsSystemWindows(window, false)
	}
}
