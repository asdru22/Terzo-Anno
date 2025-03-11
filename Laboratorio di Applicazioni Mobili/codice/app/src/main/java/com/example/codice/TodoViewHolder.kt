package com.example.codice

import android.view.View
import android.widget.CheckBox
import android.widget.TextView
import androidx.recyclerview.widget.RecyclerView.ViewHolder

class TodoViewHolder(itemView: View): ViewHolder(itemView) {
    val tvTodoTitle: TextView = itemView.findViewById(R.id.todoTitle)
    val cbDone: CheckBox = itemView.findViewById(R.id.todoCheck)
}