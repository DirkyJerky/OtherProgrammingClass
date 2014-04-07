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

  i1, i0, j0, i2 : integer;
  //Even more!

  testForCHAR : char;

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

  //Diagonal


  //TL-BR
  i := 1;
  j := 1;
  k := 0;
  l := 0;
  IF(boardCMove[i, j] = compCHAR) THEN BEGIN
    k :=  k + 1; // Increment the filled spot counter
    END
  ELSE
    IF (boardCMove[i, j] = defaultCHAR) THEN BEGIN
    l := l + 1; // Increment the empty spot counter
    m := i; // Track the empty spot
    n := j;
  END;//ENDELSE

  i := 2;
  j := 2;
  IF(boardCMove[i, j] = compCHAR) THEN
    k :=  k + 1 // Increment the filled spot counter
  ELSE
    IF (boardCMove[i, j] = defaultCHAR) THEN BEGIN
    l := l + 1; // Increment the empty spot counter
    m := i; // Track the empty spot
    n := j;
  END;//ENDELSE
  
  i := 3;
  j := 3;
  IF(boardCMove[i, j] = compCHAR) THEN
    k :=  k + 1 // Increment the filled spot counter
  ELSE
    IF (boardCMove[i, j] = defaultCHAR) THEN BEGIN
    l := l + 1; // Increment the empty spot counter
    m := i; // Track the empty spot
    n := j;
  END;//ENDELSE

  IF((k = 2) AND (l = 1)) THEN BEGIN
    hasntFoundSpot := FALSE;
    IF (DEBUG) THEN writeln('Found: WIN TL-BR');//||||||||||||||||||||||||||||||||||||||||
    boardCMove[m, n] := compCHAR;
  END;//ENDIF

  //TR-BL
  i := 1;
  j := 3;
  k := 0;
  l := 0;
  IF(boardCMove[i, j] = compCHAR) THEN
    k :=  k + 1 // Increment the filled spot counter
  ELSE
    IF (boardCMove[i, j] = defaultCHAR) THEN BEGIN
    l := l + 1; // Increment the empty spot counter
    m := i; // Track the empty spot
    n := j;
  END;//ENDELSE

  i := 2;
  j := 2;
  IF(boardCMove[i, j] = compCHAR) THEN
    k :=  k + 1 // Increment the filled spot counter
  ELSE
    IF (boardCMove[i, j] = defaultCHAR) THEN BEGIN
    l := l + 1; // Increment the empty spot counter
    m := i; // Track the empty spot
    n := j;
  END;//ENDELSE
  
  i := 3;
  j := 1;
  IF(boardCMove[i, j] = compCHAR) THEN
    k :=  k + 1 // Increment the filled spot counter
  ELSE
    IF (boardCMove[i, j] = defaultCHAR) THEN BEGIN
    l := l + 1; // Increment the empty spot counter
    m := i; // Track the empty spot
    n := j;
  END;//ENDELSE 

  IF((k = 2) AND (l = 1)) THEN BEGIN
    hasntFoundSpot := FALSE;
    IF (DEBUG) THEN writeln('Found: WIN TR-BL');//||||||||||||||||||||||||||||||||||||||||
    boardCMove[m, n] := compCHAR;
  END;//ENDIF






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
  //Diagonal

  IF(hasntFoundSpot) THEN BEGIN
  //TL-BR
  k := 0;
  l := 0;
  i := 1;
  j := 1;
  IF(boardCMove[i, j] = playerCHAR) THEN
    k :=  k + 1 // Increment the filled spot counter
  ELSE
    IF (boardCMove[i, j] = defaultCHAR) THEN BEGIN
    l := l + 1; // Increment the empty spot counter
    m := i; // Track the empty spot
    n := j;
  END;//ENDELSE

  i := 2;
  j := 2;
  IF(boardCMove[i, j] = playerCHAR) THEN
    k :=  k + 1 // Increment the filled spot counter
  ELSE
    IF (boardCMove[i, j] = defaultCHAR) THEN BEGIN
    l := l + 1; // Increment the empty spot counter
    m := i; // Track the empty spot
    n := j;
  END;//ENDELSE

  i := 3;
  j := 3;
  IF(boardCMove[i, j] = playerCHAR) THEN
    k :=  k + 1 // Increment the filled spot counter
  ELSE
    IF (boardCMove[i, j] = defaultCHAR) THEN BEGIN
    l := l + 1; // Increment the empty spot counter
    m := i; // Track the empty spot
    n := j;
  END;//ENDELSE
  IF((k = 2) AND (l = 1)) THEN BEGIN
    hasntFoundSpot := FALSE;
    IF (DEBUG) THEN writeln('Found: BLOCK TL-BR');//||||||||||||||||||||||||||||||||||||||||
    boardCMove[m, n] := compCHAR;
  END;//ENDIF
  END;
  IF(hasntFoundSpot) THEN BEGIN
  //TR-BL    
  k := 0;
  l := 0;

  i := 1;
  j := 3;
  IF(boardCMove[i, j] = playerCHAR) THEN
    k :=  k + 1 // Increment the filled spot counter
  ELSE
    IF (boardCMove[i, j] = defaultCHAR) THEN BEGIN
    l := l + 1; // Increment the empty spot counter
    m := i; // Track the empty spot
    n := j;
  END;//ENDELSE

  i := 2;
  j := 2;
  IF(boardCMove[i, j] = playerCHAR) THEN
    k :=  k + 1 // Increment the filled spot counter
  ELSE
    IF (boardCMove[i, j] = defaultCHAR) THEN BEGIN
    l := l + 1; // Increment the empty spot counter
    m := i; // Track the empty spot
    n := j;
  END;//ENDELSE

  i := 3;
  j := 1;
  IF(boardCMove[i, j] = playerCHAR) THEN
    k :=  k + 1 // Increment the filled spot counter
  ELSE
    IF (boardCMove[i, j] = defaultCHAR) THEN BEGIN
    l := l + 1; // Increment the empty spot counter
    m := i; // Track the empty spot
    n := j;
  END;//ENDELSE

  IF((k = 2) AND (l = 1)) THEN BEGIN
    hasntFoundSpot := FALSE;
    IF (DEBUG) THEN writeln('Found: BLOCK TR-BL');//||||||||||||||||||||||||||||||||||||||||
    boardCMove[m, n] := compCHAR;
  END;//ENDIF
  END;





  // Make forks!  
  // Block Forks!
  IF(hasntFoundSpot) THEN BEGIN
  FOR i2 := 1 TO 2 DO BEGIN
  CASE i2 OF
    1: testForCHAR := compCHAR; // Test if we can make a fork
    2: testForCHAR := playerCHAR; // Then Test if we can block a fork
  END;


  // Corner Forks
  IF(hasntFoundSpot) THEN
  FOR i1 := 1 TO 4 DO BEGIN
    CASE i1 OF
      1: BEGIN
        i := 1;
        j := 1;
      END;
      2: BEGIN
        i := 1;
        j := 3;
      END;
      3: BEGIN
        i := 3;
        j := 1;
      END;
      4: BEGIN
        i := 3;
        j := 3;
      END;
    END;//ENDCASE
    j0 := 4 - j;
    i0 := 4 - i;

    IF(hasntFoundSpot) THEN
    IF(
       (boardCMove[i, j] = defaultCHAR) AND // SELF
       (boardCMove[i0, j] = defaultCHAR) AND  // OPPO ROW
       (boardCMove[i, j0] = defaultCHAR) AND  // OPPO COL
       (boardCMove[i, 2] = testForCHAR) AND  // ADJ ROW
       (boardCMove[2, j] = testForCHAR)
    )



        THEN  // ADJ COL
       BEGIN

       hasntFoundSpot := FALSE;
       IF (DEBUG) THEN writeln('Found: CORNER FORK: ', testForCHAR);//||||||||||||||||||||||||||||||||||||||||
       boardCMove[i, j] := compCHAR;

    END;//ENDIF


    IF(hasntFoundSpot) THEN
    IF((boardCMove[i, j] = defaultCHAR) AND // SELF
       (boardCMove[i0, j] = testForCHAR) AND  // OPPO ROW
       (boardCMove[i, j0] = testForCHAR) AND  // OPPO COL
       (boardCMove[i, 2] = defaultCHAR) AND  // ADJ ROW
       (boardCMove[2, j] = defaultCHAR))
       
       THEN BEGIN
       IF (DEBUG) THEN writeln('Found: CORNER FORK: ', testForCHAR);//||||||||||||||||||||||||||||||||||||||||
       hasntFoundSpot := FALSE;
       boardCMove[2, j] := compCHAR;

    END;//ENDIF
  END;//ENDFOR
  END;
  IF(hasntFoundSpot) THEN BEGIN
  // Side Forks
  IF(hasntFoundSpot) THEN
  FOR i1 := 1 TO 4 DO BEGIN
    CASE i1 OF
      1: BEGIN
        i := 1;
        j := 2;
      END;
      2: BEGIN
        i := 2;
        j := 1;
      END;
      3: BEGIN
        i := 3;
        j := 2;
      END;
      4: BEGIN
        i := 2;
        j := 3;
      END;
    END;//ENDCASE
    j0 := 4 - j;
    i0 := 4 - i;
    IF(hasntFoundSpot) THEN
    IF((boardCMove[2, 2] = testForCHAR) AND // CENTER
       (boardCMove[i0, j] = defaultCHAR) AND  // SELF OR OPPO
       (boardCMove[i, j0] = defaultCHAR))   // SELF OR OPPO
       THEN BEGIN
       IF ((i = 2) AND (boardCMove[1, j] = testForCHAR) AND (boardCMove[3, j] = defaultCHAR)) OR
         ((i = 2) AND (boardCMove[1, j] = defaultCHAR) AND (boardCMove[3, j] = testForCHAR)) THEN BEGIN
         IF(boardCMove[1, j] = testForCHAR) THEN BEGIN
            boardCMove[3, j] := compCHAR;
            hasntFoundSpot := FALSE;
            IF (DEBUG) THEN writeln('Found: SIDE FORK: ', testForCHAR);//|||||||||||||||||||||||||||||||
          END ELSE BEGIN
            boardCMove[1, j] := compCHAR;
            hasntFoundSpot := FALSE;
            IF (DEBUG) THEN writeln('Found: SIDE FORK: ', testForCHAR);//||||||||||||||||||||
          END;

       END;

       IF ((j = 2) AND (boardCMove[i, 1] = testForCHAR) AND (boardCMove[i, 3] = defaultCHAR)) OR
         ((j = 2) AND (boardCMove[i, 1] = defaultCHAR) AND (boardCMove[i, 3] = testForCHAR)) THEN BEGIN
          IF(boardCMove[i, 1] = testForCHAR) THEN BEGIN
            boardCMove[i, 3] := compCHAR;
            hasntFoundSpot := FALSE;
            IF (DEBUG) THEN writeln('Found: SIDE FORK: ', testForCHAR);//|||||||||||||||||||||||||||||||
          END ELSE BEGIN
            boardCMove[i, 1] := compCHAR;
            hasntFoundSpot := FALSE;
            IF (DEBUG) THEN writeln('Found: SIDE FORK: ', testForCHAR);//||||||||||||||||||||
          END;
       END;


//       THEN BEGIN

//       hasntFoundSpot := FALSE;
//       IF (DEBUG) THEN writeln('Found: SIDE FORK: ', testForCHAR);//||||||||||||||||||||||||||||||||||||||||
//       boardCMove[i, j] := compCHAR;



    END;//ENDIF
  END;//ENDFOR



  END;//ENDIF
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
