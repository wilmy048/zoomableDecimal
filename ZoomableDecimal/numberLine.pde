class numberLine {
  float myHeight, myWidth;
  float distance, centerY, counterCM, counterMM, counterMCR, counterNN; 
  color lineStroked;
  
  numberLine(color stroked, float zoneHeight, float zoneWidth){
    myHeight = zoneHeight;
    myWidth = zoneWidth;
    distance = 100;
    lineStroked = stroked;
    centerY = myHeight/2;
    counterCM = 0;
    
  }

void display(){
  stroke(lineStroked);
  line( 0, myHeight/2, myWidth, myHeight/2);
  
  //first lot of lines (centimeters)
  counterCM=0;
  for (float i = 0; i < myWidth; i += distance){
          strokeWeight(1);
          line((int) i, centerY-5, (int) i, centerY+5);
          showText(distance/4, counterCM,i,centerY+5+(distance/4),0);
          //second line in milimeters
          counterMM = counterCM;
          
          
            for (float j = i; j <= i+distance; j += distance/10){
              strokeWeight(distance/90);
              line((int) j, centerY-2, (int) j, centerY+2);
              showText(distance/60, counterMM, j, centerY+3+(distance/60),1); 
               //third line in micrometers
              counterMCR = counterMM;
              for (float k = j+distance/100; k < j+distance/10; k += distance/100){
                strokeWeight(distance/170);
                line((int) k, centerY-0.8, (int) k, centerY+0.8);
                showText(distance/190, counterMCR, k, centerY+2,2); 
                counterMCR+=0.01;
              }
              counterMM+=0.1;

            }
            counterCM++;

  }
}

  void showText(float textSize, float number, float xPos, float yPos, int decimals){
    String myText;
    pushStyle();
    noStroke();
    textAlign( CENTER, BOTTOM);
    textSize(textSize);
    myText = nfc(number,decimals);
    text(myText, xPos, yPos);
    popStyle(); 
  }

}
