PROGRAM PROG11_17(input, output);

{$APPTYPE CONSOLE}

{
Geoff Yoerger
Program 11.17
Due: AHEAD
Purpose: Show a simple exponential equation riddle
}


//**********
// Intro
//**********
// Welcome the user.
//**********
PROCEDURE Intro; BEGIN
    writeln('Welcome to the money calculator');
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
// TimesEquals
//**********
// Times arg2 to arg1
//**********
PROCEDURE TimesEquals (VAR totalPS : real; addThis : real); BEGIN
    totalPS := totalPS * addThis;
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


VAR
    age : integer;
    money : real;
    continue : boolean;
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
END.
