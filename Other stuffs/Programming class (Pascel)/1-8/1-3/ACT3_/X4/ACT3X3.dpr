program ACT3X3;

{
Name: Geoff Yoerger
Assignment: Lesson 3 EC 4
Due: EC
Purpose: Calculate the weight of a container.
}

{$APPTYPE CONSOLE}

uses
  SysUtils;

var
  weight : real;
  length, width, height : integer;
  
begin
  { Intro to program }
  writeln('Welcome to the weight calculator');
  writeln;
  
  { User Input }
  writeln('Hieght of containter?');
  readln(height);
  writeln('Width of containter?');
  readln(width);
  writeln('Length of containter?');
  readln(length);
  writeln('Weight of containter per cubic inch?');
  readln(weight);

  { Calculations }
  weight := weight * height * width * length;

  { Output }
  writeln('The container''s weight is', weight:0:2);

  { Halt the console }
  readln;
end.
 