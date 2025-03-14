package com.example.intents_perms

import android.content.pm.PackageManager
import android.net.Uri
import android.os.Bundle
import android.util.Log
import android.view.KeyEvent
import android.webkit.WebResourceRequest
import android.webkit.WebView
import android.webkit.WebViewClient
import androidx.activity.enableEdgeToEdge
import androidx.appcompat.app.AppCompatActivity
import androidx.core.content.ContextCompat

class WebActivity : AppCompatActivity() {

    companion object {
        var WEBSITE = "https://asdru22.github.io/"
    }

    private lateinit var webView: WebView
    private var initialized = false

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContentView(R.layout.activity_web)

        if (ContextCompat.checkSelfPermission(
                this,
                android.Manifest.permission.INTERNET
            ) == PackageManager.PERMISSION_GRANTED
        ) {
            initWebView()
        } else {
            Log.w("Webview", "Permission not granted")
        }

    }

    private fun initWebView() {
        webView = findViewById(R.id.webView)
        webView.loadUrl(WEBSITE)

        initialized = true

        webView.webViewClient = object : WebViewClient() {
            override fun shouldOverrideUrlLoading(
                view: WebView?,
                request: WebResourceRequest?
            ): Boolean {
                if (request?.url?.host == Uri.parse(WEBSITE).host) {
                    // This is my website, let the webView handle it
                    return false
                } else return super.shouldOverrideUrlLoading(view, request)
            }
        }

    }

    // si torna indietro nella web view e non nell'app
    override fun onKeyDown(keyCode: Int, event: KeyEvent?): Boolean {
        /* Is there a page in the history? */
        if (keyCode == KeyEvent.KEYCODE_BACK &&
            initialized &&
            webView.canGoBack()
        ) {
            webView.goBack()
            return true
        } else return super.onKeyDown(keyCode, event)
    }
}