/* i.e., 64KB.  The array needs to be at least twice the size of the
   8KB cache so that the array doesn't fit in memory. */
#define ARRAY_SIZE 64*1024

#define NUM_LOOPS 1000


/****************************************************************************
 *
 *  Notice that the array is an array of characters.  This means that
 *  each item in the cache is exactly 1 byte.  This makes it easy to
 *  identify data items that will or will not conflict in the cache.
 *  For example, in an 8KB direct-mapped cache, array bytes 0 and 8192
 *  will conflict.
 *
 *  This program simply iterates through each byte in the cache NUM_LOOPS
 *  times.
 *
 * Declaring the local variables as "register" variables encourages
 * the compiler to keep the values of these variables in a register,
 * thereby reducing their effect on the cache hit rate.
 ****************************************************************************/

int main() {
  _Alignas(64)  /* make sure that the array aligns with the cache. */
  char array[ARRAY_SIZE];
  register int outer_loop;
  register int inner_loop;
  register int solution = 0;

  for (outer_loop = 0; outer_loop < NUM_LOOPS; outer_loop++) {
    for (inner_loop = 0; inner_loop < ARRAY_SIZE; inner_loop++) {
      solution *= array[inner_loop];
    }
  }

  return solution;
}

// Large block size will mean that a fixed-size cache will have fewer blocks.
// * Increases conflicts, thus increasing the miss rate
// * Takes more time to fetch the missing block on a miss due to the additional
//   data fetched
// * Time required for this is the miss penalty
// * If adjacent words in a block are not accessed later, effort to fetch is wasted
//It still ends up being beneficial to have larger block sizes to exploit some spatiallocality

/*Now, write a C program for which the miss rate is considerably higher for a 64-byte block than for a 32-byte block. 
The easiest way to do this is to find two array locations that conflict with a 64-byte block, but not with a 32-byte block.
 If you do this, you will see the cache with the 32-byte blocks have a nearly 0% miss rate while the cache with the 64-byte
blocks has nearly a 100% miss rate.
*/