package ch.blinkenlights.android.polly;

import android.content.BroadcastReceiver;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;

import android.util.Log;

public class BootReceiver extends BroadcastReceiver {
	@Override
	public void onReceive(Context context, Intent intent) {
		Log.v("Polly_BootReceiver", "Starting service");
		context.startService(new Intent(context, PollyService.class));
	}
}
