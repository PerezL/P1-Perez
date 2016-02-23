float sunX = 100;
float sunY = random(10, 210);

float xBuddy=400, yBuddy=200, hBuddy=100, wBuddy=100;

float speed = 0.5;

float goldX = 400, goldY = 100, goldW = 25, goldH = 15;  

float point;

int score = 0;

void setup() {
  size(960, 640);
}

void draw() {
  fill(10, 85, 255);
  rect(0, 0, 960, 220);        // Sky
  fill(150, 255, 15);
  rect(0, 220, 960, 640);      // Floor

  // Sun
  fill(255, 255, 10);
  ellipse(sunX, sunY, 20, 20);

  // Tree
  fill(175, 155, 15);
  rect(100, 160, 20, 60);      // trunk
  fill(15, 255, 15);
  ellipse(110, 145, 50, 50);   // leaves

  // House
  fill(255, 15, 15);
  rect(200, 160, 100, 60);  
  triangle(200, 160, 250, 120, 300, 160); // Roof
  fill(175, 155, 15);
  rect(210, 170, 30, 20);               // Window 1
  line(225, 170, 225, 190);
  line(210, 180, 240, 180);
  rect(235, 140, 30, 15);               // Window 2
  line(250, 140, 250, 155);
  line(235, 148, 265, 148);
  rect(260, 175, 30, 45);               // Door
  fill(0);
  ellipse(285, 200, 5, 5);              // `Door opening`

  // Creature
  fill(200, 255, 180);
  ellipse(xBuddy, yBuddy, hBuddy, wBuddy);            // head
  ellipse(xBuddy+20, yBuddy-10, hBuddy/4, hBuddy/4);  // eye
  line (xBuddy-25, yBuddy-10, xBuddy-5, yBuddy-10);   // eye
  triangle(xBuddy-15, yBuddy+20, xBuddy, yBuddy+5, xBuddy+15, yBuddy+20); // nose
  rect(xBuddy-50, yBuddy+50, 100, 30);     // body
  line(xBuddy-30, yBuddy+80, xBuddy-30, yBuddy+100); // leg
  line(xBuddy+30, yBuddy+80, xBuddy+30, yBuddy+100); // leg


  // Movement sun
  sunX = sunX + speed;

  // Reset sun
  if (sunX > width) sunX = 0;

  // Gold
  fill(255, 255, 15);
  ellipse(goldX, goldY, goldW, goldH);

  // Movement creature to the gold
  xBuddy =  xBuddy  +  (goldX-xBuddy) / 15;
  yBuddy =  yBuddy  +  (goldY-yBuddy) / 15;

  // Moving gold
  if (dist(goldX, goldY, xBuddy, yBuddy) < 10) {
    goldX = random(1, 960);
    goldY = random(1, 640);
    score += 100;
  }
  
  // Reduce the score
  frameRate(30);
  score -= 1;

  // Text
  fill(0);
  text( "Perez Loic", 15, 15);
  text( "Project #1", 15, 30);
  text("Buddy", xBuddy-20, yBuddy+70);   // Hero`s name
  text("Score:" + score, 15, 45);

}

