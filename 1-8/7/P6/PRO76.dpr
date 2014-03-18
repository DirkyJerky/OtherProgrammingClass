program PRO76;

{
Name: Geoff Yoerger
Program 7.6
Due: AHEAD
Purpose: Tell a user when they need to register their vehicle
}

{$APPTYPE CONSOLE}

uses
  SysUtils;

var
  lastName, firstName : String;
  // Our users name
  
  regMonth : String;
  // And the month they can register in.



{************************************************
*  Output
****************************
*
*  PURPOSE: TODO
*
*************************************************}

PROCEDURE Output (lastName, firstName, regMonth : String);
BEGIN

   writeln('Dear Mr/Mrs ', firstName, ' ', lastName, ',');
   writeln('');
   writeln('Our automated system has requested to inform you that our registration');
   writeln('department will be open to you in the month of ', regMonth, '.');
   writeln('');
   writeln('Have a nice day,'); 
   writeln('Metropolis Department of Motor Vecicles');

END;

//END: Output |||||||||||||||||||||||||||||||||||||||||


{************************************************
*  Intro
****************************
*
*  Welcome the User
*
*************************************************}

PROCEDURE Intro ();
BEGIN

   writeln('Welcome to the registration date finder.');
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
*  Prompt
****************************
*
*  Prompt the user for Information
*
*************************************************}

PROCEDURE Prompt(VAR lastName, firstName : String);
BEGIN

  writeln('What is your first name?');
  readln(firstName);    
  writeln('And your last name?');
  readln(lastName);


END;

//END: Prompt |||||||||||||||||||||||||||||||||||||||||




{************************************************
*  registerMonth
****************************
*
*  Calculate the month.
*
*************************************************}
VAR
  firstLetter : char;
  codePoint : integer;
  // Throw away variables

PROCEDURE registerMonth (lastName : String; VAR regMonth : String);
BEGIN

//  lastName := Upcase(lastName);   // Make it uppercase to distingush between cases
// Turns out Upcase() works on chars
  firstLetter := Upcase(lastName[1]); // Get the first letter
  codePoint := ord(firstLetter);   // And get the code point for comparing
  IF ((codePoint >= ord('A')) AND (codePoint <= ord('G'))) THEN
    regMonth := 'March'
  ELSE IF ((codePoint >= ord('H')) AND (codePoint <= ord('P'))) THEN
    regMonth := 'July'
  ELSE
    regMonth := 'October';



  

END;

//END: registerMonth |||||||||||||||||||||||||||||||||||||||||









//BEGIN MAIN ==========================================

BEGIN
  Intro; // Welcome the user

  Prompt(lastName, firstName); // Prompt the user for information

  registerMonth(lastName, regMonth); // See what month they can register

  Output(lastName, firstName, regMonth);

  Outro; // Halt the console
END.
 