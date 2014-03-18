program ACT73;

{
Name: Geoff Yoerger
Assignment: TODO
Due: TODO
Purpose: TODO
}

{$APPTYPE CONSOLE}

uses
  SysUtils;

var
  gpa : real;
  englishSat, mathSat : integer;
  canEnrole : boolean;



{************************************************
*  admittanceApprover
****************************
*
*  See if a student is 'good' enought to enrole
*
*************************************************}

PROCEDURE admittanceApprover (englishSat, mathSat : integer; gpa : real; VAR canEnrole : boolean);
BEGIN

   IF ((englishSat >= 500) AND ((mathSat >= 500) OR (gpa >= 3.0)))
   then canEnrole := TRUE
   else if ((mathSat >= 500) AND (gpa >= 3.0))
     then canEnrole := TRUE
     else canEnrole := FALSE;

END;

//END: admittanceApprover |||||||||||||||||||||||||||||||||||||||||


{************************************************
*  Intro
****************************
*
*  Welcome the User
*
*************************************************}

PROCEDURE Intro ();
BEGIN

   writeln('Welcome to the enrolement detector');
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
*  Halt the console
*
*************************************************}

PROCEDURE Output(canEnrole : boolean);
BEGIN

   IF (canEnrole)
   THEN writeln('Congrats, you can enrole!')
   ELSE writeln('Im sorry, we cant enrole you.');

END;

//END: Output |||||||||||||||||||||||||||||||||||||||||


{************************************************
*  Prompt
****************************
*
*  Prompt the user for Information
*
*************************************************}

PROCEDURE Prompt(VAR englishSat, mathSat : integer; VAR gpa : real);
BEGIN

  writeln('What score did you get on the english portion of the SATs?');
  readln(englishSat);
  writeln('And the math section?');
  readln(mathSat);
  writeln('And what was your high school GPA?');
  readln(gpa);

END;

//END: Prompt |||||||||||||||||||||||||||||||||||||||||











//BEGIN MAIN ==========================================

BEGIN
  Intro; // Welcome the user

  Prompt(englishSat, mathSat, gpa); // Prompt the user for information

  admittanceApprover(englishSat, mathSat, gpa, canEnrole); // See if they can attend

  Output(canEnrole);

  Outro; // Halt the console
END.
 