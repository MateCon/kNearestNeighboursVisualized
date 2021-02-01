void drawGrid(){
  int indexLength = 50;
  
  stroke(0,0,0,80);
  strokeWeight(1);
  fill(0,0,0,80);
  
  line(width/2, 0, width/2, height);
  line(0, height/2, width, height/2);
  
  for(int x = -width/2; x < width/2; x += indexLength){
    line(x + width/2, height/2 - indexLength / 5, x + width/2, height/2 + indexLength / 5);
    text(x, x + width/2 + 2, height/2 + 16 + indexLength / 10);
  }
  
  for(int y = -height/2; y < height/2; y += indexLength){
    line(width/2 - indexLength / 5, y + height/2, width/2 + indexLength / 5, y + height/2);
    text(-y, width/2 + 12 + indexLength / 10, y + height/2 + 12);
  }
}
