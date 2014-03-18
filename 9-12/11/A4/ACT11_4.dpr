PROGRAM ACT11_4(input, output);

{$APPTYPE CONSOLE}

{
Geoff Yoerger
Activity 11.4
Due: AHEAD
Purpose: Calculate a running total
}
  
VAR
    continue : boolean;
    runningTotal : real;
    addMe : real;

//**********
// Intro
//**********
// Welcome the user.
//**********
PROCEDURE Intro; BEGIN
    writeln('Welcome to the running totaler');
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
// PlusEqualsReal
//**********
// Add arg2 to arg1
//**********
PROCEDURE PlusEqualsReal (VAR totalPS : Real; addThis : Real); BEGIN
    totalPS := totalPS + addThis;
END;


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
    writeln('The total is ', runningTotal:0:3);
    Outro;
END.
