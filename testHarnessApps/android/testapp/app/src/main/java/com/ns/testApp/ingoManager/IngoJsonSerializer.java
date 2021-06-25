package com.ns.testApp.ingoManager;

import com.google.gson.Gson;
import com.ingomoney.ingosdk.android.manager.JsonSerializer;

/**
 * Created by slohani on 4/6/2021.
 */
public final class IngoJsonSerializer implements JsonSerializer {
    @Override
    public String serializeJsonObject(Object jsonRequestObject) {
        Gson gson = new Gson();
        String json = gson.toJson(jsonRequestObject);


        return json;
    }
}
