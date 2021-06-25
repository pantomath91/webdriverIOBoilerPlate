package com.ns.testapp.ui

import android.util.Log
import com.netspend.sdk.NetspendSdkActivity
import com.netspend.sdk.NetspendSdkPurposeState

class SdkActivity : NetspendSdkActivity() {
    override fun onNetspendSdkEvent(event: String, data: Map<String, Any>)  {
        Log.d("[NetspendSDK]", "Received event from current NetspendSdk purpose: $event")
        Log.d("[NetspendSDK]","onNetspendSdkEvent data: $data")
    }

    override fun onNetspendSdkStateChange(state: NetspendSdkPurposeState, data: Map<String, Any>){
        when(state) {
            NetspendSdkPurposeState.STARTED -> {
                Log.d("[NetspendSDK]", "Purpose $purposeName has been started!")
                Log.d("[NetspendSDK]", "NetspendSdkPurposeState.STARTED data: $data")
            }

            NetspendSdkPurposeState.CANCELLED -> {
                Log.d("[NetspendSDK]","Purpose $purposeName was requested to be cancelled by the user!")
                finish()
            }

            NetspendSdkPurposeState.ERROR -> {
                Log.d("[NetspendSDK]","Purpose $purposeName encountered an error!")
                Log.d("[NetspendSDK]", "NetspendSdkPurposeState.ERROR data: $data")
                finish()
            }

            NetspendSdkPurposeState.SUCCESS -> {
                Log.d("[NetspendSDK]", "Purpose $purposeName was successful!")
                Log.d("[NetspendSDK]","NetspendSdkPurposeState.SUCCESS data: $data")
                finish()
            }
        }
    }
}
