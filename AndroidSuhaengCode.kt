package com.example.suhang

import android.os.Bundle
import android.view.ContextMenu
import android.view.MenuItem
import android.view.View
import android.widget.ArrayAdapter
import androidx.appcompat.app.AppCompatActivity

import com.example.suhang.databinding.ActivityMainBinding

class MainActivity : AppCompatActivity() {
    lateinit var binding: ActivityMainBinding

    val  data1 = arrayListOf("overdose" , "peaches")
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityMainBinding.inflate(layoutInflater)
        setContentView(binding.root)
        registerForContextMenu(binding.list)

        val adapter1 = ArrayAdapter(this,android.R.layout.simple_list_item_1,data1)
        binding.list.adapter = adapter1

        binding.list.setOnItemClickListener { adapterView, view, i, l ->
            binding.textView4.text = "${data1[i]}"


        }

        binding.button.setOnClickListener(
            {
                binding.textView.text = "노래"
            }
        )
        binding.button2.setOnClickListener(
            {
                binding.textView.text = "제목"
            }
        )
    }

    override fun onCreateContextMenu(
        menu: ContextMenu?,
        v: View?,
        menuInfo: ContextMenu.ContextMenuInfo?
    ) {
        super.onCreateContextMenu(menu, v, menuInfo)
        when(v?.id)
        {
            R.id.list -> {
                menu?.setHeaderTitle("menu")
                menuInflater.inflate(R.menu.mainmenu,menu)
            }
        }
    }

    override fun onContextItemSelected(item: MenuItem): Boolean {
        when(item.itemId)
        {
            R.id.play -> {
              binding.textView.text = "음악 재생"
            }

            R.id.stop -> {
                binding.textView.text = "음악 멈춤"
            }
        }
        return super.onContextItemSelected(item)
    }

    // Build.gradle(module:app)

    // buildFeatures{
    //     viewBinding = true
    //    }
}