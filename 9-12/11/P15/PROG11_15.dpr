PROGRAM FactorMe(input, output);

{$APPTYPE CONSOLE}

{
Geoff Yoerger
Program 11.15
Due: AHEAD
Purpose: Find a series of fibonacci numbers
}
                       
TYPE
    intArray20TYPE = array[1..20] OF Integer; // TYPEDEF: Array of 20 integers
VAR
    intArray20 : intArray20TYPE;
    calcedFibNum : Integer;
    iter : integer;
    i : integer;
    continue : boolean;


//**********
// Intro
//**********
// Welcome the user.
//**********
PROCEDURE Intro; BEGIN
    writeln('Welcome to the fibonacci number generator');
END;


//**********
// Outro
//**********
// Tie up loose ends and halt the console
//**********
PROCEDURE Outro; BEGIN
    // TODO: Put cleanup here
    readln; // Halt
END;



//**********
// testContinue
//**********
// See if a user wants to continue looping
//**********
VAR
    testContinueResponse : char;
PROCEDURE testContinue (VAR continueTEST : boolean); BEGIN
    writeln('Do you want to continue? (y/n)');
    readln(testContinueResponse);
    IF(Upcase(testContinueResponse) = 'Y') THEN
        continueTEST := true
    ELSE
        continueTEST := false;
END;



//**********
// PlusEquals
//**********
// Add arg2 to arg1
//**********
PROCEDURE PlusEquals (VAR totalPS : Integer; addThis : Integer); BEGIN
    totalPS := totalPS + addThis;
END;


//**********
// Inc
//**********
// Add 1 to arg1
//**********
PROCEDURE Inc (VAR totalInc : Integer); BEGIN
    PlusEquals(totalInc, 1);
END;

//**********
// InitIntArray20
//**********
// Initialize an array (made for a fibonacii array)
//**********
PROCEDURE InitIntArray20 (VAR theArray : intArray20TYPE);
VAR
    i : Integer;
BEGIN
    FOR i := 1 TO 20 DO
        IF((i = 1) OR (i = 2)) THEN
            theArray[i] := 1
        ELSE
            theArray[i] := 0;
END;


//**********
// calcFib
//**********
// Calc a fib number
//**********
PROCEDURE calcFib (VAR theArray : intArray20TYPE; VAR calcedFibNumCalc : Integer);
VAR
  i : integer;    
  shouldCONT : boolean;
BEGIN
    shouldCONT := true;
    FOR i := 1 TO 20 DO BEGIN
        IF((theArray[i] = 0) AND shouldCONT) THEN BEGIN
            shouldCONT := false;
            calcedFibNumCalc := theArray[i - 1] + theArray[i - 2];
            theArray[i] := calcedFibNumCalc;
        END;
    END;
END;


//**********
// OutputFibNum
//**********
// Output a fib number
//**********
PROCEDURE OutputFibNum (calcedFibNumOut : Integer); BEGIN
    write('The next Fibonacci number is ');
    write(calcedFibNumOut);
    writeln('.');
END;



BEGIN
    Intro;
    InitIntArray20(intArray20);
    iter := 2;
    REPEAT BEGIN
        Inc(iter);
        calcFib(intArray20, calcedFibNum);
        OutputFibNum(calcedFibNum);
        testContinue(continue);
    END;
    UNTIL(NOT(continue) OR (iter >= 20));
    writeln('The first ', iter, ' Fibonacci numbers are...');
    FOR i := 1 TO iter DO BEGIN
      write(intArray20[i], ', ');
    END;
    Outro;
END.
