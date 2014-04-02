program TicTacToe;

{$APPTYPE CONSOLE}

// Geoff Yoerger
// Semester Project
// 4 1 2014
// Make a tic tac toe game

const
  defaultCHAR : char = ' ';
  playerCHAR : char = 'X';
  compCHAR : char = 'O';


  vertSep : char = '|';
  horizSep : char = '-';
  crossSep : char = '+';

TYPE
  tttBoard = array[1..3, 1..3] OF char;
  // tttBoard[row number, column number]

VAR
  board : tttBoard;

  winTest : char;

// Set all the cells of the tic tac toe board to a space
PROCEDURE initBoard(VAR BoardINIT : tttBoard);
var
  i : integer;
  // Horiz (column) iterator
  j : integer;
  // Vert (row) iterator     
BEGIN
  for i := 1 TO 3 DO BEGIN
    for j := 1 TO 3 DO BEGIN
      BoardINIT[i, j] := defaultCHAR;
    END;
  END;
END;


// Print a formated tic tac toe board
PROCEDURE printBoard(BoardPRINT : tttBoard);
VAR
  i : integer;
  // Row iterator for printing
BEGIN
  writeln; // Padding

  FOR i := 1 TO 3 DO BEGIN
    write(' '); // Padding
    write(BoardPRINT[i, 1]);
    write(vertSep);
    write(BoardPRINT[i, 2]);
    write(vertSep);
    write(BoardPRINT[i, 3]);

    writeln;

    IF(i <> 3) THEN BEGIN
      write(' '); // Padding
      writeln(horizSep, crossSep, horizSep, crossSep, horizSep);
    END;
  END;
  
  writeln; // Padding
END;

PROCEDURE PromptSafe(VAR NumGet : integer);
VAR
  continue : boolean;
BEGIN
  continue := FALSE;
  REPEAT
    BEGIN
      readln(NumGet);
      IF((NumGet >= 1) AND (NumGet <= 3)) THEN
        continue := TRUE
      ELSE
        writeln('Thats not a correct number, please try again.');
    END;
  UNTIL(continue);
END;

// Prompt for a players move
PROCEDURE playerMove(VAR boardPMove : tttBoard);
VAR
  rowGet, columnGet : integer;
BEGIN  
  REPEAT
    BEGIN
      writeln('Please enter a row number');
      PromptSafe(rowGet);
      writeln('Please enter a column number');
      PromptSafe(columnGet);

      IF (boardPMove[rowGet, columnGet] <> defaultCHAR) THEN
        writeln('That spot is already filled, please try again.');
    END;
  UNTIL(boardPMove[rowGet, columnGet] = defaultCHAR);

  boardPMove[rowGet, columnGet] := playerCHAR;
END;

PROCEDURE compMove(VAR boardCMove : tttBoard);
VAR
  i, j : integer;
  // Row, Col (Iterator)

  hasntFoundSpot : boolean;

BEGIN
  hasntFoundSpot := TRUE;
  FOR i := 1 TO 3 DO BEGIN
    FOR j := 1 TO 3 DO BEGIN
      IF((boardCMove[i, j] = defaultCHAR) AND hasntFoundSpot) THEN
        BEGIN
          hasntFoundSpot := FALSE;
          boardCMove[i, j] := compCHAR;
        END;
//    ENDIF
    END;
  END;
END;

PROCEDURE checkWin(boardCheck : tttBoard; VAR winningChar : char);
VAR
  char1, char2, char3 : char;
  // Three testing chars (used to reduce clutter)

  i : integer;
  // For common iterations
BEGIN

  // Row checking
  FOR i := 1 TO 3 DO BEGIN
    // Cancel if win has already been found
    IF(winningChar = defaultCHAR) THEN BEGIN
      char1 := boardCheck[i, 1];
      char2 := boardCheck[i, 2];
      char3 := boardCheck[i, 3];
      // Check if same throught
      // FACTOR MEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE
      //EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE
      IF((char1 = char2) AND
         (char2 = char3) AND
         // And if the row isnt just blank
         (char1 <> defaultCHAR)) THEN

            winningChar := char1;
      // END FACTOR MEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE
      //EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE
      // ENDIF

    END; // ENDIF (SKIP CHECK)

  END;  // ENDFOR Row Checking)

  // Column checking
  FOR i := 1 TO 3 DO BEGIN
    IF(winningChar = defaultCHAR) THEN BEGIN
      char1 := boardCheck[1, i];
      char2 := boardCheck[2, i];
      char3 := boardCheck[3, i];
      IF((char1 = char2) AND (char2 = char3) AND (char1 <> defaultCHAR)) THEN
        winningChar := char1;
//    ENDIF

    END; // ENDIF (SKIP CHECK)

  END; // ENDFOR (Column Checking)


  // Diagonal Checking
    // TOP LEFT - BOTTOM RIGHT
    IF(winningChar = defaultCHAR) THEN BEGIN
      char1 := boardCheck[1, 1];
      char2 := boardCheck[2, 2];
      char3 := boardCheck[3, 3];
      // Check if same throught
      IF((char1 = char2) AND (char2 = char3) AND (char1 <> defaultCHAR)) THEN
        winningChar := char1;
//    ENDIF

    END;  // ENDIF (TOP LEFT - BOTTOM RIGHT)

    // TOP RIGHT - BOTTOM LEFT
    IF(winningChar = defaultCHAR) THEN BEGIN
      char1 := boardCheck[1, 3];
      char2 := boardCheck[2, 2];
      char3 := boardCheck[3, 1];
      IF((char1 = char2) AND (char2 = char3) AND (char1 <> defaultCHAR)) THEN
        winningChar := char1;
//    ENDIF
    END;  // ENDIF (TOP RIGHT - BOTTOM LEFT)
END; // ENDPROCEDURE (checkWin)


//||||||||||||||||
begin
  initBoard(board);
  printBoard(board);

  winTest := defaultCHAR;
  WHILE(winTest = defaultCHAR) DO BEGIN
    playerMove(board);
    printBoard(board);
    checkWin(board, winTest);
    
    compMove(board); 
    printBoard(board);
    checkWin(board, winTest);
  END;

  writeln(winTest, winTest, winTest, winTest, winTest, winTest);
  writeln(winTest, winTest, winTest, winTest, winTest, winTest);
  writeln(winTest, winTest, winTest, winTest, winTest, winTest);
  writeln(winTest, winTest, winTest, winTest, winTest, winTest);
  writeln(winTest, winTest, winTest, winTest, winTest, winTest);

  readln;
end.
