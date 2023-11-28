import org.junit.*;

import static edu.gvsu.mipsunit.munit.MUnit.Register.*;
import static edu.gvsu.mipsunit.munit.MUnit.*;

public class WackySumTest {

    @Before
    public void before() {
    set(v0, 1337);
    }

    /******************************************************************
     *
     * Test wackySum
     *
     *****************************************************************/

    @Test 
    public void wacky_3_7_2() {
    run("wackySum", 3, 7, 2);
    Assert.assertEquals(27, get(v0));
    }

    @Test 
    public void wacky_21_26_1() {
    run("wackySum", 21, 26, 1);
    Assert.assertEquals(336, get(v0));
    }

    @Test 
    public void wacky_33_42_2() {
    run("wackySum", 33, 42, 2);
    Assert.assertEquals(285, get(v0));
    }

    /******************************************************************
     *
     * Write many more tests!  * Test Edge Cases *
     *
     *****************************************************************/
    
} // end class


