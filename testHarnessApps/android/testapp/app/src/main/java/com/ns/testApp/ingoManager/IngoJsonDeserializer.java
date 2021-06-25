package com.ns.testApp.ingoManager;

import com.google.gson.Gson;
import com.ingomoney.ingosdk.android.manager.JsonDeserializer;

/**
 * Created by slohani on 4/6/2021.
 */
public final class IngoJsonDeserializer implements JsonDeserializer
{
    @Override
    public <T> T deserializeJsonIntoType(String json, Class<T> type)
    {
        Gson gson = new Gson();
        T jsonObject = gson.fromJson(json, type);

        return jsonObject;
    }
}
