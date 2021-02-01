class KNN{
  int numberOfNeighbours;
  
  KNN(int NOfN){
    numberOfNeighbours = NOfN;
  }
  
  int findFirstUnknownCell(){
    int index = 0;
    while(cells[index].state != "unknown" && index < arrayLength-1){
      if(cells[index].state == "comparing"){ return -1; }
      index++;
    }
    return index;
  }
   
  int[] findNeighbours(int indexCellCompared){
    int[] neighbours = new int[numberOfNeighbours];
    float proximity;
    float nearestNeighbourProximity = width*width;
    int nearestNeighbourIndex = -1;
    
    for(int i = 0; i < neighbours.length; i++){
      nearestNeighbourProximity = width*width;
      nearestNeighbourIndex = -1;
      for(int j = 0; j < cells.length; j++){
        if((cells[j].state != "unknown" &&
           cells[j].state != "searching") &&
           cells[j].isNeighbour == false){

          proximity = sqrt(pow(cells[indexCellCompared].xPos - cells[j].xPos, 2) + 
                           pow(cells[indexCellCompared].yPos - cells[j].yPos, 2));
          if(proximity < nearestNeighbourProximity && proximity != 0){
            nearestNeighbourProximity = proximity;
            nearestNeighbourIndex = j;
          }
          print(cells[indexCellCompared].position, " ", cells[j].position, "", proximity, " ", nearestNeighbourProximity, " ", nearestNeighbourIndex, "\n");
        }
      }
      if(nearestNeighbourIndex == -1){
        return neighbours;
      } else {
        neighbours[i] = nearestNeighbourIndex;
        cells[nearestNeighbourIndex].isNeighbour = true;
      }
    }
    return neighbours;
  }
  
  void removeNeighbours(int[] neighbours){
    for(int i = 0; i < neighbours.length; i++){
      cells[neighbours[i]].isNeighbour = false;
    }
  }
  
  void colorTarget(int target, int[] neighbours){
    String[] colors = {"red", "green", "blue"};
    int[] counters = {0, 0, 0};
    int index = 0;
    String largestGroup = "unknown";
    int largestGroupLength = -1;
    
    for(int i = 0; i < neighbours.length; i++){
      for(int j = 0; j < colors.length; j++){
        if(colors[j] == cells[neighbours[i]].state){
          counters[j]++;
        }
      }
    }
    
    while(index < colors.length){
      if(counters[index] > largestGroupLength){
        largestGroup = colors[index];
        largestGroupLength = counters[index];
      }
      index++;
    }
    
    cells[target].state = largestGroup;
  }
}
