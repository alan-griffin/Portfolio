// Alan Griffin

// Data Structures - Medium
// Arrays Challenges: Sparse Arrays
// Sample input available on website
// https://www.hackerrank.com/challenges/sparse-arrays

import java.util.*;

public class SparseArrays_Solution {
    
	public static void main(String[] args){
        Scanner sc = new Scanner(System.in);
        int x = sc.nextInt();
      	
        // First Constraint
      	if(x < 1 || x > 1000){
      		sc.close();
      		throw new IndexOutOfBoundsException("Index " + x + " is out of bounds!");
      	}
      	
        ArrayList<String> s = new ArrayList<String>();
        
        for(int i = 0 ; i < x ; i++){
            s.add(sc.next());
        }
        
      	// Third Constraint        
        checkString(s);
        
        int y = sc.nextInt();
      	
        // Second Constraint
      	if(y < 1 || y > 1000){
      		sc.close();
      		throw new IndexOutOfBoundsException("Index " + y + " is out of bounds!");
      	}
      	
      	ArrayList<String> q = new ArrayList<String>();
        
        for(int i = 0 ; i < y ; i++){
            q.add(sc.next());
        }        
      	sc.close();
      	
      	// Third Constraint
      	checkString(q);
      	
      	int[] arr = new int[y];
      	query(arr, s, q);
      	for (int i = 0 ; i < arr.length ; i++){
      		System.out.println(arr[i]);
      	}
    }
	
    // Check no string length out of bounds
    private static void checkString(ArrayList<String> s){
    	for(int i = 0 ; i < s.size() ; i++){
    		if(s.get(i).length() > 20){
    			throw new IndexOutOfBoundsException("String length is out of bounds!");    			
    		}
    	}
    }
    
    private static int[] query(int[] arr, ArrayList<String> s, ArrayList<String> q){
    	for(int i = 0 ; i < q.size() ; i++){
    		for(int j = 0 ; j < s.size() ; j++){
    			if (q.get(i).equals(s.get(j))){
    				arr[i] = arr[i] + 1;
    			}
    		}
    	}
    	return arr;
    }
	
}
