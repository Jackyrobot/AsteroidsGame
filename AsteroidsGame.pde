corners = 8;
    int[] xS = {
      20 + (int)(Math.random()*10 - 5),15 + (int)(Math.random()*10 - 5),0 + (int)(Math.random()*10 - 5),-15 + (int)(Math.random()*10 - 5),-20 + (int)(Math.random()*10 - 5),-15 + (int)(Math.random()*10 - 5),0 + (int)(Math.random()*10 - 5),15 + (int)(Math.random()*10 - 5)
    };
    int[] yS = {
      0 + (int)(Math.random()*10 - 5),15 + (int)(Math.random()*10 - 5),20 + (int)(Math.random()*10 - 5),15 +(int)(Math.random()*10 - 5),0 + (int)(Math.random()*10 - 5),-15 + (int)(Math.random()*10 - 5),-20 + (int)(Math.random()*10 - 5),-15 + (int)(Math.random()*10 - 5)
    };
    rotSpeed = (int)(Math.random()*6)+2;
    xCorners = xS;
    yCorners = yS;
    myColor = 205;
    myCenterX = Math.random() * 800;
    myCenterY = Math.random() * 800;
    myDirectionX = Math.random() * 8-4;
    myDirectionY = Math.random() * 8-4;
    myPointDirection = Math.random() * 8-4;
