PROGRAM FactorMe(input, output);

{$APPTYPE CONSOLE}

{
Geoff Yoerger
Activity 12.2
Due: AHEAD
Purpose: Double 10 numbers using arrays
}


TYPE
    RealArray10x2TYPE = array[1..10, 1..2] of real; // TYPEDEF: 10 Columns, 2 Rows
 
VAR
    i, j : Integer;
    RealArray : RealArray10x2TYPE;
//**********
// Intro
//**********
// Welcome the user.
//**********
PROCEDURE Intro; BEGIN
    writeln('Welcome to Number doubler');
END;


//**********
// Outro
//**********
// Tie up loose ends and halt the console
//**********
PROCEDURE Outro; BEGIN
    readln; // Halt
END;


BEGIN
    Intro;
    writeln('Please enter 10 numbers');
    FOR i := 1 TO 9 DO
        read(RealArray[i, 1]);
    readln(RealArray[10, 1]);

    FOR i := 1 TO 10 DO BEGIN 
        RealArray[i, 2] := RealArray[i, 1] * 2;
    END;
    writeln;
    FOR i := 1 TO 2 DO BEGIN
        FOR j := 1 TO 10 DO BEGIN
            write(RealArray[j, i]:5:1, '   ');
        END;
        writeln;
    END;

    Outro;
END.
