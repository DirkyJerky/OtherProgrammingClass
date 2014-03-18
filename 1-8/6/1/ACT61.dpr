program ACT61;

{
Name: Geoff Yoerger
Activity 6.1
Due: BEHIND
Purpose: Calculate the area and circumference of a circle
}

{$APPTYPE CONSOLE}

uses
  SysUtils;

var
  radius, PI : real;
  // User entered radius and
  // The constant pi (3.14159)

  circ, area : real;
  // The calculated circumference and area



//************
//*  Intro
//************
//*  Welcome the User
//************

PROCEDURE Intro ();
BEGIN
  writeln('Welcome to the Area and Cirumference calculator!');
  writeln;
END;


//************
//*  Outro
//************
//*  Tie up loose ends and halt the console.
//************

PROCEDURE Outro ();
BEGIN
  readln;
END;


//************
//*  GetRadius
//************
//*  Prompt the user for necessary information
//************

PROCEDURE GetRadius(VAR radiusGet : real);
BEGIN
  writeln;
  writeln('What is the radius of your circle?');
  readln(radiusGet);
END;


//************
//*  Init
//************
//*  Initialize information into variables
//************

PROCEDURE Init ();
BEGIN
  PI := 3.141592653;
END;


//************
//*  Print
//************
//*  Give the user back the information needed
//************

PROCEDURE Print (radiusPrint, circPrint, areaPrint : real);
BEGIN
  writeln;
  writeln('Your circle with radius ', radiusPrint:0:2,' has the following calculations:');
  writeln('Circumference: ', circPrint:0:2);
  writeln('Area: ', areaPrint:0:2);
END;


//************
//*  CalcArea
//************
//*  Calculate the area of a circle
//************

PROCEDURE CalcArea (radiusCalc : real; VAR areaCalc : real);
BEGIN
  areaCalc  := radiusCalc * radiusCalc * PI;
END;


//************
//*  CalcCirc
//************
//*  Calculate the circ of a circle
//************

PROCEDURE CalcCirc (radiusCalc : real; VAR circCalc : real);
BEGIN
  circCalc  := radiusCalc * 2 * PI;
END;

{MAIN ==========================================}
BEGIN
  Intro; // Welcome the user

  Init;
  GetRadius(radius);
  CalcArea(radius, area);
  CalcCirc(radius, circ);
  Print(radius, circ, area);
  Outro; // Halt the console
END.
 