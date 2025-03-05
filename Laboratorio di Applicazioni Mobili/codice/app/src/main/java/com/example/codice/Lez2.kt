package com.example.codice

import android.os.Bundle
import android.view.View
import android.view.View.OnClickListener
import android.widget.ArrayAdapter
import android.widget.Button
import android.widget.ListView
import android.widget.TextView
import android.widget.Toast
import androidx.appcompat.app.AppCompatActivity

class Lez2 : AppCompatActivity(), OnClickListener {

    private lateinit var buttonLinear : Button
    private lateinit var buttonConstraint : Button
    private lateinit var buttonRelative : Button
    private lateinit var buttonTable : Button
    private lateinit var buttonList : Button
    private lateinit var text: TextView

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        initButtons()
    }

    fun goBack(v: View) {
        setContentView(R.layout.activity_main)
        initButtons()
    }

    fun initButtons() {

        /* Declaration of views */
        buttonLinear = findViewById(R.id.buttonLinear)
        buttonConstraint = findViewById(R.id.buttonConstraint)
        buttonRelative = findViewById(R.id.buttonRelative)
        buttonTable = findViewById(R.id.buttonTable)
        buttonList = findViewById(R.id.buttonList)

        /* Set Listeners */
        buttonLinear.setOnClickListener(this)
        buttonConstraint.setOnClickListener(this)
        buttonRelative.setOnClickListener(this)
        buttonTable.setOnClickListener(this)
        buttonList.setOnClickListener(this)
        text.setText("peanut butter jelly time")
    }

    fun fireToast(s: String) {
        Toast.makeText(this, s, Toast.LENGTH_SHORT).show()
    }

    override fun onClick(v: View?) {
        when (v) {
            buttonLinear -> setContentView(R.layout.linear_layout)
            buttonConstraint -> setContentView(R.layout.constraint_layout)
            buttonRelative -> setContentView(R.layout.relative_layout)
            buttonTable -> setContentView(R.layout.table_layout)
            buttonList -> {
                setContentView(R.layout.list_layout)
                val data: Array<String> = arrayOf("First", "Second", "Third","ford")
                val adapter = ArrayAdapter(
                    this,
                    android.R.layout.simple_list_item_1,
                    data)
                val listView: ListView = findViewById(R.id.listView)
                listView.adapter = adapter
            }
        }
    }
}