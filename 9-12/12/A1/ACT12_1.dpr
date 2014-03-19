PROGRAM ACT12_1(input, output);

{$APPTYPE CONSOLE}

{
Geoff Yoerger
Activity 12.1
Due: AHEAD
Purpose: Iterate over an array and put incrementing values in them; then output the array
}

TYPE
    IntArray4x5x3TYPE = array[1..4,1..5,1..3] OF Integer; // TYPEDEF: 4 rows, 5 columns, 3 height
 
VAR
    IntArray4x5x3 : IntArray4x5x3TYPE;
    i1, i2, i3 : integer; //Counter
    setThis : integer;
//**********
// Intro
//**********
// Welcome the user.
//**********
PROCEDURE Intro; BEGIN
    writeln('Welcome to The array incrementor');
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
END.
