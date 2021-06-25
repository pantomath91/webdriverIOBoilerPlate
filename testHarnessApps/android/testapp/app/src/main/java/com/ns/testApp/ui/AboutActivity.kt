package com.ns.testapp.ui

import android.content.Intent
import android.os.Bundle
import android.widget.Button
import com.ns.testapp.base.BaseActivity

class AboutActivity: BaseActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        val initBtn = findViewById<Button>(R.id.about_continue_btn)
        initBtn.setOnClickListener { gotoLoginPage()}
    }

    override val contentView: Int
        get() = R.layout.about_screen

    private fun gotoLoginPage() {
        val i = Intent(this, EnvSwitcher::class.java)
        startActivity(i)
    }

}
