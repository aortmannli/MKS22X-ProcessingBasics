
int MAX_VALUE = 100;
int MIN_VALUE = -100;
Visualizer v;

/*You are simulating a visualizer of multiple values
 You need to create a display method first. 
 Then you can make a method that changes the values each time the update is called. 
 */
class Visualizer {
  float x, y;
  float [] values;
  float [] speeds;
  Visualizer(float x, float y) {
    this.x = x;
    this.y = y;
    values = new float[20];
    speeds = new float[20];
    for (int i = 0; i < values.length; i++) {
      values[i] = random(-99, 99);
      speeds[i] = random(2);
    }
  }

  void display() {
    //draw the bars equally spaced inside this box. 
    //You can assume 10, but it would be even better 
    //if you could modify it to be larger increments.
    fill(255);
    rect(x, y, 400, 200);
    //This is a 200x400 box.
    //The width of the visualizer is 400! This rect is the border

    //the line is the 0 y-value, the top is 100, the bottom is -100
    line(x, y+100, x+400, y+100);

    //You need to use a loop. You need to make the HEIGHT of the bars 
    //the values in the array.
    //Negative values are red, and go below the line.
    //Positive values are green and go above the line.

    //???WRITE THIS METHOD FIRST!!!
    //THESE ARE WRONG: They just illustrate how they could look
    for (int i = 0; i < values.length; i++) {
      if (values[i] > 0) {
        if(values[i] > 50){
          fill(100, 200, 0);
          rect(x+i*20, y+100, 20, values[i]*-1);
        }else{
          fill(220, 220, 0);
          rect(x+i*20, y+100, 20, values[i]*-1);
        }
      } else {
        if(values[i] < -50){
          fill(200, 60, 0);
          rect(x+i*20, y+100, 20, values[i]*-1);
        }else{
          fill(200, 120, 0);
          rect(x+i*20, y+100, 20, values[i]*-1);
        }
      }
    }
    //Width of the visualizer is 400!

  
  }
  void update() {
    //???WRITE THIS METHOD SECOND!!!
    for (int i = 0; i < values.length; i++) {
      values[i] += speeds[i]; //the speed updates the values. Do not touch this.

      if (values[i] >= 100 || values[i] <= 100 * -1) { 
        speeds[i] *= -1;
      }
    }
  }
}

void setup() {
  size(600, 500);
  v = new Visualizer(20, 20);
}
void draw() {
  background(255);
  v.display();
  v.update();
}
