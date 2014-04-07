PROGRAM ACT11_2(input, output);

{$APPTYPE CONSOLE}

{
Geoff Yoerger
Activity 11.2
Due: AHEAD
Purpose: Add 2 numbers together for a while
}
      
VAR
    continue : boolean;
    num1, num2 : Integer;

//**********
// Intro
//**********
// Welcome the user.
//**********
PROCEDURE Intro; BEGIN
    writeln('Welcome to the repetative number adder');
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
// PrintSum
//**********
// Print a sum of 2 numbers
//**********
PROCEDURE PrintSum (num1Calc, num2Calc : Integer); BEGIN
    write(num1Calc, ' + ', num2Calc, ' = ');
    writeln(num1Calc + num2Calc);
END;



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
END.


