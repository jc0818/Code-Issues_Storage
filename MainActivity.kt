package com.example.myapplication

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.View
import android.widget.Toast
import com.example.myapplication.databinding.ActivityMainBinding

class MainActivity : AppCompatActivity() {
    lateinit var binding: ActivityMainBinding
    var select_price: Int = 0
    var count:Int = 0
    var total_price:Int = 0
    override fun onCreate(savedInstanceState: Bundle?) {
        binding = ActivityMainBinding.inflate(layoutInflater)
        super.onCreate(savedInstanceState)
        setContentView(binding.root)
        binding.radioButton1.text = "소고기와 치즈맛(1,500원)"
        binding.radioButton2.text = "불고기맛(2,000원)"
        binding.radioButton3.text = "치킨맛(3,000원)"
        binding.radioGroup.setOnCheckedChangeListener { radioGroup, i ->
            when(i)
            {
                R.id.radioButton1 -> {
                    binding.imageView.setImageResource(R.drawable.ic_launcher_foreground)
                    select_price = 1500
                    binding.txtPrice.visibility= View.VISIBLE
                    binding.txtPrice.setText(select_price.toString())
                }
                R.id.radioButton2 -> {
                    binding.imageView.setImageResource(R.drawable.ic_launcher_foreground)
                    select_price = 2000
                    binding.txtPrice.visibility= View.VISIBLE
                    binding.txtPrice.setText(select_price.toString())
                }
                R.id.radioButton3 -> {
                    binding.imageView.setImageResource(R.drawable.ic_launcher_foreground)
                    select_price = 3000
                    binding.txtPrice.visibility= View.VISIBLE
                    binding.txtPrice.setText(select_price.toString())
                }
            }
        }

        binding.btnMinus.setOnClickListener{
            if(count == 1){
                Toast.makeText(applicationContext,"주문할수 있는 최소 수량은 1개입니다.",Toast.LENGTH_LONG).show()
            }else {
                count--
                binding.editCount.setText(count.toString())
                total_price = select_price * count
                if (total_price > 10000) {
                    binding.txtPay.text = total_price.toString()
                } else {
                    total_price = total_price + 2500
                    binding.txtPay.text = total_price.toString()
                }
            }
        }
        binding.btnPlus.setOnClickListener{
            if(count == 10){
                Toast.makeText(applicationContext,"주문할수 있는 최대 수량은 10개입니다.",Toast.LENGTH_LONG).show()
            }else {
                count++
                binding.editCount.setText(count.toString())
                total_price = select_price * count
                if (total_price > 10000) {
                    binding.txtPay.text = total_price.toString()
                } else {
                    total_price = total_price + 2500
                    binding.txtPay.text = total_price.toString()
                }
            }
        }
    }
}