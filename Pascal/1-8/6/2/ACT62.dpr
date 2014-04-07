program ACT61;

{
Name: Geoff Yoerger
Assignment: Lesson 6 Assignment 1
Due: 2 22 2014
Purpose: TODO
}

{$APPTYPE CONSOLE}

uses
  SysUtils;



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
//*  PrintName
//************
//*  Print my name
//************

PROCEDURE PrintName ();
BEGIN
  writeln('Geoff Yoerger');
END;


//************
//*  PrintAddress
//************
//*  Print my address
//************

PROCEDURE PrintAddress ();
BEGIN
  writeln('6831 North Francis Drive');
  writeln('Evansville, WI 53536');
END;

BEGIN
  PrintName;
  PrintAddress;
  PrintName;
  PrintName;
  PrintAddress;
  PrintAddress;

  Outro;
END.
 