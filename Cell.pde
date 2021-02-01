color red = color(200, 0, 0),
      blue = color(0, 0, 200),
      green = color(0, 155, 0),
      yellow = color(255,255,0),
      orange = color(255, 105, 0),
      black = color(0, 0, 0);

class Cell {
  int xPos, yPos, size, initialSize, index;
  String state = "unknown", position;
  boolean isNeighbour = false;
  Cell(int x ,int y, int initSize, int i){
    xPos = x;
    yPos = y;
    index = i;
    initialSize = initSize;
    size = initialSize;
    position = "(" + xPos + ", " + -yPos + ")";
    if(xPos < -width/4 && -yPos < -height/4 && int(random(2)) == 1){
      state = "red";
    } else if(xPos > width/4 && -yPos > -height/4 && -yPos < height/4 && int(random(2)) == 1){
      state = "blue";
    } else if(xPos < -width/4 && -yPos > height/4 && int(random(3)) == 1){
      state = "green";
    }
  }
  
  void showCell(int cellSize, int shift){
    String position = "(" + xPos + ", " + -yPos + ") ";
    String indexation = "(" + index + ")";
    
    noStroke();
    strokeWeight(0);
    if(state == "red"){
      fill(red);
    } else if(state == "blue"){
      fill(blue);
    } else if(state == "green"){
      fill(green);
    } else if(state == "comparing"){
      fill(yellow);
    } else {
      if(config.showUnknownCells == true){
        fill(0, 0, 0, 10);
      } else {
        noFill();
      }
    }
    if(isNeighbour == true){
      fill(orange);
    }
    circle(xPos + width/2, yPos + height/2, cellSize);
    
    String msj = "";
    if(config.showCellPosition == true){ msj += position; }
    if(config.showCellIndex){ msj += indexation; }
    
    if(msj != ""){
      if(size > initialSize){
        text(msj, xPos + width/2 + 8, yPos + height/2 + 3 + shift);
      } else {
        text(msj, xPos + width/2 + 8, yPos + height/2 + 3);
      }
    }
  }
  
  void highlight(int cellSize){
    String position = "(" + xPos + ", " + -yPos + ")";
    
    strokeWeight(0);
    
    fill(0, 0, 0, 200);
    rect(width - 100, height - 40, 100, 40);
    
    fill(yellow);
    circle(width - 80, height - 20, cellSize);
    
    text(position, width - 75, height - 17);
  }
  
  void update(){
    int mouseXPositionInGrid = mouseX - 400,
        mouseYPositionInGrid = height - mouseY - 400,
        shift = 0;
    if((mouseXPositionInGrid > xPos - size/2 && mouseXPositionInGrid < xPos + size/2) &&
       (mouseYPositionInGrid > -yPos - size/2 && mouseYPositionInGrid < -yPos + size/2)){
      size = 16;
      shift = size/6;
      textSize(size);
      showCell(size, shift);
      
      size = initialSize;
      textSize(12);
      highlight(initialSize);
    } else {
      size = initialSize;
      textSize(12);
      showCell(size, shift);
    }
  }
}
