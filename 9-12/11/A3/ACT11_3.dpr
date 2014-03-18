PROGRAM ACT11_3(input, output);

{$APPTYPE CONSOLE}

{
Geoff Yoerger
Activity 11.3
Due: AHEAD
Purpose: See if a car model is defective
}

VAR
    continue : boolean;
    carModelNum : Integer;
    isDefective : boolean;

//**********
// Intro
//**********
// Welcome the user.
//**********
PROCEDURE Intro; BEGIN
    writeln('Welcome to the car tester');
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
// PromptModelNum
//**********
// Prompt user for car model number
//**********
PROCEDURE PromptModelNum (VAR carModelNumGet : Integer); BEGIN
    writeln('Enter your car''s model number.');
    readln(carModelNumGet);
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
        IF(isDefective AND continue) THEN
            writeln('Your car is defective')
        ELSE IF(continue) THEN
            writeln('Your car is OK');
    END;
    UNTIL(NOT(continue));
    Outro;
END.
