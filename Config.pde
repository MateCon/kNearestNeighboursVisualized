class Config {
  boolean showCellPosition,
          showCellIndex,
          showUnknownCells;
  Config(boolean showCellPos, boolean showCellIdx, boolean showUknCells){
    showCellPosition = showCellPos;
    showCellIndex = showCellIdx;
    showUnknownCells = showUknCells;
  }
}

Config config = new Config(
  false, // showCellPosition
  false, // showCellIndex
  false // showUnknownCells
);
