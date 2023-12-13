/* i.e., 64KB.  The array needs to be at least twice the size of the
   8KB cache so that the array doesn't fit in memory. */
#define ARRAY_SIZE 64*1024

#define NUM_LOOPS 10000000


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
  
      //DON'T DO IT DOES NOT WORK FOR NO REASON AT ALL
      solution *= array[128];
      solution *= array[64];
      //8192 is the first digit that wraps back around 
      solution *= array[256];
      
  }

  return solution;
}
//for block in 32;   do  valgrind --tool=cachegrind --D1=256,2,${block} ./a.out 2> output_${block}; done
//for block in 32;   do  valgrind --tool=cachegrind --D1=256,4,${block} ./a.out 2> output_${block}; done