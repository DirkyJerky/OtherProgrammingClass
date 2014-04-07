PROGRAM PROG_18(input, output);

{$APPTYPE CONSOLE}

{
Geoff Yoerger
Program 12.18
Due: AHEAD
Purpose: Do some grading
}

   
CONST
    assignment1WEIGHT : real = 0.1;
    assignment2WEIGHT : real = 0.1;
    assignment3WEIGHT : real = 0.25;
    assignment4WEIGHT : real = 0.2;
    assignment5WEIGHT : real = 0.05;
    assignment6WEIGHT : real = 0.3;
TYPE
    scoreArray5x6TYPE = array[1..5,1..6] OF Integer; // TYPEDEF: 5 Students, 6 Assignment scores
       
VAR
    scoreArray : scoreArray5x6TYPE;
//**********
// Intro
//**********
// Welcome the user.
//**********
PROCEDURE Intro; BEGIN
    writeln('Welcome to the gradebook');
END;


//**********
// Outro
//**********
// Tie up loose ends and halt the console
//**********
PROCEDURE Outro; BEGIN
    readln; // Halt
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
PROCEDURE getAverageWeightedScore5x6 (studentNumber : Integer; VAR scoreArrayGetAWS : scoreArray5x6TYPE;
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
    write('              '); // Fill the top left cell with nothing
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
            write(scoreArrayPrintLT[i, j]:8);
        END;
        getAverageWeightedScore5x6(i, scoreArrayPrintLT, studentAverage);
        write(studentAverage:11:2);
        writeln;
    END;
END;


//**********
// FillScores5x6
//**********
// Prompt for grades for each student
//**********
PROCEDURE FillScores5x6 (VAR scoreArrayFillS: scoreArray5x6TYPE);
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


BEGIN
    Intro;
    FillScores5x6(scoreArray);
    PrintLabeledTable5x6(scoreArray);
    Outro;
END.
