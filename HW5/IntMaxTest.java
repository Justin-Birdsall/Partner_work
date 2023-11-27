import org.junit.*;

import static edu.gvsu.mipsunit.munit.MUnit.Register.*;
import static edu.gvsu.mipsunit.munit.MUnit.*;

public class IntMaxTest {

  /******************************************************************
   *
   * Test intMax
   *
   *****************************************************************/

  @Test
  public void intMax_ascending() {
    run("intMax", 5, 6, 7);
    Assert.assertEquals(7, get(v0));
  }

  // Write more tests!

} // end class
