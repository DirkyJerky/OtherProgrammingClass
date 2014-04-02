program TicTacToe;

{$APPTYPE CONSOLE}

// Geoff Yoerger
// Semester Project
// 4 1 2014 FIN: 4 2 2014
// Make a tic tac toe game

const
  DEBUG : boolean = FALSE;

  defaultCHAR : char = ' ';
  playerCHAR : char = 'X';
  compCHAR : char = 'O';

  tieCHAR : char = '*';

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
  
  writeln; writeln; // Padding

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


PROCEDURE oppCornerCheck(rowOCC, colOCC : integer;
      VAR boardOCC : tttBoard; VAR didntFindSpot : boolean);
BEGIN
  IF ((boardOCC[rowOCC, colOCC] = compCHAR) AND (boardOCC[(4 - rowOCC), (4 - colOCC)] = defaultCHAR))
        AND didntFindSpot THEN BEGIN
    didntFindSpot := FALSE;
    IF (DEBUG) THEN writeln('Found: OPP CORNER');//|||||||||||||||||||||||||||||||||||||||
    boardOCC[(4 - rowOCC), (4 - colOCC)] := compCHAR;
  END;
END;






PROCEDURE compMove(VAR boardCMove : tttBoard);
VAR
  i, j : integer;
  // Row, Col (Iterator)

  k, l, m, n : integer;
  // More counters

  hasntFoundSpot : boolean;

BEGIN
  hasntFoundSpot := TRUE;


  // 1: Win if possible
  FOR i := 1 TO 3 DO BEGIN
    IF(hasntFoundSpot) THEN BEGIN
      k := 0;
      l := 0;

      FOR j := 1 TO 3 DO BEGIN
        IF(boardCMove[i, j] = compCHAR) THEN
          k :=  k + 1 // Increment the filled spot counter
        ELSE
          IF (boardCMove[i, j] = defaultCHAR) THEN BEGIN
            l := l + 1; // Increment the empty spot counter
            m := i; // Track the empty spot
            n := j;
          END;
      END;

      IF((k = 2) AND (l = 1)) THEN BEGIN
        hasntFoundSpot := FALSE;
        IF (DEBUG) THEN writeln('Found: WIN ROW');//||||||||||||||||||||||||||||||||||||||||
        boardCMove[m, n] := compCHAR;
      END;

    END;

  END;
  FOR j := 1 TO 3 DO BEGIN
    IF(hasntFoundSpot) THEN BEGIN
      k := 0;
      l := 0;

      FOR i := 1 TO 3 DO BEGIN
        IF(boardCMove[i, j] = compCHAR) THEN
          k :=  k + 1 // Increment the filled spot counter
        ELSE
          IF (boardCMove[i, j] = defaultCHAR) THEN BEGIN
            l := l + 1; // Increment the empty spot counter
            m := i; // Track the empty spot
            n := j;
          END;
      END;

      IF((k = 2) AND (l = 1)) THEN BEGIN
        hasntFoundSpot := FALSE;
        IF (DEBUG) THEN writeln('Found: WIN COL');//||||||||||||||||||||||||||||||||||||||||
        boardCMove[m, n] := compCHAR;
      END;

    END;

  END;


  // 2: Block opponet Win if possible
  FOR i := 1 TO 3 DO BEGIN
    IF(hasntFoundSpot) THEN BEGIN
      k := 0;
      l := 0;

      FOR j := 1 TO 3 DO BEGIN
        IF(boardCMove[i, j] = playerCHAR) THEN
          k :=  k + 1 // Increment the filled spot counter
        ELSE
          IF (boardCMove[i, j] = defaultCHAR) THEN BEGIN
            l := l + 1; // Increment the empty spot counter
            m := i; // Track the empty spot
            n := j;
          END;
      END;

      IF((k = 2) AND (l = 1)) THEN BEGIN
        hasntFoundSpot := FALSE;
        IF (DEBUG) THEN writeln('Found: BLOCK ROW');//||||||||||||||||||||||||||||||||||||||||
        boardCMove[m, n] := compCHAR;
      END;

    END;

  END;
  FOR j := 1 TO 3 DO BEGIN
    IF(hasntFoundSpot) THEN BEGIN
      k := 0;
      l := 0;

      FOR i := 1 TO 3 DO BEGIN
        IF(boardCMove[i, j] = playerCHAR) THEN
          k :=  k + 1 // Increment the filled spot counter
        ELSE
          IF (boardCMove[i, j] = defaultCHAR) THEN BEGIN
            l := l + 1; // Increment the empty spot counter
            m := i; // Track the empty spot
            n := j;
          END;
      END;

      IF((k = 2) AND (l = 1)) THEN BEGIN
        hasntFoundSpot := FALSE;
        IF (DEBUG) THEN writeln('Found: BLOCK COL');//||||||||||||||||||||||||||||||||||||||||
        boardCMove[m, n] := compCHAR;
      END;

    END;

  END;


  // 3: Center
  IF((boardCMove[2, 2] = defaultCHAR) AND hasntFoundSpot) THEN BEGIN
    hasntFoundSpot := FALSE;
    IF (DEBUG) THEN writeln('Found: CENTER');//||||||||||||||||||||||||||||||||||||||||
    boardCMove[2, 2] := compCHAR;
  END;//ENDIF


  // 4: Opposite Corner
  oppCornerCheck(1, 1, boardCMove, hasntFoundSpot);
  oppCornerCheck(1, 3, boardCMove, hasntFoundSpot);
  oppCornerCheck(3, 1, boardCMove, hasntFoundSpot);
  oppCornerCheck(3, 3, boardCMove, hasntFoundSpot);

  // 5: A Corner
  IF(hasntFoundSpot) THEN BEGIN
    FOR i := 1 TO 3 DO BEGIN
      FOR j := 1 TO 3 DO BEGIN
        IF((boardCMove[i, j] = defaultCHAR) AND hasntFoundSpot) AND (((i + j) MOD 2) = 0) THEN
          BEGIN
            hasntFoundSpot := FALSE;
            IF (DEBUG) THEN writeln('Found: CORNER');//||||||||||||||||||||||||||||||||||||||||
            boardCMove[i, j] := compCHAR;
          END;
//      ENDIF
      END;
    END;
  END;

  // 6: A Side
  IF(hasntFoundSpot) THEN BEGIN
    FOR i := 1 TO 3 DO BEGIN
      FOR j := 1 TO 3 DO BEGIN
        IF((boardCMove[i, j] = defaultCHAR) AND hasntFoundSpot) AND (((i + j) MOD 2) = 1) THEN
          BEGIN
            hasntFoundSpot := FALSE; 
            IF (DEBUG) THEN writeln('Found: SIDE');//||||||||||||||||||||||||||||||||||||||||
            boardCMove[i, j] := compCHAR;
          END;
//      ENDIF
      END;
    END;
  END;


  // Fallback
  IF(hasntFoundSpot) THEN BEGIN
    FOR i := 1 TO 3 DO BEGIN
      FOR j := 1 TO 3 DO BEGIN
        IF((boardCMove[i, j] = defaultCHAR) AND hasntFoundSpot) THEN
          BEGIN
            hasntFoundSpot := FALSE;
            boardCMove[i, j] := compCHAR;
          END;
//      ENDIF
      END;
    END;
  END;
END;

PROCEDURE checkSimilar(char1CS, char2CS, char3CS : char; VAR outChar : char);
BEGIN
  IF((char1CS = char2CS) AND  // Check if same throught
  (char2CS = char3CS) AND

  (char1CS <> defaultCHAR)) THEN // And if they arent just blank

    outChar := char1CS;
  // ENDIF
END;

PROCEDURE checkFull(boardCheckTie : tttBoard; VAR tieCT : boolean);
VAR
  i, j : integer;
  // Counter
BEGIN
  tieCT := TRUE;
  FOR i := 1 TO 3 DO BEGIN
    FOR j := 1 TO 3 DO BEGIN
      IF(boardCheckTie[i, j] = defaultCHAR) THEN
        tieCT := FALSE;
    //ENDIF
    END;
  END;
END;

PROCEDURE checkWin(boardCheck : tttBoard; VAR winningChar : char);
VAR
  char1, char2, char3 : char;
  // Three testing chars (used to reduce clutter)

  i : integer;
  // For common iterations

  checkTieW : boolean;
BEGIN

  // Row checking
  FOR i := 1 TO 3 DO BEGIN
    // Cancel if win has already been found
    IF(winningChar = defaultCHAR) THEN BEGIN
      char1 := boardCheck[i, 1];
      char2 := boardCheck[i, 2];
      char3 := boardCheck[i, 3];
      checkSimilar(char1, char2, char3, winningChar);
    END; // ENDIF (SKIP CHECK)

  END;  // ENDFOR Row Checking)

  // Column checking
  FOR i := 1 TO 3 DO BEGIN
    IF(winningChar = defaultCHAR) THEN BEGIN
      char1 := boardCheck[1, i];
      char2 := boardCheck[2, i];
      char3 := boardCheck[3, i];
      checkSimilar(char1, char2, char3, winningChar);

    END; // ENDIF (SKIP CHECK)

  END; // ENDFOR (Column Checking)


  // Diagonal Checking
    // TOP LEFT - BOTTOM RIGHT
    IF(winningChar = defaultCHAR) THEN BEGIN
      char1 := boardCheck[1, 1];
      char2 := boardCheck[2, 2];
      char3 := boardCheck[3, 3];
      checkSimilar(char1, char2, char3, winningChar);
//  ENDIF

    END;  // ENDIF (TOP LEFT - BOTTOM RIGHT)

    // TOP RIGHT - BOTTOM LEFT
    IF(winningChar = defaultCHAR) THEN BEGIN
      char1 := boardCheck[1, 3];
      char2 := boardCheck[2, 2];
      char3 := boardCheck[3, 1];
      checkSimilar(char1, char2, char3, winningChar);
//  ENDIF (TOP RIGHT - BOTTOM LEFT)
    END;


    
  checkFull(boardCheck, checkTieW);
  IF((checkTieW) AND (winningChar = defaultCHAR)) THEN
    winningChar := tieCHAR;
END; // ENDPROCEDURE (checkWin)


PROCEDURE doGame(VAR BoardGAME : tttBoard; VAR winningCHAR : char);
VAR
  TIE : boolean;
BEGIN
  TIE := FALSE;
  WHILE ((winTest = defaultCHAR) and NOT(TIE)) DO BEGIN
    playerMove(board);
    printBoard(board);
    checkWin(board, winTest);

    IF(winTest = tieCHAR) THEN
      TIE := TRUE;

    IF ((winTest = defaultCHAR) and NOT(TIE)) THEN BEGIN
      writeln('Computer move:...');
      compMove(board);
      printBoard(board);
      checkWin(board, winTest);
    END; //ENDIF

    IF(winTest = tieCHAR) THEN
      TIE := TRUE;
      
  END; //ENDWHILEDO

  IF(winTest = defaultCHAR) THEN
    winTest := tieCHAR;
END;

PROCEDURE showWinner(winCharSW : char);
BEGIN
  IF (winTest <> tieCHAR) THEN BEGIN
    writeln(winTest, winTest, winTest, winTest, winTest,
        winTest, winTest, winTest, winTest, winTest);
    writeln(winTest, '        ', winTest);
    writeln(winTest, ' WINNER ', winTest);
    writeln(winTest, '        ', winTest);
    writeln(winTest, winTest, winTest, winTest, winTest,
        winTest, winTest, winTest, winTest, winTest);
  END ELSE BEGIN
    writeln(winTest, winTest, winTest, winTest, winTest,
        winTest, winTest, winTest, winTest, winTest);
    writeln(winTest, '        ', winTest);
    writeln(winTest, 'TIE GAME', winTest);
    writeln(winTest, '        ', winTest);
    writeln(winTest, winTest, winTest, winTest, winTest,
        winTest, winTest, winTest, winTest, winTest);
  END;
END;


//||||||||||||||||
begin
  initBoard(board);
  printBoard(board);

  winTest := defaultCHAR;
  doGame(board, winTest);

  showWinner(winTest);


  readln;
end.
