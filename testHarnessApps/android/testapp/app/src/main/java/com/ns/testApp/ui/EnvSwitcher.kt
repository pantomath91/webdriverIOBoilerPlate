package com.ns.testapp.ui

import android.content.Intent
import android.os.Bundle
import com.iovation.mobile.android.FraudForceManager
import android.widget.ArrayAdapter
import android.widget.AutoCompleteTextView
import android.widget.Button
import androidx.appcompat.app.AppCompatActivity
import com.netspend.sdk.NetspendSdk
import com.ns.testapp.ui.R
import com.ns.testapp.utility.ExampleTheme
import kotlinx.android.synthetic.main.activity_env_switcher.*
import java.util.*

class EnvSwitcher : AppCompatActivity() {
    private val TAG = "EnvSwitcher"
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_env_switcher)
        val environment = resources.getStringArray(R.array.env_name)
        val adapter: ArrayAdapter<String> = ArrayAdapter(
            this,
            R.layout.dropdown_menu_popup_item,
            environment
        )

        val editTextFilledExposedDropdown: AutoCompleteTextView =
            findViewById(R.id.filled_exposed_dropdown)
        val initBtn = findViewById<Button>(R.id.env_submit_btn)
        // Set default environment to testC for mfe testing
        editTextFilledExposedDropdown.setText(environment.get(3))
        editTextFilledExposedDropdown.setAdapter(adapter)
        initBtn.isEnabled = true;
        initBtn.requestFocus();
        initBtn.setOnClickListener { onInitSdkClick() }
    }

    private fun onInitSdkClick() {
        val env = env_selection.editText?.text.toString().toUpperCase(Locale.ROOT).split(" ")[0]
        println("Using environment: $env")
        initSdk(env)
        val i = Intent(this, MainActivity::class.java)
        i.putExtra("env", env)
        startActivity(i)
    }

    private fun initSdk(env: String) {
        // Initialize the Netspend SDK
        NetspendSdk.shared.initialize(
            "NS-$env-ae0bca62bd0244949a171ebf0ba49818",
            ExampleTheme().getTheme(),
            mapOf<String, Any>(
                "mfeActivateCard" to mapOf<String, Any>(
                    "cardImage" to "someBase64encodedUri"
                ),
                "branding" to mapOf<String, Any>(
                    "phoneNumber" to "1-800-267-7080"
                )
            ),
            FraudForceManager().getBlackbox(applicationContext)
        )
    }
}
