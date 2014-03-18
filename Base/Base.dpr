PROGRAM FactorMe(input, output);

{$APPTYPE CONSOLE}

{
Geoff Yoerger
Assignment 10.0
Program 10.10
Due: AHEAD
Purpose: TODO
}

   
CONST
    assignment1WEIGHT : real = 0.1;
    assignment2WEIGHT : real = 0.1;
    assignment3WEIGHT : real = 0.25;
    assignment4WEIGHT : real = 0.2;
    assignment5WEIGHT : real = 0.05;
    assignment6WEIGHT : real = 0.3;
TYPE
    intArray20TYPE = array[1..20] OF Integer; // TYPEDEF: Array of 20 integers
    scoreArray5x6TYPE = array[1..5,1..6] OF Integer; // TYPEDEF: 5 Students, 6 Assignment scores
    CharArray3x4 = array[1..3, 1..4] OF char; // TYPEDEF: 3 Rows, 4 Columns
    RealArray10x2TYPE = array[1..10, 1..2] of real; // TYPEDEF: 10 Columns, 2 Rows
    IntArray4x5x3TYPE = array[1..4,1..5,1..3] OF Integer; // TYPEDEF: 4 rows, 5 columns, 3 height

//**********
// Intro
//**********
// Welcome the user.
//**********
PROCEDURE Intro; BEGIN
    writeln('Welcome to TODO');
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
// Prompt2Int
//**********
// Prompt user for 2 integers
//**********
PROCEDURE Prompt2Int (VAR num1Get, num2Get : Integer); BEGIN
    writeln('Please enter 2 integers.');
    read(num1Get);
    readln(num2Get);
END;


//**********
// PromptModelNum
//**********
// Prompt user for car model number
//**********
PROCEDURE PromptModelNum (VAR carModelNumGet : Integer); BEGIN
    writeln('Enter your car''s model number.');
    readln(carModelNumGet);
END;


//**********
// PromptNumReal
//**********
// Prompt user for a number (real)
//**********
PROCEDURE PromptNumReal (VAR numPrompt : real); BEGIN
    writeln('Enter a number.');
    readln(numPrompt);
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
// testDefective
//**********
// See if a car model num is defective
//**********
PROCEDURE testDefective (carModelNumTest : Integer; VAR isDefectiveTest : boolean); BEGIN
    IF(
        (carModelNumTest = 119) OR
        (carModelNumTest = 179) OR
        ((carModelNumTest <= 195) AND (carModelNumTest >= 189)) OR
        (carModelNumTest = 221) OR
        (carModelNumTest = 780)
    ) THEN
        isDefectiveTest := true
    ELSE
        isDefectiveTest := false;
END;



//**********
// PrintProuduct
//**********
// Print a product of 2 numbers
//**********
PROCEDURE PrintProuduct (num1Calc, num2Calc : Integer); BEGIN
    write(num1Calc, ' * ', num2Calc, ' = ');
    writeln(num1Calc * num2Calc);
END;


//**********
// PrintSum
//**********
// Print a sum of 2 numbers
//**********
PROCEDURE PrintSum (num1Calc, num2Calc : Integer); BEGIN
    write(num1Calc, ' + ', num2Calc, ' = ');
    writeln(num1Calc + num2Calc);
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
// PlusEqualsReal
//**********
// Add arg2 to arg1
//**********
PROCEDURE PlusEqualsReal (VAR totalPS : Real; addThis : Real); BEGIN
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
// TimesEquals
//**********
// Times arg2 to arg1
//**********
PROCEDURE TimesEquals (VAR totalPS : real; addThis : real); BEGIN
    totalPS := totalPS * addThis;
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


//**********
// PromptSum
//**********
// Prompt for a list of real numbers
//**********
VAR
    tempCurrNum : real;
PROCEDURE PromptSum (VAR sumNumsPrompt : real; VAR numNumbersPrompt : Integer); BEGIN
    sumNumsPrompt := 0;
    writeln('Enter a list of numbers seperated by spaces and ending with 0.');
    REPEAT BEGIN
        read(tempCurrNum);
        PlusEqualsReal(sumNumsPrompt, tempCurrNum);
    END;
    UNTIL(tempCurrNum = 0);
END;


//**********
// calcAverage
//**********
// arg3 = arg1 / arg2
//**********
PROCEDURE calcAverage (sumNumsCalc : real; numNumbersCalc : Integer; VAR average : real);
BEGIN 
    average := sumNumsCalc / numNumbersCalc;
END;


//**********
// OutputVectorSummary
//**********
// Output the summary of a vector sum
//**********
PROCEDURE OutputVectorSummary (sumTotalOutVS : real; numNumbersOutVS : integer; averageOutVS : real);
BEGIN
    writeln('Sum:                ', sumTotalOutVS:0:1);
    writeln('Number of numbers:  ', numNumbersOutVS);
    writeln('Average:            ', averageOutVS:0:1);
END;


//**********
// OutputMoneyAge
//**********
// Output the amount of money you will recieve when you are arg2
//**********
PROCEDURE OutputMoneyAge (moneyOutMD : real; ageOutMD : Integer);
BEGIN
    writeln('You will recieve $', moneyOutMD:0:2, ' when you are ', ageOutMD, '.');
END;



//**********
// OutputCharArray3x4
//**********
// Output a 3x4 array of characters
//**********
PROCEDURE OutputCharArray3x4 (CharArrayOutCA : CharArray3x4);
VAR
    i, j : integer;
BEGIN
    FOR i := 1 TO 3 DO BEGIN
        FOR j := 1 TO 4 DO BEGIN 
            write(CharArrayOutCA[i, j]);
        END;
        writeln;
    END;
END;


//**********
// GetStudentName
//**********
// Get a students name corrisponding to their number
//**********
PROCEDURE GetStudentName (studentNumGetSN : Integer; VAR studentNameGetSN : String);
BEGIN
    CASE studentNumGetSN OF
        1: studentNameGetSN := 'Baker   ';
        2: studentNameGetSN := 'Cook    ';
        3: studentNameGetSN := 'Douglas ';
        4: studentNameGetSN := 'Finch   ';
        5: studentNameGetSN := 'Smith   ';
    END;
END;


//**********
// GetAssignmentName
//**********
// Get an assignments name corrisponding its number
//**********
PROCEDURE GetAssignmentName (assignmentNumGetSN : Integer; VAR assignmentNameGetSN : String); BEGIN
    CASE assignmentNumGetSN OF
        1: assignmentNameGetSN := 'Prog1   ';
        2: assignmentNameGetSN := 'Prog2   ';
        3: assignmentNameGetSN := 'Midterm ';
        4: assignmentNameGetSN := 'Prog3   ';
        5: assignmentNameGetSN := 'HW      ';
        6: assignmentNameGetSN := 'Exam    ';
    END;
END;


//**********
// getAverageWeightedScore5x6
//**********
// Get the final grade for a student
//**********
PROCEDURE getAverageWeightedScore5x6 (studentNumber : Integer; scoreArrayGetAWS : scoreArray5x6TYPE;
        VAR studentAverage : real);
    BEGIN
    studentAverage := 0;
    // The constants are definied in indiviual variables, this is the easiest way :/
    // Stupid pascal :(
    PlusEqualsReal(studentAverage, (scoreArrayGetAWS[studentNumber, 1] * assignment1WEIGHT));
    PlusEqualsReal(studentAverage, (scoreArrayGetAWS[studentNumber, 2] * assignment2WEIGHT));
    PlusEqualsReal(studentAverage, (scoreArrayGetAWS[studentNumber, 3] * assignment3WEIGHT));
    PlusEqualsReal(studentAverage, (scoreArrayGetAWS[studentNumber, 4] * assignment4WEIGHT));
    PlusEqualsReal(studentAverage, (scoreArrayGetAWS[studentNumber, 5] * assignment5WEIGHT));
    PlusEqualsReal(studentAverage, (scoreArrayGetAWS[studentNumber, 6] * assignment6WEIGHT));
END;



//**********
// PrintLabeledTable5x6
//**********
// Print out a labeled gradebook table
//**********
PROCEDURE PrintLabeledTable5x6 (scoreArrayPrintLT : scoreArray5x6TYPE);
VAR
    i, j : integer;
    assignmentName : String;
    studentName : String;
    studentAverage : real;
BEGIN
    write('        '); // Fill the top left cell with nothing
    FOR i := 1 TO 6 DO BEGIN
        GetAssignmentName(i, assignmentName);
        write(assignmentName);
    END; 
    writeln('Final');
    // END 1st row
    FOR i := 1 TO 5 DO BEGIN 
        GetStudentName(i, studentName);
        write(studentName);
        FOR j := 1 TO 6 DO BEGIN 
            write(scoreArrayPrintLT[i, j]:6);
        END;
        getAverageWeightedScore5x6(i, scoreArrayPrintLT, studentAverage);
        write(studentAverage:2:6);
        writeln;
    END;
END;


//**********
// FillScores5x6
//**********
// Prompt for grades for each student
//**********
PROCEDURE FillScores5x6 (scoreArrayFillS: scoreArray5x6TYPE);
VAR
    i, j : integer;
    assignmentName : String;
    studentName : String;
BEGIN
    writeln('(Please input scores as a number 0-100)');
    FOR i := 1 TO 5 DO BEGIN 
        GetStudentName(i, studentName);
        writeln('For student ', studentName, ', what did he get on assignment:');
        FOR j := 1 TO 6 DO BEGIN 
            GetAssignmentName(j, assignmentName);
            write(assignmentName, '? ');
            readln(scoreArrayFillS[i, j]);
        END;
    END;
END;






////////////////
// ACT11_1
////////////////
VAR
    continue : boolean;
    num1, num2 : Integer;
PROCEDURE ACT11_1;
BEGIN
    Intro;
    REPEAT BEGIN
        Prompt2Int(num1, num2);
        PrintProuduct(num1, num2);
        testContinue(continue);
    END;
    UNTIL(NOT(continue));
    Outro;
END;


////////////////
// ACT11_2
////////////////
PROCEDURE ACT11_2;
VAR
    continue : boolean;
    num1, num2 : Integer;
BEGIN
    Intro;
    continue := true;
    WHILE(continue)
    DO BEGIN
        Prompt2Int(num1, num2);
        PrintSum(num1, num2);
        testContinue(continue);
    END;
    Outro;
END;


////////////////
// ACT11_3
////////////////
PROCEDURE ACT11_3;
VAR
    continue : boolean;
    carModelNum : Integer;
    isDefective : boolean;
BEGIN
    Intro;
    continue := true;
    writeln('(Enter 0 to terminate)');
    REPEAT BEGIN
        PromptModelNum(carModelNum);
        IF(carModelNum <> 0) THEN
            testDefective(carModelNum, isDefective)
        ELSE
            continue := false;
        IF(isDefective) THEN
            writeln('Your car is defective')
        ELSE
            writeln('Your car is OK');
    END;
    UNTIL(NOT(continue));
    Outro;
END;


////////////////
// ACT11_4
////////////////
PROCEDURE ACT11_4;
VAR
    continue : boolean;
    runningTotal : real;
    addMe : real;
BEGIN
    Intro;
    runningTotal := 0;
    REPEAT BEGIN
        PromptNumReal(addMe);
        PlusEqualsReal(runningTotal, addMe);
        writeln('Current Total: ', runningTotal:0:3);
        testContinue(continue);
    END;
    UNTIL(NOT(continue));
    Outro;
END;

////////////////
// PROG11_15
////////////////
PROCEDURE PROG11_15;
VAR
    intArray20 : intArray20TYPE;
    calcedFibNum : Integer;
BEGIN
    Intro;
    InitIntArray20(intArray20);
    REPEAT BEGIN
        calcFib(intArray20, calcedFibNum);
        OutputFibNum(calcedFibNum);
        testContinue(continue);
    END;
    UNTIL(NOT(continue));
    Outro;
END;

////////////////
// PROG11_16
////////////////
PROCEDURE PROG11_16;
VAR
    numNumbers : integer;
    sumTotal : real;
    average : real;
BEGIN
    Intro;
    PromptSum(sumTotal, numNumbers);
    calcAverage(sumTotal, numNumbers, average);
    OutputVectorSummary(sumTotal, numNumbers, average);
    Outro;
END;

////////////////
// PROG11_17
////////////////
PROCEDURE PROG11_17;
VAR
    age : integer;
    money : real;
BEGIN
    Intro;
    age := 1;
    money := 0.01;
    REPEAT
        OutputMoneyAge(money, age);
        PlusEquals(age, 1);
        TimesEquals(money, 2);
        testContinue(continue);
    UNTIL(NOT(continue));
    Outro;
END;

////////////////
// ACT12_1
////////////////
PROCEDURE ACT12_1;
VAR
    IntArray4x5x3 : IntArray4x5x3TYPE;
    i1, i2, i3 : integer; //Counter
    setThis : integer;
BEGIN
    Intro; 
    setThis := 1;
    FOR i1 := 1 TO 4 DO BEGIN
        FOR i2 := 1 TO 5 DO BEGIN
            FOR i3 := 1 TO 3 DO BEGIN
                IntArray4x5x3[i1, i2, i3] := setThis;
                Inc(setThis);
            END;
        END;
    END;
    // Only if you could pass methods :/ 
    // Or atleast a 'FOREACH' statement....
    FOR i1 := 1 TO 4 DO BEGIN
        FOR i2 := 1 TO 5 DO BEGIN
            FOR i3 := 1 TO 3 DO BEGIN
                writeln(IntArray4x5x3[i1, i2, i3], 
                    ' is in cell ', 
                    i1, 
                    ', ', 
                    i2, 
                    ', ', 
                    i3, 
                    '.');
            END;
        END;
    END;
    Outro;
END;

////////////////
// ACT12_2
////////////////
PROCEDURE ACT12_2;
VAR
    i, j : Integer;
    RealArray : RealArray10x2TYPE;
BEGIN
    Intro;
    writeln('Please enter 10 numbers');
    FOR i := 1 TO 9 DO
        read(RealArray[i, 1]);
    readln(RealArray[10, 1]);

    FOR i := 1 TO 10 DO BEGIN 
        RealArray[i, 2] := RealArray[i, 1] * 2;
    END;

    FOR i := 1 TO 2 DO BEGIN
        FOR j := 1 TO 10 DO BEGIN
            write(RealArray[j, i]:5:1, '   ');
        END;
        writeln;
    END;

    Outro;
END;

////////////////
// ACT12_3
////////////////
PROCEDURE ACT12_3;
VAR
    CharArray : CharArray3x4;
    i, j : Integer;
    oRowNum, oColumnNum : integer;
BEGIN
    Intro;
    // Init
    FOR i := 1 TO 3 DO BEGIN
        FOR j := 1 TO 4 DO BEGIN 
            CharArray[i, j] := 'W';
        END;
    END;

    OutputCharArray3x4(CharArray); // Out

    writeln('What row?');
    readln(oRowNum);
    writeln('What column?');
    readln(oColumnNum);
    CharArray[oRowNum, oColumnNum] := 'O';

    OutputCharArray3x4(CharArray); // Out
    Outro;
END;

////////////////
// PROG_18
////////////////
PROCEDURE PROG_18;   
VAR
    scoreArray : scoreArray5x6TYPE;
BEGIN
    Intro;
    FillScores5x6(scoreArray);
    PrintLabeledTable5x6(scoreArray);
    Outro;
END;

BEGIN
  ACT11_1;
END.
