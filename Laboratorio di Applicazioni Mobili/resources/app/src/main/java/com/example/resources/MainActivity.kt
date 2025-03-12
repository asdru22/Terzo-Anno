package com.example.resources

import android.os.Bundle
import android.widget.Button
import android.widget.ImageView
import android.widget.TextView
import androidx.appcompat.app.AppCompatActivity
import kotlin.random.Random

class MainActivity : AppCompatActivity() {
    private lateinit var imageView: ImageView
    private lateinit var textView: TextView
    private lateinit var buttonFlip: Button

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        imageView = findViewById(R.id.imageView)
        textView = findViewById(R.id.text)
        buttonFlip = findViewById(R.id.button)

        buttonFlip.setOnClickListener {
            if(Random.nextDouble()<0.5){
                textView.text = resources.getText(R.string.heads)
            } else {
                textView.text = resources.getText(R.string.tails)
            }
        }
    }
}