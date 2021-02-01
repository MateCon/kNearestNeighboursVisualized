Cell[] cells;

int arrayLength = 1000, cellInitialSize = 8, firstUnknownCell, neighbourAmount = 5;

KNN KNearestNeighbours = new KNN(neighbourAmount);
int[] neighbours = new int[neighbourAmount];

void setup(){
  size(800,800);
  frameRate(30);
  
  cells = new Cell[arrayLength];
  
  for(int i = 0; i < arrayLength; i++){
    cells[i] = new Cell(
      int(random(-width/2, width/2)),
      int(random(-width/2, width/2)),
      cellInitialSize,
      i
    );
  }
}

void draw(){
  background(255, 255, 255);
  
  drawGrid();
  
  for(int index = 0; index < cells.length; index++){
    cells[index].update();
  }
  
  firstUnknownCell = KNearestNeighbours.findFirstUnknownCell();

  if(firstUnknownCell != -1){
    cells[firstUnknownCell].state = "comparing";
    neighbours = KNearestNeighbours.findNeighbours(firstUnknownCell);
  
    KNearestNeighbours.colorTarget(firstUnknownCell, neighbours);
    KNearestNeighbours.removeNeighbours(neighbours);
    neighbours = new int[neighbourAmount];
  }
}
