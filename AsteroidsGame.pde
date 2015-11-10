//your variable declarations here
Star [] starfield;
SpaceShip milleniumFalcon;
Asteroid[] asteroids;
public boolean upKey = false;
public boolean leftKey = false;
public boolean rightKey = false;
public boolean downKey = false;

public void setup() 
{
  size(600,600);
  background(0);
  milleniumFalcon = new SpaceShip();
  starfield = new Star[175];
  asteroids = new Asteroid[10];
  for(int i = 0; i < starfield.length; i++) 
    starfield[i] = new Star();
  for(int j = 0; j < asteroids.length; j++)
    asteroids[j] = new Asteroid();
}

public void draw() 
{
  background(0);
  for(int i = 0; i < starfield.length; i++)
    starfield[i].show();
  for(int j = 0; j < asteroids.length; j++)
  {  
    asteroids[j].move();
    asteroids[j].show();
  }
  milleniumFalcon.show();
  milleniumFalcon.move();
  if(upKey == true) milleniumFalcon.accelerate(Math.random()*0.18);
  if(downKey == true) milleniumFalcon.accelerate(Math.random()*-0.18);
  if(leftKey == true) milleniumFalcon.rotate(-5);
  if(rightKey == true) milleniumFalcon.rotate(5);
}

class SpaceShip extends Floater  
{   
  public SpaceShip()
  {
    corners = 14;
    xCorners = new int[corners];
    yCorners = new int[corners];
    xCorners[0] = 0; yCorners[0] = -8;
    xCorners[1] = -6; yCorners[1] = -6;
    xCorners[2] = -8; yCorners[2] = 0;
    xCorners[3] = -6; yCorners[3] = 6;
    xCorners[4] = 0; yCorners[4] = 8;
    xCorners[5] = 6; yCorners[5] = 6;
    xCorners[6] = 14; yCorners[6] = 4;
    xCorners[7] = 14; yCorners[7] = 2;
    xCorners[8] = 7; yCorners[8] = 2;
    xCorners[9] = 8; yCorners[9] = 0;
    xCorners[10] = 7; yCorners[10] = -2;
    xCorners[11] = 14; yCorners[11] = -2;
    xCorners[12] = 14; yCorners[12] = -4;
    xCorners[13] = 6; yCorners[13] = -6;
    myColor = color(255,0,0);
    //coordinates
    myCenterX = (int)width/2;
    myCenterY = (int)height/2;
    myDirectionX = 0;
    myDirectionY = 0;
    myPointDirection = 0;
  }
  public void setX(int x){myCenterX = x;}
  public int getX(){return (int)myCenterX;}
  public void setY(int y){myCenterY = y;}
  public int getY(){return (int)myCenterY;}
  public void setDirectionX(double x){myDirectionX = x;}
  public double getDirectionX(){return myDirectionX;}
  public void setDirectionY(double y){myDirectionY = y;}
  public double getDirectionY(){return myDirectionY;}
  public void setPointDirection(double degrees){myPointDirection = degrees;}
  public double getPointDirection(){return myPointDirection;}   
}

class Asteroid extends Floater
{
  private int rotSpeed;
  public Asteroid()
  {
    corners = 6;
    xCorners = new int[corners]; yCorners = new int[corners];
    xCorners[0] = -11; yCorners[0] = -8;
    xCorners[1] = 7; yCorners[1] = -8; 
    xCorners[2] = 13; yCorners[2] = 0;
    xCorners[3] = 6; yCorners[3] = 10;
    xCorners[4] = -11; yCorners[4] = 8; 
    xCorners[5] = -5; yCorners[5] = 0;
    myColor = color(151,151,151);
    rotSpeed = (int)(Math.random()*8)+2;
    myCenterX = (int)(Math.random()*600);
    myCenterY = (int)(Math.random()*600);
    myDirectionX = Math.random()*6;
    myDirectionY = Math.random()*6;
    myPointDirection = (Math.random()*360);

  }
  public void move()
  {
    rotate(rotSpeed);
    super.move();
  }
  public void setX(int x){myCenterX = x;}
  public int getX(){return (int)myCenterX;}
  public void setY(int y){myCenterY = y;}
  public int getY(){return (int)myCenterY;}
  public void setDirectionX(double x){myDirectionX = x;}
  public double getDirectionX(){return myDirectionX;}
  public void setDirectionY(double y){myDirectionY = y;}
  public double getDirectionY(){return myDirectionY;}
  public void setPointDirection(double degrees){myPointDirection = degrees;}
  public double getPointDirection(){return myPointDirection;}   
}

abstract class Floater //Do NOT modify the Floater class! Make changes in the SpaceShip class 
{   
  protected int corners;  //the number of corners, a triangular floater has 3   
  protected int[] xCorners;   
  protected int[] yCorners;   
  protected int myColor;   
  protected double myCenterX, myCenterY; //holds center coordinates   
  protected double myDirectionX, myDirectionY; //holds x and y coordinates of the vector for direction of travel   
  protected double myPointDirection; //holds current direction the ship is pointing in degrees    
  abstract public void setX(int x);  
  abstract public int getX();   
  abstract public void setY(int y);   
  abstract public int getY();   
  abstract public void setDirectionX(double x);   
  abstract public double getDirectionX();   
  abstract public void setDirectionY(double y);   
  abstract public double getDirectionY();   
  abstract public void setPointDirection(double degrees);   
  abstract public double getPointDirection(); 
  //Accelerates the floater in the direction it is pointing (myPointDirection)   
  public void accelerate (double dAmount)   
  {          
    //convert the current direction the floater is pointing to radians    
    double dRadians = myPointDirection*(Math.PI/180);     
    //change coordinates of direction of travel    
    myDirectionX += ((dAmount) * Math.cos(dRadians));    
    myDirectionY += ((dAmount) * Math.sin(dRadians));       
  }   
  public void rotate (double nDegreesOfRotation)   
  {     
    //rotates the floater by a given number of degrees    
    myPointDirection+=nDegreesOfRotation;   
  }   
  public void move () //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     

    //wrap around screen    
    if(myCenterX > width)    
      myCenterX = 0;       
    else if (myCenterX<0)
      myCenterX = width;        
    if(myCenterY > height)  
      myCenterY = 0;    
    else if (myCenterY < 0)    
      myCenterY = height;      
  }   
  public void show ()  //Draws the floater at the current position  
  {             
    fill(myColor);   
    stroke(myColor);    
    //convert degrees to radians for sin and cos         
    double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;    
    beginShape();         
    for(int nI = 0; nI < corners; nI++)    
    {     
      //rotate and translate the coordinates of the floater using current direction 
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated,yRotatedTranslated);    
    }   
    endShape(CLOSE);  
  }   
} 

class Star
{
  private int myX, myY;
  private double mySize;
  public Star()
  {
    myX = (int)(Math.random()*600);
    myY = (int)(Math.random()*600);
    mySize = Math.random()*2+1;
  }
  public void show()
  {
    fill(255);
    ellipse(myX, myY, (float)mySize, (float)mySize);
  }
}

public void keyPressed()
{
  if(key == CODED) 
  {
    if(keyCode == UP) upKey = true;
    if(keyCode == DOWN) downKey = true;
    if(keyCode == LEFT) leftKey = true;
    if(keyCode == RIGHT) rightKey = true;
  }
  if(key == 'z') 
  {
    milleniumFalcon.setX((int)(Math.random()*600));
    milleniumFalcon.setY((int)(Math.random()*600));
    milleniumFalcon.setPointDirection(Math.random()*360);
    milleniumFalcon.setDirectionX(0);
    milleniumFalcon.setDirectionY(0);
  }
}

public void keyReleased()
{
  if (keyCode == UP) upKey = false;
  if (keyCode == LEFT) leftKey = false;
  if (keyCode == RIGHT) rightKey = false;
  if (keyCode == DOWN) downKey = false;
}

