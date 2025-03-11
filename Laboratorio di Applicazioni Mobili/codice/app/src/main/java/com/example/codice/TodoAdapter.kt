package com.example.codice

import android.view.LayoutInflater
import android.view.ViewGroup
import androidx.recyclerview.widget.RecyclerView.Adapter

class TodoAdapter (private val todos: MutableList<Todo>): Adapter<TodoViewHolder>() {

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): TodoViewHolder {
        return TodoViewHolder(
            LayoutInflater.from(parent.context).inflate(R.layout.todo_card, parent, false)
        )
    }

    override fun onBindViewHolder(holder: TodoViewHolder, position: Int) {
        holder.apply {
            tvTodoTitle.text = todos[position].todoTitle
            cbDone.apply{
                isChecked = todos[position].done
                setOnCheckedChangeListener { _, b -> todos[position].done = b }
            }
        }
    }

    fun addTodo(newTodo: Todo) {
        todos.add(newTodo)
        notifyItemInserted(todos.size - 1)
    }

    fun deleteDone() {
        todos.removeAll { todo -> todo.done } // condizione implicita done == true      
        notifyDataSetChanged()
    }

    override fun getItemCount(): Int {
        return todos.size
    }
}