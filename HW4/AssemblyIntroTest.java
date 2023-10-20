
import org.junit.*;

import static edu.gvsu.mipsunit.munit.MUnit.Register.*;
import static edu.gvsu.mipsunit.munit.MUnit.*;

public class AssemblyIntroTest {

    /******************************************************************
     *
     * Test monkeyTrouble
     *
     *****************************************************************/

    @Test 
    public void monkeyTroube_neitherSmiling() {
	run("monkeyTrouble", 0, 0);
	Assert.assertEquals(1, get(v0));
    }

    @Test 
    public void monkeyTroube_aSmiling() {
	run("monkeyTrouble", 1, 0);
	Assert.assertEquals(0, get(v0));
    }
    @Test 
    public void monkeyTroube_bSmiling() {
	run("monkeyTrouble", 0, 1);
	Assert.assertEquals(0, get(v0));
    }
    @Test 
    public void monkeyTroube_bothSmiling() {
	run("monkeyTrouble", 1, 1);
	Assert.assertEquals(1, get(v0));
    }

    /******************************************************************
     *
     * Test sleepIn
     *
     *****************************************************************/
    @Test 
    public void sleepIn_weekday_notVacation() {
	run("sleepIn", 1, 0);
	Assert.assertEquals(0, get(v0));
    }

    @Test 
    public void sleepIn_notWeekday_notVacation() {
    run("sleepIn", 0, 0);
    Assert.assertEquals(1, get(v0));
    }

    @Test 
    public void sleepIn_notWeekday_Vacation() {
    run("sleepIn", 0, 1);
    Assert.assertEquals(1, get(v0));
    }

    @Test 
    public void sleepIn_weekday_Vacation() {
    run("sleepIn", 1, 1);
    Assert.assertEquals(1, get(v0));
    }

    /******************************************************************
     *
     * Test posNeg
     *
     *****************************************************************/
     @Test 
     public void posNeg_neg_neg_false() {
	 run("posNeg", -1, -3, 0);
	 Assert.assertEquals(0, get(v0));
     }

     @Test 
    public void posNeg_neg_neg_true() {
	run("posNeg", -1, -3, 1);
	Assert.assertEquals(1, get(v0));
    }
}

