package ch.epfl.sweng.bootcamp;

import static android.support.test.espresso.Espresso.onView;
import static android.support.test.espresso.action.ViewActions.click;
import static android.support.test.espresso.action.ViewActions.closeSoftKeyboard;
import static android.support.test.espresso.action.ViewActions.typeText;
import static android.support.test.espresso.matcher.ViewMatchers.withId;

import android.support.test.rule.ActivityTestRule;
import android.support.test.runner.AndroidJUnit4;

import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;

@RunWith(AndroidJUnit4.class)
public class MainActivityTest {
  @Rule
  public final ActivityTestRule<MainActivity> mainActivityRule =
    new ActivityTestRule<>(MainActivity.class);

  @Test
  public void testCanGreetUsers() {
    onView(withId(R.id.mainName))
      .perform(typeText("from my unit test"))
      .perform(closeSoftKeyboard());
    onView(withId(R.id.mainGoButton)).perform(click());
    // on View(withId(R.id.greetingMessage)).check(matched(withText("Hello from my unit test!")));
  }
}
