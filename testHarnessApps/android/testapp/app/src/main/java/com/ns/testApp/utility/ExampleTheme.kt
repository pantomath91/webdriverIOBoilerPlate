package com.ns.testapp.utility

import com.netspend.sdk.NetspendSDKTheme
import com.netspend.sdk.NetspendSdkColorPalette

data class ExampleTheme(var void: Unit = Unit) {
    fun getTheme(): NetspendSDKTheme {
        return NetspendSDKTheme(
            neutralColor = NetspendSdkColorPalette(
                color50 = "#FAFAFA",
                color100 = "#F5F5F5",
                color200 = "#EEEEEE",
                color300 = "#E0E0E0",
                color400 = "#BDBDBD",
                color500 = "#9E9E9E",
                color600 = "#757575",
                color700 = "#616161",
                color800 = "#424242",
                color900 = "#212121"
            ),
            defaultColor = NetspendSdkColorPalette(
                color50 = "#E8EEEF",
                color100 = "#D1DDDE",
                color200 = "#A3BABE",
                color300 = "#76989D",
                color400 = "#48757D",
                color500 = "#1A535C",
                color600 = "#15424A",
                color700 = "#103237",
                color800 = "#0A2125",
                color900 = "#051112"
            ),
            accentColor = NetspendSdkColorPalette(
                color50 = "#EEFAF9",
                color100 = "#DCF5F3",
                color200 = "#B8EBE7",
                color300 = "#95E1DC",
                color400 = "#71D7D0",
                color500 = "#4ECDC4",
                color600 = "#3EA49D",
                color700 = "#2F7B76",
                color800 = "#1F524E",
                color900 = "#102927"
            ),
            positiveColor = NetspendSdkColorPalette(
                color50 = "#F2F8EC",
                color100 = "#E4F0D9",
                color200 = "#C9E0B3",
                color300 = "#AED18E",
                color400 = "#93C168",
                color500 = "#78B242",
                color600 = "#608E35",
                color700 = "#486B28",
                color800 = "#30471A",
                color900 = "#18240D"
            ),
            negativeColor = NetspendSdkColorPalette(
                color50 = "#FFF0F0",
                color100 = "#FFE1E1",
                color200 = "#FFC4C4",
                color300 = "#FFA6A6",
                color400 = "#FF8989",
                color500 = "#FF6B6B",
                color600 = "#CC5656",
                color700 = "#994040",
                color800 = "#662B2B",
                color900 = "#331515"
            ),
            specialColor = NetspendSdkColorPalette(
                color50 = "#EEFAF9",
                color100 = "#DCF5F3",
                color200 = "#B8EBE7",
                color300 = "#95E1DC",
                color400 = "#71D7D0",
                color500 = "#4ECDC4",
                color600 = "#3EA49D",
                color700 = "#2F7B76",
                color800 = "#1F524E",
                color900 = "#102927"
            )
        )
    }
}
