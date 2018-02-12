// Alan Griffin

// Java - Medium
// BigNumber Challenges: Java BigDecimal
// Sample input available on website
// https://www.hackerrank.com/challenges/java-bigdecimal

// Bubble sort used

import java.math.BigDecimal;
import java.util.*;

class BigDecimal_Solution{

    public static void main(String[] args){
        Scanner sc = new Scanner(System.in);
        int n = sc.nextInt();
      	
        // First Constraint
      	if(n < 1 || n > 200){
      		sc.close();
      		throw new IndexOutOfBoundsException("Index " + n + " is out of bounds!");
      	}
      	
        String [] s = new String[n];
        
        for(int i = 0 ; i < n ; i++){
            s[i] = sc.next();
        }
      	sc.close();
      	
      	// Second Constraint
      	checkString(s, n);
      	
      	// Sort elements
      	runBubbleSort(s, n);
      	
        for(int i = 0 ; i < n ; i++){
            System.out.println(s[i]);
        }
    }
    
    // Sort input in descending order and return
    private static String[] runBubbleSort(String[] s, int n){
    	boolean swapped = true;
    	while(swapped == true){
    		swapped = false;
			for(int i = 0 ; i < s.length - 1 ; i++ ){
				int j = i + 1;
				BigDecimal a = new BigDecimal(s[i]);
				BigDecimal b = new BigDecimal(s[j]);
				if ( a.compareTo(b) == -1 ){
					String str = s[i] ; s[i] = s[j] ; s[j] = str ;
					swapped = true;
				}
			}
		}
    	return s;
    }
    
    // Check no string contains > 300 digits
    private static void checkString(String[] s, int n){
    	for(int i = 0 ; i < n ; i++){
    		String str = s[i];
    		int j = str.replaceAll("\\D", "").length();
    		if(j > 300){
    			throw new IndexOutOfBoundsException("String length (" + j + ") is out of bounds!");    			
    		}
    	}
    }

}      	