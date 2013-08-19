/*
 * Copyright (C) 2013 The CyanogenMod Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package org.cyanogenmod.hardware;

import org.cyanogenmod.hardware.util.FileUtils;

import java.io.File;

public class ButtonBacklight {

    private static String BUTTON_BACKLIGHT_PATH = "/sys/class/leds/button-backlight/max_brightness";

    public static boolean isSupported() {
        File file = new File(BUTTON_BACKLIGHT_PATH);
        return file.exists();
    }

    public static boolean setBrightness(int brightness)  {
        return FileUtils.writeLine(BUTTON_BACKLIGHT_PATH, String.valueOf(brightness));
    }

    public static int getMaxBrightness()  {
        return 255;
    }

    public static int getMinBrightness()  {
        return 0;
    }

    public static int getCurBrightness()  {
        return Integer.parseInt(FileUtils.readOneLine(BUTTON_BACKLIGHT_PATH));
    }

    public static int getDefaultBrightness()  {
        return 255;
    }
}
