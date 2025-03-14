package com.example.intents_perms

import android.content.Intent
import android.content.pm.PackageManager
import android.net.Uri
import android.os.Bundle
import android.util.Log
import android.widget.Button
import android.widget.EditText
import androidx.activity.enableEdgeToEdge
import androidx.activity.result.contract.ActivityResultContracts
import androidx.appcompat.app.AppCompatActivity
import androidx.core.content.ContextCompat

class MainActivity : AppCompatActivity() {

    private lateinit var buttonWeb: Button
    private lateinit var buttonCall: Button
    private lateinit var editTextPhone: EditText

    private val callPermissionLauncher = registerForActivityResult(
        ActivityResultContracts.RequestPermission()
    ) { isGranted: Boolean ->
        if (isGranted) {
            makeCall()
        } else {
            Log.w("CALL", "Persmission not granted")
        }
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContentView(R.layout.activity_main)


        editTextPhone = findViewById(R.id.editTextPhone)

        buttonCall = findViewById(R.id.call)

        buttonCall.setOnClickListener {
            if (ContextCompat.checkSelfPermission(
                    this,
                    android.Manifest.permission.CALL_PHONE
                ) == PackageManager.PERMISSION_GRANTED
            ) {
                makeCall()
            } else {
                callPermissionLauncher.launch(android.Manifest.permission.CALL_PHONE)
            }
        }

        buttonWeb = findViewById(R.id.webButton)
        buttonWeb.setOnClickListener {
            val intentWeb = Intent(this, WebActivity::class.java)
            startActivity(intentWeb)
        }
    }

    private fun makeCall() {
        val numberToCall: String = "tel://" + editTextPhone.text.toString()
        val callIntent = Intent(Intent.ACTION_CALL, Uri.parse(numberToCall))
//            callIntent.action = Intent.ACTION_CALL
//            callIntent.data = Uri.parse(numberToCall)
        startActivity(callIntent)
    }
}