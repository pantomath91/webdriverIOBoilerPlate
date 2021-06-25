package com.ns.testapp.base

import android.app.AlertDialog
import android.app.ProgressDialog
import android.content.Intent
import android.os.Bundle
import android.util.Log
import android.view.inputmethod.InputMethodManager
import android.widget.Toast
import androidx.annotation.CallSuper
import androidx.appcompat.app.AppCompatActivity
import com.ns.testapp.ui.R

abstract class BaseActivity : AppCompatActivity() {
    private var mProgressDialog: ProgressDialog? = null
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(contentView)
        onViewReady(savedInstanceState, intent)
    }

    @CallSuper
    protected fun onViewReady(savedInstanceState: Bundle?, intent: Intent?) {
        //To be used by child activities
    }

    override fun onDestroy() {
        super.onDestroy()
    }

    protected fun hideKeyboard() {
        try {
            val imm = getSystemService(INPUT_METHOD_SERVICE) as InputMethodManager
            if (currentFocus != null) imm.hideSoftInputFromWindow(currentFocus!!.windowToken, 0)
        } catch (e: Exception) {
            Log.e("MultiBackStack", "Failed to add fragment to back stack", e)
        }
    }

    fun noInternetConnectionAvailable() {
        showToast(getString(R.string.noNetworkFound))
    }

    protected fun showBackArrow() {
        val supportActionBar = supportActionBar
        if (supportActionBar != null) {
            supportActionBar.setDisplayHomeAsUpEnabled(true)
            supportActionBar.setDisplayShowHomeEnabled(true)
        }
    }

    fun showProgressDialog(title: String?, message: String) {
        if (mProgressDialog == null) {
            mProgressDialog = ProgressDialog(this)
            if (title != null) mProgressDialog!!.setTitle(title)
            mProgressDialog!!.setIcon(R.mipmap.ic_launcher)
            mProgressDialog!!.setProgressStyle(ProgressDialog.STYLE_SPINNER)
            mProgressDialog!!.setCancelable(false)
        }
        if (!mProgressDialog!!.isShowing) {
            mProgressDialog!!.setMessage(message)
            mProgressDialog!!.show()
        }
    }

    fun hideDialog() {
        if (mProgressDialog != null && mProgressDialog!!.isShowing) {
            mProgressDialog!!.dismiss()
        }
    }

    protected fun showAlertDialog(msg: String?) {
        val dialogBuilder = AlertDialog.Builder(this)
        dialogBuilder.setTitle(null)
        dialogBuilder.setIcon(R.mipmap.ic_launcher)
        dialogBuilder.setMessage(msg)
        dialogBuilder.setPositiveButton(getString(R.string.dialog_ok_btn)) { dialog, which -> dialog.cancel() }
        dialogBuilder.setCancelable(false)
        dialogBuilder.show()
    }

    protected fun showToast(mToastMsg: String?) {
        Toast.makeText(this, mToastMsg, Toast.LENGTH_LONG).show()
    }

    protected abstract val contentView: Int
}
