program ACT72;

{
Name: Geoff Yoerger
Activity 7.2
Due: AHEAD
Purpose: Classify a Triangle
}

{$APPTYPE CONSOLE}

uses
  SysUtils;

var
  side1, side2, side3 : real;
  // The len of the user's triangles 3 sides
  triangleType : String;
  // The type of triangle




{************************************************
*  Intro
****************************
*
*  Welcome the User
*
*************************************************}

PROCEDURE Intro ();
BEGIN

   writeln('Welcome to the Triangle classifier');
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

PROCEDURE Prompt(VAR side1, side2, side3 : real);
BEGIN

  writeln('Whats the length of your triangle''s:');
  writeln('First side?');
  readln(side1);                            
  writeln('Second side?');
  readln(side2);
  writeln('Third?');
  readln(side3);

END;

//END: Prompt |||||||||||||||||||||||||||||||||||||||||








{************************************************
*  classifyTriangle
****************************
*
*  Classify a triangle
*
*************************************************}

PROCEDURE classifyTriangle (side1, side2, side3 : real; VAR triangleType : String);
BEGIN

   if ((side1 = side2) AND (side2 = side3))
   then triangleType := 'Equilateral'
   else if ((side1 = side2) OR (side2 = side3) OR (side1 = side3))
    then triangleType := 'Isosceles'
    else triangleType := 'Scalene';

END;

//END: PROCNAME |||||||||||||||||||||||||||||||||||||||||


{************************************************
*  Output
****************************
*
*  PURPOSE: Write stuff to the console
*
*************************************************}

PROCEDURE Output (triangleType : String);
BEGIN

   writeln('Your triangle is a ', triangleType);

END;

//END: Output |||||||||||||||||||||||||||||||||||||||||



//BEGIN MAIN ==========================================

BEGIN
  Intro; // Welcome the user



  
  Prompt(side1, side2, side3); // Prompt the user for information

  classifyTriangle(side1, side2, side3, triangleType); // Do a calculation


  Output(triangleType);

  Outro; // Halt the console
END.
 