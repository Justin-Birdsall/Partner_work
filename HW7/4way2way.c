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
        
      solution *= array[1024];
      solution *= array[768];
      solution *= array[512];
      solution *= array[256];
      
  }
  return solution;
}
//Lines to run program
/*
2 way 32 bit block size: for block in 32; 
do valgrind --tool=cachegrind --D1=256,2,${block} ./a.out 2> output_${block}; done

4 way 32 bit block size: for block in 32; 
do valgrind --tool=cachegrind --D1=256,4,${block} ./a.out 2> output_${block}; done

*/