public class Demo {
    public static void main(String[] args) {
        System.out.println(wackySum(3,7,2));

        // Can uncomment these to see other ways the sum
        // might work.
        // System.out.println(wackySum(21,26,1));

        // System.out.println(wackySum(33,42,2));
    }

    public static int wackySum(int a, int b, int c) {
        int sum = 0;
        for(int i = a; i <= b; i += c) {
            // Use this print out to see what the internal values might be
            // during running.
            // System.out.print("" + sum + " " + i + " " + (i+1)/2 + " ");
            // System.out.println("" + (i+2)/2 + " " + (i+3));
            sum += combineFour(i, (i+1)/2, (i+2)/2, (i+3));
        }
        return sum;
    }

    // Combine four ints and return their integer sum if even, 
    // otherwise return the sum with integer division by two.
    public static int combineFour(int a, int b, int c, int d) {
        int sum = a + b + c + d;
        if (sum % 2 == 0) {
            return sum;
        } else {
            return sum/2;
        }
    }
}
