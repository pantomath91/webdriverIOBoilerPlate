package com.ns.testapp.ui

import android.content.Intent
import android.os.Bundle
import android.util.Log
import android.view.View
import android.widget.Button
import android.widget.ListView
import androidx.appcompat.app.AppCompatActivity
import androidx.core.content.ContextCompat
import com.netspend.sdk.NetspendSdkActivity
import com.ns.testapp.ui.R
import kotlinx.android.synthetic.main.activity_main.*
import kotlinx.android.synthetic.main.content_main.*
import java.lang.Exception

class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        supportActionBar?.setDisplayShowHomeEnabled(true);
        supportActionBar?.setDisplayHomeAsUpEnabled(true);
        supportActionBar?.setDisplayUseLogoEnabled(true);
        supportActionBar?.setDisplayShowTitleEnabled(true);
        val initBtn = findViewById<Button>(R.id.test_harness_btn)
        initBtn.setOnClickListener {
            try {
                openPurpose("testHarness", "", hashMapOf("zipCode" to 78701));
            }catch (e:Exception){
                this.mainProgressBar.visibility = View.GONE
                Log.d("ERROR:","Could not load the test harness app ${e.printStackTrace()}")
            }
        }

    }

    // Load the test Harness App
    private fun openPurpose(
        purpose: String,
        passcode: String,
        params: HashMap<String, Any> = hashMapOf()
    ) {
        val intent = Intent(this, SdkActivity::class.java)

        intent.putExtra(NetspendSdkActivity.PURPOSE_NAME, purpose)
        intent.putExtra(NetspendSdkActivity.PASSCODE, passcode)
        intent.putExtra(NetspendSdkActivity.PURPOSE_PARAMS, params)

        ContextCompat.startActivity(this, intent, null)
    }
}
