import org.junit.Assert;
import org.junit.Test;

import static edu.gvsu.dlunit.DLUnit.*;

/**
 * Sample test cases for a signed, 16-bit adder/subtractor with overflow.
 * <p/>
 * IMPORTANT:  These test cases do *not* thoroughly test the circuit.  You need to
 * re-name this class and add more tests!
 * <p/>
 * Created by kurmasz on 8/8/16.
 */
public class SampleSigned16BitAddSubtractTest {


  // The complete list of integers to be tests.
  // (You need to add to this list.)
  public static final long testIntegers[] = {-32768, -32767, 0, 1, 2, 13, 127, 128, 129, 0x5555, 32766, 32767};


  // Helper method that runs a test for a given pair of integers and an operation (`false` for add, `true` for subtract)
  private void verify(long a, long b, boolean op) {


    //////////////////////////////////
    //
    // Compute the expected outputs
    //
    /////////////////////////////////
    long expected = op ? a - b : a + b;  // add or subtract as specified by `op`

    // The `overflow` output should be `true` if the expected output is not in the range [-(2^15), (2^15)-1]
    // (In java "1 << 15" takes the bit string 0000000000000001 and shifts it left 15 spaces, effectively
    // generating the value 2^15.)
    boolean expectedOverflow = ((expected >= (1 << 15)) || (expected < -(1 << 15)));

    // Output "wraps around" if there is an overflow
    if (expectedOverflow && expected > 0) {
      expected -= 65536;
    } else if (expectedOverflow && expected < 0) {
      expected += 65536;
    }

    ////////////////////////////////////////
    //
    // Configure and simulate the circuit
    //
    ///////////////////////////////////////
    setPinSigned("InputA", a);
    setPinSigned("InputB", b);
    setPin("Op", op);
    run();


    ////////////////////////////////////////
    //
    // Check the correctness of the output
    //
    ///////////////////////////////////////
    String message = "of " + a + (op ? " - " : " + ") + b + ": ";
    Assert.assertEquals("Output " + message, expected, readPinSigned("Output"));
    Assert.assertEquals("Overflow " + message, expectedOverflow, readPin("Overflow"));
  }

  //
  // Quick tests designed to quickly catch major errors.  (Also serve as example tests)
  //

  @Test
  public void zero_zero_add() {
    verify(0, 0, false);
  }

  @Test
  public void zero_one_add() {
    verify(0, 1, false);
  }

  @Test
  public void zero_zero_subtract() {
    verify(0, 0, true);
  }

  @Test
  public void zero_one_subtract() {
    verify(0, 1, true);
  }


  // This is actually rather gross; but, it is an effective way to thoroughly test your circuit without
  // having to write hundreds of individual methods.
  @Test
  public void testAll() {
    for (long a : testIntegers) {
      for (long b : testIntegers) {
        verify(a, b, false);
        verify(a, b, true);
      }
    }
  } // end testAll
}
