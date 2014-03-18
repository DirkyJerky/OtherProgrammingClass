program ACT71;

{
Name: Geoff Yoerger
Activity 7.1
Due: AHEAD
Purpose: Compare 3 numbers to find out which on is the largest
}

{$APPTYPE CONSOLE}

uses
  SysUtils;

var
  num1, num2, num3 : real;
  // Our 3 numbers

  biggest : real;
  // And the biggest one (to be found)



{************************************************
*  biggestNum
****************************
*
*  PURPOSE: Find out which of the 3 numbers is the biggest
*
*************************************************}

PROCEDURE biggestNum (num1, num2, num3 : real; VAR biggest : real);
BEGIN

   if ((num1 >= num2) AND (num1 >= num3))
   then biggest := num1
   else if ((num2 >= num3) AND (num2 >= num1))
     then biggest := num2
     else biggest := num3;

END;

//END: PROCNAME |||||||||||||||||||||||||||||||||||||||||


{************************************************
*  Intro
****************************
*
*  Welcome the User
*
*************************************************}

PROCEDURE Intro ();
BEGIN

   writeln('Welcome to the biggest number calculator');
   writeln;

END;

//END: Intro |||||||||||||||||||||||||||||||||||||||||




{************************************************
*  Outro
****************************
*
*  Halt the console
*
*************************************************}

PROCEDURE Outro();
BEGIN

   readln;

END;

//END: Outro |||||||||||||||||||||||||||||||||||||||||

{************************************************
*  Output
****************************
*
*  Output our information
*
*************************************************}

PROCEDURE Output (biggest : real);
BEGIN

   writeln('The biggest number is ', biggest:0:2, '.');

END;

//END: Output |||||||||||||||||||||||||||||||||||||||||




{************************************************
*  Prompt
****************************
*
*  Prompt the user for Information
*
*************************************************}

PROCEDURE Prompt(VAR num1, num2, num3 : real);
BEGIN

  writeln('What are your three numbers?');
  readln(num1, num2, num3);

END;

//END: Prompt |||||||||||||||||||||||||||||||||||||||||













//BEGIN MAIN ==========================================

BEGIN
  Intro; // Welcome the user


  
  Prompt(num1, num2, num3); // Prompt the user for information

  biggestNum(num1, num2, num3, biggest); // Do a calculation
  

  Output(biggest);

  Outro; // Halt the console
END.
 