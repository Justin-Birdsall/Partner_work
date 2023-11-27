import org.junit.*;

import static edu.gvsu.mipsunit.munit.MUnit.Register.*;
import static edu.gvsu.mipsunit.munit.MUnit.*;

public class MaxTest {

  /******************************************************************
   *
   * Test max
   *
   ******************************************************************/

  Label array1 = wordData(5, 4, 7, 6, 9, 8, 2, 1, -1);

  @Test
  public void max_findsMaximum() {
    run("max", array1, 9);
    Assert.assertEquals(9, get(v0));
  }

  // Write **a lot** more tests (they shouldn't all use array1).

}
