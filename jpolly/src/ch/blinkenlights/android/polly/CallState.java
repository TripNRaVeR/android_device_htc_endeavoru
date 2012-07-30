package ch.blinkenlights.android.polly;

import android.app.Activity;
import android.os.Bundle;
import android.content.Intent;

public class CallState extends Activity
{
	/** Called when the activity is first created. */
	@Override
	public void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.main);
		startService(new Intent(getApplicationContext(), PollyService.class));
		finish();
	}
}
