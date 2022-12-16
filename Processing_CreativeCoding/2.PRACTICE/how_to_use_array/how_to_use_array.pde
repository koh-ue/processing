float[] numbers = new float[4];{//the locker named "numbers" has four boxes as a type of variables, int.
numbers[0]=2;
numbers[1]=34;
numbers[2]=1234;
numbers[3]=98;
}/////////////////////////////////////???????????????????????????????
int[] numbers2={100,200,300,400};

void setup(){
  size(800,600);
  frameRate(60);
  background(0);
  noStroke();
  fill(255);
  for (int i=0; i<4; i++){
    ellipse(numbers[i],numbers[i],10,10);
  }
}
