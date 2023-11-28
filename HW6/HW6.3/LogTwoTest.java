import org.junit.*;

import static edu.gvsu.mipsunit.munit.MUnit.Register.*;
import static edu.gvsu.mipsunit.munit.MUnit.*;

public class LogTwoTest {

  @Before
  public void before() {
    set(v0, 1337);
  }

  /******************************************************************
   *
   * Test log_two
   *
   *****************************************************************/

  @Test
  public void log_two_one() {
    run("log_two", 1);
    Assert.assertEquals(0, get(v0));
  }

  @Test
  public void log_two_zero() {
    run("log_two", 0);
    Assert.assertEquals(-1, get(v0));
  }

  /******************************************************************
   *
   * Write many more tests! * Test Edge Cases *
   *
   *****************************************************************/

} // end class
