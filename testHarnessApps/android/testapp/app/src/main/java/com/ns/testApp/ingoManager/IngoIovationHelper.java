package com.ns.testApp.ingoManager;

import android.content.Context;

import com.ingomoney.ingosdk.android.manager.IovationHelper;
import com.iovation.mobile.android.FraudForceManager;

/**
 * Created by slohani on 4/6/2021.
 */
public final class IngoIovationHelper implements IovationHelper
{
    /**
     * From iovation:
     * The blackbox returned from ioBegin should never be empty.
     * An empty blackbox or a blackbox consisting only of 0500 indicates that the protection offered by the system may have been compromised.
     *
     * @param context, DevicePrint.ioBegin() needs this
     * @return the Device blackbox as determined by iovation
     */
    @Override
    public String generateIovationBlackbox(Context context)
    {
        FraudForceManager manager = FraudForceManager.getInstance();
        manager.initialize(context);
        manager.refresh(context);
        String deviceID = manager.getBlackbox(context);

        if (deviceID == null || deviceID.equals("0500"))
        {
            throw new RuntimeException("Protection offered by the system may have been compromised!");
        }

        return deviceID;
    }
}
