package com.ns.testapp.utility

import android.app.Activity
import android.app.AlertDialog
import android.text.TextUtils
import android.widget.Toast
import com.ns.testapp.ui.R

var Activity.showToast: String?
    get() = showToast
    set(value) {
        if (!TextUtils.isEmpty(value))
            Toast.makeText(this, value, Toast.LENGTH_SHORT).show()
    }

var Activity.showMessageDialog: String
    get() = showMessageDialog
    set(value) {
        if (!TextUtils.isEmpty(value)) {
            AlertDialog.Builder(this).apply {
                setMessage(value)
                setNeutralButton(getString(R.string.ok)) { dialog, which ->
                    dialog.dismiss()
                }.create().show()
            }

        }
    }
