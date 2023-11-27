import org.junit.*;

import static edu.gvsu.mipsunit.munit.MUnit.Register.*;
import static edu.gvsu.mipsunit.munit.MUnit.*;

public class Close10Test {

  /******************************************************************
   *
   * Test close10
   *
   *****************************************************************/

  @Test
  public void close10_aClosest() {
    run("close10", 8, 13);
    Assert.assertEquals(8, get(v0));
  }

  // Write more tests!

} // end class
