package mlp;

public class NN {

	public static void main(String[] args){
		
		System.out.println("XOR Traning:\n");
		Multi_Layer_Perceptron m1 = new Multi_Layer_Perceptron(2,2,1);
		xor_test(m1);
		
		System.out.println("\nVector Training:\n");
		Multi_Layer_Perceptron m2 = new Multi_Layer_Perceptron(4,6,1);
		vector_test(m2);
		
	}
	
	public static void train(Multi_Layer_Perceptron m, double[][] i, double[] o, int MaxEpochs ){
		
		double error;
		
		for ( int e = 1 ; e < MaxEpochs ; e++ ){
			error = 0;		
			for ( int p = 0 ; p < i.length ; p++ ){
				m.forward(i[p]);
			    error += m.backward(o[p]);
			    if ( p % 10 == 0 ){
			    	m.updateWeights(0.25);
			    }			
			}
			if ( e % (MaxEpochs / 5) == 0){
				System.out.println("Error at epoch " + e + " is " + Math.abs(error));
			}
		}
	}
	
	public static void xor_test(Multi_Layer_Perceptron m){
		
		double[][] a = new double[4][2];
		double[] o = new double[4];
		a[0][0] = 0; a[0][1] = 0; o[0] = 0;
		a[1][0] = 0; a[1][1] = 1; o[1] = 1;
		a[2][0] = 1; a[2][1] = 0; o[2] = 1;
		a[3][0] = 1; a[3][1] = 1; o[3] = 0;
		train(m, a, o, 1000001);
		
		int correct = 0;
		for ( int i = 0 ; i < 4 ; i++ ){
			m.forward(a[i]);
			System.out.println("\n\nTEST EXAMPLE NO. " + (i + 1));
			for ( int j = 0 ; j < m.IN.length ; j++ ){
				System.out.println("\nINPUT " + (j + 1) + ": " + a[i][j]);
			}
			System.out.println("\nACTUAL OUTPUT: " + o[i]);
			System.out.println("\nPREDICTED OUTPUT: " + m.O[0]);
			System.out.println("\nERROR ON OUTPUT: " + (Math.abs(o[i] - m.O[0])));
			if ( ((o[i] - m.O[0]) < 0.005) && ((o[i] - m.O[0]) > -0.005 )){
				correct++;
			}
		}
		System.out.println("\nThe number of correctly predicted examples is: " + correct + "\n\n");
		
	}
	
	public static void vector_test(Multi_Layer_Perceptron m){
		
		double r;
		double[][] a1 = new double[40][4];
		double[][] a2 = new double[10][4];
		double[] o1 = new double[40];
		double[] o2 = new double[10];
		double sum;
		
		for ( int i = 0 ; i < 40 ; i++ ){
			sum = 0;
			for ( int j = 0 ; j < 4 ; j++ ){
				r = (Math.random() * 2) - 1;
				a1[i][j] = r;
				sum += r;
			}
			o1[i] = Math.sin(Math.toRadians(sum));
		}
		train(m,a1,o1, 500001);
		
		for ( int i = 0 ; i < 10 ; i++ ){
			sum = 0;
			for ( int j = 0 ; j < 4 ; j++ ){
				r = (Math.random() * 2) - 1;
				a2[i][j] = r;
				sum += r;
			}
			o2[i] = Math.sin(Math.toRadians(sum));
		}
		
		int correct = 0; 
		double error = 0;
		for ( int i = 0 ; i < 10 ; i++ ){
			m.forward(a2[i]);
			System.out.println("\n\nTEST EXAMPLE NO. " + (i + 1));
			for ( int j = 0 ; j < m.IN.length ; j++ ){
				System.out.println("\nINPUT " + (j + 1) + ": " + a2[i][j]);
			}
			System.out.println("\nACTUAL OUTPUT: " + o2[i]);
			System.out.println("\nPREDICTED OUTPUT: " + m.O[0]);
			System.out.println("\nERROR ON OUTPUT: " + (Math.abs(o2[i] - m.O[0])));
			error += Math.pow((o2[i] - m.O[0]), 2) / 2;
			if ( ((o2[i] - m.O[0]) < 0.05) && ((o2[i] - m.O[0]) > -0.05 )){
				correct++;
			}
		}
		System.out.println("\n\nThe number of correctly predicted examples is: " + correct);
		System.out.println("\nError on the test set is: " + Math.abs(error));
	}


}