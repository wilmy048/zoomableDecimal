import vialab.SMT.*;

numberLine myNumberLine;
boolean displayText;
//Setup function for the applet
void setup(){
  //SMT and Processing setup
  size(1500, 800, SMT.RENDERER);
  SMT.init( this, TouchSource.AUTOMATIC);
  Zone zone = new Zone( "NumberLineZone", 100, 110, 1300, 500);
  SMT.add(zone);
  myNumberLine = new numberLine(#cfd986,zone.height, zone.width);
  displayText = true;
}

void draw(){
  background( 30);
  if (displayText){
    pushStyle();
    noStroke();
    fill( 200, 200);
    textAlign( LEFT, BOTTOM);
    textSize(44);
    text( "Pinch out to zoom the number line", 130, 100);
    popStyle();
  }
}

void drawNumberLineZone( Zone zone){
  myNumberLine.display();
}
void touchNumberLineZone( Zone zone){
  //this zone scales the stuff displayed in the zone rectangle
  zone.scale();
  displayText=false;

}
