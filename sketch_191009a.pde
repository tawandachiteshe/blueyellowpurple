object obj[];

void setup(){
  obj = new object[1000];
  for(int i = 0; i < obj.length ; i++){
    
   obj[i] = new object(); 
  }
  size(700,700);
}

void draw(){
  background(255);
  frameRate(15);
  for (object a : obj){
   a.update();
   a.show();
  }
}
