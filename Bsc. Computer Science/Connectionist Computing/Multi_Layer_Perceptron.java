package mlp;

public class Multi_Layer_Perceptron {

	private double NI, NH, NO;
	private double W1[][], W2[][];
	private double DW1[][], DW2[][];
	private double Z1[], Z2[];
	double H[], IN[];
	double O[];
	
	public Multi_Layer_Perceptron(int n_I, int n_H, int n_O){
		this.NI = n_I;
		this.NH = n_H;
		this.NO = n_O;
		H = new double[(int) NH + 1];
		O = new double[(int) NO];
		IN = new double[(int) NI + 1];
		Z2 = new double[(int) (NO)];
		Z1 = new double[(int) (NH+1)];
		W1 = new double[(int) (NH+1)][(int) (NI+1)];
		DW1 = new double[(int) (NH+1)][(int) (NI+1)];
		W2 = new double[(int) (NO)][(int) (NH+1)];
		DW2 = new double[(int) (NO)][(int) (NH+1)];
		randomize();
	}
	
	public void randomize(){
		
		for ( int i = 0 ; i <= NH ; i++ ){
			for ( int j = 0 ; j < NI ; j++ ){
				W1[i][j] = Math.random();
			}	
		}
		for ( int j = 0 ; j < NO ; j++ ){
			for ( int i = 0 ; i <= NH ; i++ ){
				W2[j][i] = Math.random();
			}	
		}

		for ( int i = 0 ; i <= NH ; i++ ){
			for ( int j = 0 ; j < NI ; j++ ){
				DW1[i][j] = 0;
			}	
		}
		
		for ( int j = 0 ; j < NO ; j++ ){
			for ( int i = 0 ; i <= NH ; i++ ){
				DW2[j][i] = 0;
			}	
		}		
	}
	
	public void forward(double I[]){
		
		IN = I;
		double h, o;
		
		// Hidden Layer pass
		for ( int i = 0 ; i <= NH ; i++ ){
			h = 0;
			for ( int j = 0 ; j < NI ; j++ ){
				h += W1[i][j] * IN[j];
			}
			// Add bias
			h += 1;
			H[i] = 1 / (1 + Math.exp(-h));
		}
		
		// Output layer pass
		for ( int i = 0 ; i < NO ; i++ ){
			o = 0;
			for ( int j = 0 ; j <= NH ; j++ ){
				o += W2[i][j] * H[j];
			}
			// Add bias
			o += 1;
			O[i] = 1 / (1 + Math.exp(-o));
		}
	}
	
	public double backward(double t){
		
		double error = 0, e = 0;
		
		// Compute Delta's for Upper Layer
		for ( int i = 0 ; i < NO ; i++ ){
			Z2[i] = (t - O[i]) * O[i] * (1 - O[i]);
			error += Math.pow((t - O[i]), 2) / 2;
		}
		
		for ( int i = 0 ; i < NO ; i++ ){
			for ( int j = 0 ; j <= NH ; j++ ){
				DW2[i][j] += Z2[i] * H[j]; 
			}
		}
		
		// Compute Delta's for lower layer
		for ( int i = 0 ; i <= NH ; i++ ){
			for ( int j = 0 ; j < NO ; j++ ){
				e += Z2[j] * W2[j][i];
			}
			Z1[i] = H[i] * (1 - H[i]) * e;
			e = 0;
		}
		
		for ( int i = 0 ; i <= NH ; i++ ){
			for ( int j = 0 ; j < NI ; j++ ){
				DW1[i][j] += Z1[i] * IN[j]; 
			}
		}
		
		return error;
	}

	public void updateWeights(double learningRate){
		
		for ( int i = 0 ; i <= NH ; i++ ){
			for ( int j = 0 ; j < NI ; j++ ){
				W1[i][j] += learningRate * DW1[i][j];
				DW1[i][j] = 0;
			}	
		}
		
		for ( int i = 0 ; i < NO ; i++ ){
			for ( int j = 0 ; j <= NH ; j++ ){
				W2[i][j] += learningRate * DW2[i][j];
				DW2[i][j] = 0;
			}	
		}
		
	}	
	
}
