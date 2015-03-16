ArrayList branches = new ArrayList();


 
void setup(){
  size(640, 640);
  stroke(230,230,250,100);
  for(int i = 0; i < 100; i++){
    Branch b1 = new Branch();
  
  branches.add(b1);


  }
 
}
 
void draw(){
  background(0);
  for(int i = 0; i < branches.size(); i++){
    Branch b = (Branch) branches.get(i);
    pushMatrix();
    translate(width/2, height/2);
  rotate(radians(b.startAngle));
    b.branch(b.segments);
    popMatrix();
    
 
  }

  
}
 
class Branch {
  float segments, startAngle, angle, theta, num;
  Branch(){
    segments = random(50,200);
    startAngle = random(-360, 360);
    angle = map(mouseX, -360, 360, -10, 10);
  }
   
  void branch(float len){
    len *= 0.75;
    float t = map(mouseX/6, 0.75, 70, 1, 10);
    theta = angle + cos(len+num) * 7;
    strokeWeight(t);
   fill(0, random(255),random(255), 30);
    bezier(0, 0, 0, t, -len/2, t, 0, -len);
    bezier(0, 0, 0, t, len/2, t, 0, -len);
    fill(0, random(255), random(255));
    ellipse(0, 0, t/2, t/2);
    translate(0, -len);
   if(len > 7){
      pushMatrix();
      rotate(radians(theta));
      branch(len);
      popMatrix();
    }
    num += 0.01;
  }
}
 

