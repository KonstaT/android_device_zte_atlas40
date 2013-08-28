package com.cyanogenmod.settings.device;

import com.cyanogenmod.settings.device.R;

import android.content.Context;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.preference.CheckBoxPreference;
import android.preference.Preference;
import android.preference.Preference.OnPreferenceClickListener;
import android.preference.PreferenceActivity;
import android.preference.PreferenceManager;
import android.preference.PreferenceScreen;

public class DeviceSettings extends PreferenceActivity {

    private static final String KEY_USB_CHARGING = "usb_charging";
    private static final String KEY_BUTTON_BACKLIGHT = "button_backlight";

    private static final String USB_CHARGING_FILE = "/sys/module/msm_battery/parameters/usb_chg_enable";
    private static final String BUTTON_BACKLIGHT_FILE = "/sys/class/leds/button-backlight/brightness";

    private CheckBoxPreference mUsbCharging;
    private CheckBoxPreference mButtonBacklight;

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        addPreferencesFromResource(R.xml.atlas40parts);

        mUsbCharging = (CheckBoxPreference) findPreference(KEY_USB_CHARGING);
        mButtonBacklight = (CheckBoxPreference) findPreference(KEY_BUTTON_BACKLIGHT);

    }

    @Override
    public boolean onPreferenceTreeClick(PreferenceScreen preferenceScreen, Preference preference) {

        String value;
        String key = preference.getKey();

        if (key.equals(KEY_USB_CHARGING)) {
            final CheckBoxPreference chkPref = (CheckBoxPreference) preference;
            value = chkPref.isChecked() ? "1" : "0";
            Utils.writeValue(USB_CHARGING_FILE, value);
        } else if (key.equals(KEY_BUTTON_BACKLIGHT)) {
            final CheckBoxPreference chkPref = (CheckBoxPreference) preference;
            value = chkPref.isChecked() ? "1" : "0";
            if (chkPref.isChecked()) {
                Utils.setWritable(BUTTON_BACKLIGHT_FILE);
                Utils.writeValue(BUTTON_BACKLIGHT_FILE, value);
            } else {
                Utils.writeValue(BUTTON_BACKLIGHT_FILE, value);
                Utils.setNonWritable(BUTTON_BACKLIGHT_FILE);
            }
        } else {
            return super.onPreferenceTreeClick(preferenceScreen, preference);
        }
        return true;
    }

    public static void restore(Context context) {

        SharedPreferences prefs = PreferenceManager.getDefaultSharedPreferences(context);

        if (prefs.getBoolean(KEY_USB_CHARGING, true)) {
            Utils.writeValue(USB_CHARGING_FILE, "1");
        } else {
            Utils.writeValue(USB_CHARGING_FILE, "0");
        }

        if (prefs.getBoolean(KEY_BUTTON_BACKLIGHT, true)) {
            Utils.setWritable(BUTTON_BACKLIGHT_FILE);
            Utils.writeValue(BUTTON_BACKLIGHT_FILE, "1");
        } else {
            Utils.writeValue(BUTTON_BACKLIGHT_FILE, "0");
            Utils.setNonWritable(BUTTON_BACKLIGHT_FILE);
        }
    }

}
