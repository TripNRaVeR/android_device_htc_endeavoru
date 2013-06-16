package com.cyanogenmod.settings.device;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.Bundle;
import android.preference.CheckBoxPreference;
import android.preference.TwoStatePreference;
import android.preference.ListPreference;
import android.preference.Preference;
import android.preference.PreferenceActivity;
import android.preference.PreferenceCategory;

public class DeviceSettings extends PreferenceActivity  {

    public static final String KEY_S2WSWITCH = "s2w_switch";
    public static final String KEY_FASTCHARGE = "fastcharge";
    public static final String KEY_BACKLIGHTDISABLE = "backlight_disable";
    public static final String KEY_SMARTDIMMERSWITCH = "smartdimmer_switch";
    public static final String KEY_POWERSAVINGACTIVE = "powersave_active";
    public static final String KEY_TSFIX = "ts_fix";

    private TwoStatePreference mS2WSwitch;
    private ListPreference mS2WStroke;
    private ListPreference mS2WLength;
    private TwoStatePreference mFastcharge;
    private TwoStatePreference mBacklightDisable;
    private TwoStatePreference mBacklightNotification;
    private TwoStatePreference mPowerSavingActive;
    private TwoStatePreference mSmartDimmerSwitch;
    private TwoStatePreference mTsFix;


    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        addPreferencesFromResource(R.xml.main);

        mS2WSwitch = (TwoStatePreference) findPreference(KEY_S2WSWITCH);
        mS2WSwitch.setEnabled(Sweep2WakeSwitch.isSupported());
        mS2WSwitch.setOnPreferenceChangeListener(new Sweep2WakeSwitch());

        mFastcharge = (TwoStatePreference) findPreference(KEY_FASTCHARGE);
        mFastcharge.setEnabled(Fastcharge.isSupported());
        mFastcharge.setOnPreferenceChangeListener(new Fastcharge());

        mBacklightDisable = (TwoStatePreference) findPreference(KEY_BACKLIGHTDISABLE);
        mBacklightDisable.setEnabled(BacklightDisable.isSupported());
        mBacklightDisable.setOnPreferenceChangeListener(new BacklightDisable());

        mPowerSavingActive = (TwoStatePreference) findPreference(KEY_POWERSAVINGACTIVE);
        mPowerSavingActive.setEnabled(PowerSavingActive.isSupported());
        mPowerSavingActive.setOnPreferenceChangeListener(new PowerSavingActive());

        mSmartDimmerSwitch = (TwoStatePreference) findPreference(KEY_SMARTDIMMERSWITCH);
        mSmartDimmerSwitch.setEnabled(SmartDimmerSwitch.isSupported());
        mSmartDimmerSwitch.setOnPreferenceChangeListener(new SmartDimmerSwitch());

	mTsFix = (TwoStatePreference) findPreference(KEY_TSFIX);
	mTsFix.setEnabled(TsFix.isSupported());
	mTsFix.setOnPreferenceChangeListener(new TsFix());

    }

    @Override
    protected void onResume() {
        super.onResume();
    }

    @Override
    protected void onPause() {
        super.onPause();
    }


    @Override
    protected void onDestroy() {
        super.onDestroy();
    }

}
