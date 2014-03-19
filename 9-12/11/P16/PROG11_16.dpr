PROGRAM PROG11_16(input, output);

{$APPTYPE CONSOLE}

{
Geoff Yoerger
Program 11.16
Due: AHEAD
Purpose: Perform some calulations on a vector of numbers
}


VAR
    numNumbers : integer;
    sumTotal : real;
    average : real;
//**********
// Intro
//**********
// Welcome the user.
//**********
PROCEDURE Intro; BEGIN
    writeln('Welcome to the number summarizer');
END;


//**********
// Outro
//**********
// Tie up loose ends and halt the console
//**********
PROCEDURE Outro; BEGIN
    readln; // Halt
    readln;
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
// PromptSum
//**********
// Prompt for a list of real numbers
//**********
PROCEDURE PromptSum (VAR sumNumsPrompt : real; VAR numNumbersPrompt : Integer);
VAR
    tempCurrNum : real;
BEGIN
    sumNumsPrompt := 0;
    numNumbersPrompt := 0;
    writeln('Enter a list of numbers seperated by spaces and ending with 0.');
    REPEAT BEGIN
        read(tempCurrNum);
        IF(NOT(tempCurrNum = 0)) THEN
          numNumbersPrompt := numNumbersPrompt + 1;
        PlusEqualsReal(sumNumsPrompt, tempCurrNum);
    END;
    UNTIL(tempCurrNum = 0);
END;


//**********
// calcAverage
//**********
// arg3 = arg1 / arg2
//**********
PROCEDURE calcAverage (sumNumsCalc : real; numNumbersCalc : Integer; VAR average : real);
BEGIN 
    average := sumNumsCalc / numNumbersCalc;
END;


//**********
// OutputVectorSummary
//**********
// Output the summary of a vector sum
//**********
PROCEDURE OutputVectorSummary (sumTotalOutVS : real; numNumbersOutVS : integer; averageOutVS : real);
BEGIN
    writeln;
    writeln('Sum:                ', sumTotalOutVS:0:1);
    writeln('Number of numbers:  ', numNumbersOutVS);
    writeln('Average:            ', averageOutVS:0:1);
END;


BEGIN
    Intro;
    PromptSum(sumTotal, numNumbers);
    calcAverage(sumTotal, numNumbers, average);
    OutputVectorSummary(sumTotal, numNumbers, average);
    Outro;

END.
