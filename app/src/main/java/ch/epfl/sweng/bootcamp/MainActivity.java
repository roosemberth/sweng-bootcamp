package ch.epfl.sweng.bootcamp;

import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.EditText;
import android.widget.TextView;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
    }

    /**
     * This method is called when the mainGoButton is pressed.
     * Will change the text to greet the user.
     */
    public void onMainGoButtonClick(View view) {
        TextView greetingTextView = findViewById(R.id.greetingMessage);
        EditText usernameEditText = findViewById(R.id.mainName);
        String username = usernameEditText.getText().toString();
        greetingTextView.setText(String.format("Hello %s!", username));
    }
}
