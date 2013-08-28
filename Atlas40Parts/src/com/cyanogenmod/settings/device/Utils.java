package com.cyanogenmod.settings.device;

import android.util.Log;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.SyncFailedException;
import java.lang.SecurityException;

public class Utils
{
    private static final String TAG = "Atlas40Parts_Utils";
    private static final String TAG_READ = "Atlas40Parts_Utils_Read";
    private static final String TAG_WRITE = "Atlas40Parts_Utils_Write";

    public static void writeValue(String filename, String value) {
        FileOutputStream fos = null;
        try {
            fos = new FileOutputStream(new File(filename), false);
            fos.write(value.getBytes());
            fos.flush();
            // fos.getFD().sync();
        } catch (FileNotFoundException ex) {
            Log.w(TAG, "file " + filename + " not found: " + ex);
        } catch (SyncFailedException ex) {
            Log.w(TAG, "file " + filename + " sync failed: " + ex);
        } catch (IOException ex) {
            Log.w(TAG, "IOException trying to sync " + filename + ": " + ex);
        } catch (RuntimeException ex) {
            Log.w(TAG, "exception while syncing file: ", ex);
        } finally {
            if (fos != null) {
                try {
                    Log.w(TAG_WRITE, "file " + filename + ": " + value);
                    fos.close();
                } catch (IOException ex) {
                    Log.w(TAG, "IOException while closing synced file: ", ex);
                } catch (RuntimeException ex) {
                    Log.w(TAG, "exception while closing file: ", ex);
                }
            }
        }
    }

    public static void setWritable(String parameter) {
        File file = new File(parameter);
        try {
            file.setWritable(true);
        } catch (SecurityException ex) {
            Log.w(TAG, "unable to set permission for file " + parameter + ": " + ex);
        }
    }

    public static void setNonWritable(String parameter) {
        File file = new File(parameter);
        try {
            file.setWritable(false);
        } catch (SecurityException ex) {
            Log.w(TAG, "unable to set permission for file " + parameter + ": " + ex);
        }
    }

    public static boolean fileExists(String filename) {
        return new File(filename).exists();
    }

    public static String readOneLine(String sFile) {
        BufferedReader brBuffer;
        String sLine = null;

        try {
            brBuffer = new BufferedReader(new FileReader(sFile), 512);
            try {
                sLine = brBuffer.readLine();
            } finally {
                Log.w(TAG_READ, "file " + sFile + ": " + sLine);
                brBuffer.close();
            }
        } catch (Exception e) {
            Log.e(TAG_READ, "IO Exception when reading /sys/ file", e);
        }
        return sLine;
    }

}
