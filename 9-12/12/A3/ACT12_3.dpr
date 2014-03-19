PROGRAM ACT12_3(input, output);

{$APPTYPE CONSOLE}

{
Geoff Yoerger
Activity 12.3
Due: AHEAD
Purpose: Perform some arbitrary operations on arrays to show what we know
}


TYPE
    CharArray3x4 = array[1..3, 1..4] OF char; // TYPEDEF: 3 Rows, 4 Columns
 
VAR
    CharArray : CharArray3x4;
    i, j : Integer;
    oRowNum, oColumnNum : integer;
//**********
// Intro
//**********
// Welcome the user.
//**********
PROCEDURE Intro; BEGIN
    writeln('Welcome to the char array modifier');
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



////////////////
// ACT12_3
////////////////
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
END.
