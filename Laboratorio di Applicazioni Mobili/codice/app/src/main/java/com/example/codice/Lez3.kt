package com.example.codice

import android.graphics.Color
import android.os.Bundle
import android.text.TextUtils
import android.text.util.Linkify
import android.view.View
import android.view.View.OnClickListener
import android.webkit.WebView
import android.widget.ArrayAdapter
import android.widget.AutoCompleteTextView
import android.widget.Button
import android.widget.CheckBox
import android.widget.EditText
import android.widget.ListView
import android.widget.RadioGroup
import android.widget.Spinner
import android.widget.Switch
import android.widget.TextView
import android.widget.Toast
import android.widget.ToggleButton
import androidx.appcompat.app.AppCompatActivity
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView

class Lez3 : AppCompatActivity(), OnClickListener {

    private lateinit var buttonLinear : Button
    private lateinit var buttonConstraint : Button
    private lateinit var buttonRelative : Button
    private lateinit var buttonTable : Button
    private lateinit var buttonList : Button
    private lateinit var buttonWidgets : Button
    private lateinit var buttonRecycler : Button

    private var todoAdapter = TodoAdapter(mutableListOf())

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
        buttonWidgets = findViewById(R.id.buttonWidgets)
        buttonRecycler = findViewById(R.id.buttonRecycler  )

        /* Set Listeners */
        buttonLinear.setOnClickListener(this)
        buttonConstraint.setOnClickListener(this)
        buttonRelative.setOnClickListener(this)
        buttonTable.setOnClickListener(this)
        buttonList.setOnClickListener(this)
        buttonWidgets.setOnClickListener(this)
        buttonRecycler.setOnClickListener(this)
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
                val data: Array<String> = arrayOf("First", "Second", "Third")
                val adapter = ArrayAdapter<String>(
                    this,
                    android.R.layout.simple_list_item_1,
                    data)
                val listView: ListView = findViewById(R.id.listView)
                listView.adapter = adapter
            }
            buttonWidgets -> {
                setContentView(R.layout.widgets_layout)
                val scrollingText: TextView = findViewById(R.id.scrollingText)
                scrollingText.run {
                    text = PRESENTATION_TEXT
                    ellipsize = TextUtils.TruncateAt.MARQUEE
                    setHorizontallyScrolling(true)
                }
                Linkify.addLinks(scrollingText,
                    Linkify.WEB_URLS or Linkify.EMAIL_ADDRESSES or Linkify.PHONE_NUMBERS
                )
                val autocompleteTextView: AutoCompleteTextView = findViewById(R.id.autoCompleteText)
                autocompleteTextView.setAdapter( ArrayAdapter<String> (
                    this,
                    android.R.layout.simple_dropdown_item_1line,
                    arrayOf("Darth Vader", "Darth Sidious", "Darth Tyranus")
                ))
                val spinner: Spinner = findViewById(R.id.spinner)
                val spinnerAdapter = ArrayAdapter<String>(
                    this,
                    android.R.layout.simple_spinner_item,
                    arrayOf("Anakin Skywalker", "Sheev Palpatine", "Count Dooku")
                )
                spinnerAdapter.setDropDownViewResource(
                    android.R.layout.simple_spinner_dropdown_item)
                spinner.adapter = spinnerAdapter

                val checkBox: CheckBox = findViewById(R.id.checkBox)
                checkBox.setOnCheckedChangeListener{
                        _, isChecked -> fireToast("Checkbox is $isChecked")
                }
                val toggleButton: ToggleButton = findViewById(R.id.toggleButton)
                toggleButton.setOnCheckedChangeListener{
                        _, isChecked -> fireToast("Toggle Button is $isChecked")
                }
                val switch: Switch = findViewById(R.id.toggleSwitch)
                switch.setOnCheckedChangeListener{
                        _, isChecked -> fireToast("Switch is $isChecked")
                }
                val radioGroup: RadioGroup = findViewById(R.id.radioGroup)
                radioGroup.setOnCheckedChangeListener { _, checkedId ->
                    when(checkedId) {
                        R.id.radioRed -> radioGroup.setBackgroundColor(Color.RED)
                        R.id.radioGreen -> radioGroup.setBackgroundColor(Color.GREEN)
                        R.id.radioBlue -> radioGroup.setBackgroundColor(Color.BLUE)
                        else -> radioGroup.setBackgroundColor(Color.WHITE)
                    }
                }
                val backButton: Button = findViewById(R.id.buttonWidgetBack)
                backButton.setOnClickListener{
                    goBack(it)
                }
            }
            buttonRecycler -> {
                setContentView(R.layout.recycler_layout)
                val recyclerTodo: RecyclerView = findViewById(R.id.recyclerTodo)
                recyclerTodo.adapter = todoAdapter
                recyclerTodo.layoutManager = LinearLayoutManager(this)
                val editTextTodo: EditText = findViewById(R.id.editTextTodo)
                val buttonAdd: Button = findViewById(R.id.buttonAddTodo)
                buttonAdd.setOnClickListener{
                    todoAdapter.addTodo(Todo(editTextTodo.text.toString())
                )}
                val buttonDelete: Button = findViewById(R.id.buttonRemoveTodos)
                buttonDelete.setOnClickListener{
                    todoAdapter.deleteDone()
                }
                val backButton: Button = findViewById(R.id.buttonRecyclerBack)
                backButton.setOnClickListener{
                    goBack(it)
                }
            }

        }
    }

    companion object {
        private const val PRESENTATION_TEXT =
            "Hi, my email is federico.montori2@unibo.it, my website is " +
                    "https://www.unibo.it/sitoweb/federico.montori2 and my office phone number " +
                    "is +390512094974"
    }
}