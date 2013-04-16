package com.cyanogenmod.settings.device;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;

public class Atlas40PartsStartup extends BroadcastReceiver
{
    @Override
    public void onReceive(final Context context, final Intent bootintent) {
        DeviceSettings.onStartup(context);
    }
}
