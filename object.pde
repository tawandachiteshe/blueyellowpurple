class object{
 PVector location;
 PVector speed;
float dir;
Perceptron p; 
 public object(){
   p = new Perceptron(3);
  location = new PVector(random(width),random(height));
  speed  = new PVector(random(-1,2),random(-2,6));
 }
 
 public void update(){
  location.add(speed);
  
  
  if (location.x > width){
    speed.x  += 1 * -dir;
  }
   
 }
 
 public void show(){
 float r = map((float) location.x/2, 0, 255.0f, 0, (float) width/2);
  float g = map((float) location.x/2, 255, 0.0f, 0, (float) width/2);
   float b = map((float) location.x/2, 0, 255.0f, 0, (float) height/2);
   double inputs[] = {r,g,b};
   int guess = p.feedForward(inputs);
   p.train(inputs,g);
   if (guess > 0){
      fill(r,b,g);
   }else{
      fill(r,g,b);
   }
   println();
   

 ellipse(location.x, location.y,8,8);  
 }
 
  
}
