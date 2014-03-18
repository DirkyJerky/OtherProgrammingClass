program ACT3X3;

{
Name: Geoff Yoerger
Assignment: Lesson 3 EC 3
Due: EC
Purpose: Convert feet to cms and inches
}

{$APPTYPE CONSOLE}

uses
  SysUtils;

var
  cm : real;
  feet, inches : integer;
  
begin
  { Intro to program }
  writeln('Welcome to the Feet converter');
  writeln;
  
  { User Input }
  writeln('Number of feet?');
  readln(feet);

  { Calculations }
  cm := feet * 30.5;
  inches := feet * 12;

  { Output }
  writeln(feet, ' feet is ', cm:6:2,' centimeters and ', inches,' inches.');

  { Halt the console }
  readln;
end.
 