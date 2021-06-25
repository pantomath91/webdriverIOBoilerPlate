package com.ns.testApp.ingoManager;

import android.app.Activity;
import android.content.Context;
import android.util.Log;

import com.ingomoney.ingosdk.android.manager.GoogleAnalyticsHelper;

//import com.google.analytics.tracking.android.EasyTracker;

/**
 * Created by slohani on 4/6/2021.
 */
public final class IngoGoogleAnalyticsHelper implements GoogleAnalyticsHelper
{

//    @Override
    public void declinedLegalDocument(Context context, String documentTitle) {
        Log.d("Analytics", "declinedLegalDocument "+documentTitle);
    }

    @Override
    public void trackActivityStart(Activity activity)
    {
//        EasyTracker.getInstance(activity).activityStart(activity);
        Log.d("Analytics", "trackActivityStart");
    }

    @Override
    public void trackActivityStop(Activity activity)
    {
//        EasyTracker.getInstance(activity).activityStop(activity);
        Log.d("Analytics", "trackActivityStop");
    }

    @Override
    public void feeTypeSwitched(Context context) {
        Log.d("Analytics", "feeTypeSwitched");
    }

    @Override
    public void attemptedPromo(Context context) {
        Log.d("Analytics", "attemptedPromo");
    }

    @Override
    public void declinedPrivacyPolicy(Context context) {
        Log.d("Analytics", "declinedPrivacyPolicy");
    }

    @Override
    public void declinedTermsAndConditions(Context context) {
        Log.d("Analytics", "declinedTermsAndConditions");
    }

    @Override
    public void promoFailure(Context context) {
        Log.d("Analytics", "promoFailure");
    }

    @Override
    public void promoSuccess(Context context) {
        Log.d("Analytics", "promoSuccess");
    }

    @Override
    public void retakeCheckImage(Context context) {
        Log.d("Analytics", "retakeCheckImage");
    }

    @Override
    public void positiveExperience(Context context) {
        Log.d("Analytics", "positiveExperience");
    }

    @Override
    public void negativeExperience(Context context) {
        Log.d("Analytics", "negativeExperience");
    }

//    @Override
    public void sessionTimeout(Context context) {

    }

//    @Override
    public void exitIngoSDK(Context context) {

    }
}
