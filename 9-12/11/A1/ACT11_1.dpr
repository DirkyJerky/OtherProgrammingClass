PROGRAM ACT11_1(input, output)

{
Geoff Yoerger
Activity 11.1
Due: AHEAD
Purpose: Multiply 2 numbers over and over until the user doesnt want to anymore
}
VAR
    continue : boolean;
    num1, num2 : Integer;


//**********
// Intro
//**********
// Welcome the user.
//**********
PROCEDURE Intro BEGIN
    writeln('Welcome to the repetative number multiplyer');
    writeln;
END;


//**********
// Outro
//**********
// Tie up loose ends and halt the console
//**********
PROCEDURE Outro BEGIN
    readln; // Halt
END;


//**********
// Prompt2Int
//**********
// Prompt user for 2 integers
//**********
PROCEDURE Prompt2Int (VAR num1Get, num2Get : Integer) BEGIN
    writeln('Please enter 2 integers.');
    read(num1Get);
    readln(num2Get);
END;


//**********
// PrintProuduct
//**********
// Print a product of 2 numbers
//**********
PROCEDURE PrintProuduct (num1Calc, num2Calc : Integer) BEGIN
    write(num1Calc, ' * ', num2Calc, ' = ');
    writeln(num1Calc * num2Calc);
END;


//**********
// testContinue
//**********
// See if a user wants to continue looping
//**********
VAR
    testContinueResponse : char;
PROCEDURE testContinue (VAR continueTEST : boolean) BEGIN
    writeln('Do you want to continue? (y/n)');
    readln(testContinueResponse);
    IF(Upcase(testContinueResponse) = 'Y') THEN
        continueTEST := true
    ELSE
        continueTEST := false;
END;

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


