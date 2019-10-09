import java.util.Random;

public class Perceptron {
  final float LEARNING_CONSTANT = 0.01f;
  double[] weights;
  double error;
  double desired;
  Random random;

  Perceptron(int n) {
    weights = new double[n];
    for (int i = 0; i<weights.length; i++) {
      weights[i] = random(-1, 1);
    }
  }

  void train(double[] inputs, double desired) {
    int guess = feedForward(inputs);
    this.desired = desired;
    error = desired - guess;

    for (int i = 0; i<weights.length; i++) {
      weights[i] += LEARNING_CONSTANT * error * inputs[i];
    }
  }

  public double getError() {
    if (error == 0) {
      return desired;
    } else {
      return error;
    }
  }
  double c  = 0.1;

  void train(PVector[] forces, PVector error) {
    for (int i = 0; i < weights.length; i++) {
      weights[i] += c*error.x*forces[i].x;
      weights[i] += c*error.y*forces[i].y;
    }
  }
  int feedForward(double[] inputs) {
    int sum = 0;
    for (int i = 0; i<weights.length; i++) {
      sum += weights[i] * inputs[i];
    }
    return activate(sum);
  }
  
  PVector feedForwards(PVector forces[]){
    PVector sum = new PVector(); 
     for(int i=0; i< weights.length; i++){
       sum.x += weights[i] * forces[i].x;
       sum.y += weights[i] * forces[i].y;
     }
    return sum;
  }

  int activate(int i) {
    if (i > 0) {
      return 1;
    } else {
      return -1;
    }
  }
}
 
 int activate(int n){
  if (n > 0){
   return 1;
  }else{
   return -1; 
  }
 }
 
