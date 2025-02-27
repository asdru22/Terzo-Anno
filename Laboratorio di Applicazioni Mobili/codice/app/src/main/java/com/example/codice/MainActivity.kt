package com.example.codice

import android.os.Bundle
import android.util.Log
import android.view.MotionEvent
import android.widget.Button
import android.widget.Toast
import androidx.appcompat.app.AppCompatActivity

class MainActivity : AppCompatActivity() {

    companion object {
        const val LOG_LABEL = "Lifecycle"
        const val VAR_LABEL = "TOUCHES"
    }

    private var touches = 0
    lateinit var btnWelcome: Button

    override fun onCreate(savedInstanceState: Bundle?) {
        // crea l'activity, prima viene resa visibile,
        // poi viene resa interagibile.
        // una app' è formata da uno stack di activity
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        btnWelcome = findViewById(R.id.button)
        btnWelcome

        Log.i(LOG_LABEL, "on create")

        val savedTouches: Int = savedInstanceState?.getInt(VAR_LABEL) ?: -1
        Log.i(LOG_LABEL, "Touches: $savedTouches")

    }

    override fun onStart() {
        super.onStart()
        Log.i(LOG_LABEL, "on start")
    }

    override fun onPause() {
        super.onPause()
        Log.i(LOG_LABEL, "on pause")
    }

    override fun onDestroy() {
        super.onDestroy()
        Log.i(LOG_LABEL, "on destroy")

    }

    override fun onTouchEvent(event: MotionEvent?): Boolean {
        if (event != null && event.action == MotionEvent.ACTION_DOWN) {
            touches++
            var msg = "Touches: $touches"
            Log.i(LOG_LABEL,msg )
            Toast.makeText(this,msg,Toast.LENGTH_SHORT).show()
        }
        return super.onTouchEvent(event)
    }

    override fun onSaveInstanceState(outState: Bundle) {
        super.onSaveInstanceState(outState)
        outState.putInt(VAR_LABEL, touches)
        Log.i(LOG_LABEL, "SAVE INSTANCE")
    }

    override fun onRestoreInstanceState(savedInstanceState: Bundle) {
        super.onRestoreInstanceState(savedInstanceState)
        Log.i(LOG_LABEL, "RESTORE INSTANCE")
        touches = savedInstanceState.getInt(VAR_LABEL)
    }

    fun whenClicked() {
        Log.i(LOG_LABEL, "Buttone cliccato")
    }
}