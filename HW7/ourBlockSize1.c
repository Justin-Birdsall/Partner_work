/* i.e., 64KB.  The array needs to be at least twice the size of the
   8KB cache so that the array doesn't fit in memory. */
#define ARRAY_SIZE 64*1024

#define NUM_LOOPS 10000000

int main() {
  _Alignas(64)  /* make sure that the array aligns with the cache. */
  char array[ARRAY_SIZE];
  register int outer_loop;
  register int inner_loop;
  register int solution = 0;

  for (outer_loop = 0; outer_loop < NUM_LOOPS; outer_loop++) {
  
      //This will go into set 1 32-63 for the 32 blocks and set 0 (0-63) for 
      //64 bit block cache 
      solution *= array[32];
      //8192 is the first digit that wraps back around to set 0 for both
      //since set 0 is taken already in the 64 bit block it will boot and replace
      //the next iteration of the loop will then boot out this value for 32
      //For 32 bit blocks 0 is free so once it gets stored after first miss
      //we won't have to boot it out again
      solution *= array[8192];
      
  }

  return solution;
}
//for block in 32 64 128 256;   do valgrind --tool=cachegrind --cachegrind-out-file=/dev/null
//  --D1=8192,1,${block} ./a.out 2> output_${block}; done