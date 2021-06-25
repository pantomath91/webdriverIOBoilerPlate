package com.ns.testapp.ui

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.os.Handler
import android.os.Looper
import com.ns.testapp.ui.R

class SplashActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_splash)
        Handler(Looper.getMainLooper()).postDelayed({
            //  This method will be executed once the timer is over
            val i = Intent(
                this@SplashActivity,
                AboutActivity::class.java
            )
            startActivity(i)
            finish()
        }, 3000)

    }
}
