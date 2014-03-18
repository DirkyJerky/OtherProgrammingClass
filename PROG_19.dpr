PROGRAM FactorMe(input, output)

{
Geoff Yoerger
Program 10.19
Due: AHEAD
Purpose: TODO
}

CONST
TYPE
    CharArrayTYPE : array[1..4, 1..4, 1..2] OF char; // TYPEDEF: 4 high school s, 4 quarters, 2 classes
VAR
    ourScores : CharArrayTYPE;
    usersName : String;
    yearName : String;
    className : String;
    i, i1, i2 : Integer;
    studentAverage : char;

    averageRealFind : real;

//**********
// Intro
//**********
// Welcome the user.
//**********
PROCEDURE Intro() BEGIN
    writeln('Welcome to your high school grade summarizer!');
END;


//**********
// Outro
//**********
// Tie up loose ends and halt the console
//**********
PROCEDURE Outro (TODO : String; VAR RETURN : String) BEGIN
    // TODO: Put cleanup here
    readln; // Halt
END;

//**********
// getYearName
//**********
// Get the name of the corrisponding year
//**********
PROCEDURE getYearName (ID : Integer; VAR theYearName : String) BEGIN
    CASE ID OF
        1 : theYearName := 'Freshman  ';
        2 : theYearName := 'Sophmore  ';
        3 : theYearName := 'Junior    ';
        4 : theYearName := 'Senior    ';
    END;
END;

//**********
// getClassName
//**********
// Get the name of the corrisponding class
//**********
PROCEDURE getClassName (ID : Integer; VAR theClassName : String) BEGIN
    CASE ID OF
        1 : theClassName := 'Math      ';
        2 : theClassName := 'Science   ';
    END;
END;

//**********
// PlusEquals
//**********
// Add arg2 to arg1
//**********
PROCEDURE PlusEquals (VAR totalPS : Integer; addThis : Integer) BEGIN
    totalPS := totalPS + addThis;
END;


//**********
// getName
//**********
// Get the name of the user
//**********
PROCEDURE getName (VAR theName : String) BEGIN
    writeln('What is your name?');
    readln(theName);
END;

//**********
// getScoreCorrispondent
//**********
// Get the number corrisponding to a letter grade (A, B, C, D, or F)
//**********
PROCEDURE getScoreCorrispondent (letterGradeGetSC : char; VAR numberRepGetSC : Integer) BEGIN
    CASE letterGradeGetSC OF
        'A': numberRepGetSC := 4;
        'B': numberRepGetSC := 3;
        'C': numberRepGetSC := 2;
        'D': numberRepGetSC := 1;
        'F': numberRepGetSC := 0;
    END;
END;

//**********
// getGradeCorrispondent
//**********
// Get the letter grade corrisponding to a number (0 - 4)
//**********
PROCEDURE getGradeCorrispondent (numberRepGetGC : real; VAR letterGradeGetGC : char;) BEGIN
    CASE round(numberRepGetGC) OF
        4: letterGradeGetGC := 'A';
        3: letterGradeGetGC := 'B';
        2: letterGradeGetGC := 'C';
        1: letterGradeGetGC := 'D';
        0: letterGradeGetGC := 'F';
    END;
END;

//**********
// getAverageWeightedScore
//**********
// Get the averaged grade of the user for a given year and class
//**********
VAR
    letterRep : Integer;
PROCEDURE getAverageWeightedScore (yearGetAVS : Integer, classGetAVS : Integer; theArrayGetAVS : CharArrayTYPE; VAR studentAverageGetAVS : char) BEGIN
    averageRealFind := 0;
    FOR i2 := 1 TO 4 DO BEGIN 
        getScoreCorrispondent(theArrayGetAVS[yearGetAVS, i2, classGetAVS], letterRep);
        PlusEquals(averageRealFind, letterRep);
    END;
    averageRealFind := averageRealFind / 4;
    getGradeCorrispondent(averageRealFind, studentAverageGetAVS);
END;



//**********
// PrintLabeledTable
//**********
// Print out a labeled table containing averages of each course in a year
//**********
PROCEDURE PrintLabeledTable (userNamePrintLT : String; scoreArrayPrintLT : CharArrayTYPE) BEGIN
    write(userNamePrintLT) // Fill the top left cell with the users name
    FOR i := 1 TO 2 DO BEGIN
        getClassName(i, className);
        write(className);
    END; 
    writeln;
    // END header row
    FOR i := 1 TO 4 DO BEGIN 
        GetYearName(i, yearName);
        write(yearName);
        FOR j := 1 TO 2 DO BEGIN 
            getAverageWeightedScore(i, j, scoreArrayPrintLT, studentAverage);
            write(studentAverage);
        END;
        writeln;
    END;
END;


//**********
// FillScores
//**********
// Propm the user for each grade in each combo of: year, quarter, and class
//**********
PROCEDURE FillScores (scoreArrayFillS: CharArrayTYPE) BEGIN
    writeln('(Please input scores as a letter A, B, C, D, or F)')
    FOR i := 1 TO 4 DO BEGIN 
        GetYearName(i, yearName);
        writeln('For ', yearName' year, what did you get in quarter:');
        FOR i1 := 1 TO 4 DO BEGIN 
            writeln('  ', i2, '; in class:');
            FOR i2 := 1 TO 2 DO BEGIN 
                getClassName(i2, className);
                write('    ', className, '? ');
                readln(scoreArrayFillS[i, i1, i2]);
            END;
        END;
    END;
END;

BEGIN
    Intro;
    getName(usersName);
    FillScores(ourScores);
    PrintLabeledTable(usersName, ourScores);
    Outro;
END;
