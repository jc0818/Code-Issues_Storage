package com.example.mpthree
import android.os.Bundle
import android.widget.AdapterView
import android.widget.ArrayAdapter
import android.widget.Button
import android.widget.ListView
import android.widget.TextView
import androidx.appcompat.app.AppCompatActivity
import com.example.mpthree.R

class MainActivity : AppCompatActivity() {
    private lateinit var listView: ListView
    private lateinit var sourceTextView: TextView
    private lateinit var destinationTextView: TextView

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        listView = findViewById(R.id.listView)
        sourceTextView = findViewById(R.id.sourceTextView)
        destinationTextView = findViewById(R.id.destinationTextView)

        val items = arrayOf("항목 1", "항목 2", "항목 3", "항목 4") // 리스트뷰에 표시할 항목 배열

        val adapter = ArrayAdapter(this, android.R.layout.simple_list_item_1, items)
        listView.adapter = adapter

        listView.onItemClickListener = AdapterView.OnItemClickListener { parent, view, position, id ->
            val selectedText = parent.getItemAtPosition(position) as String
            sourceTextView.text = selectedText
        }

        val copyButton = findViewById<Button>(R.id.copyButton)
        copyButton.setOnClickListener {
            destinationTextView.text = sourceTextView.text
        }
    }
}
//  buildFeatures {
//
//        viewBinding = true
//    }
