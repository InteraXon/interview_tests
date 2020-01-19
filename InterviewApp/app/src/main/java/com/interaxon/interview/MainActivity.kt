package com.interaxon.interview

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import com.interaxon.interview.layout_test.JavaLayoutTestActivity
import com.interaxon.interview.layout_test.KotlinLayoutTestActivity
import kotlinx.android.synthetic.main.activity_main.*

class MainActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        javaLayoutButton.setOnClickListener {
            startActivity(Intent(this, JavaLayoutTestActivity::class.java))
        }

        kotlinLayoutButton.setOnClickListener {
            startActivity(Intent(this, KotlinLayoutTestActivity::class.java))
        }
    }
}
