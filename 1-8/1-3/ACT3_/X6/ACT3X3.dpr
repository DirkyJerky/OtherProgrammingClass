program ACT3X3;

{
Name: Geoff Yoerger
Assignment: Lesson 3 EC 6
Due: EC
Purpose: Calc a speeding ticket total fine
}

{$APPTYPE CONSOLE}

uses
  SysUtils;

var
  fine, addFine : real;
  limit, speed : integer;
  total : real;
  
begin
  { Intro to program }
  writeln('Welcome to the fine calculator');
  writeln;
  
  { User Input }
  writeln('Base fine?');
  readln(fine);
  writeln('Fine per each mph over limit?');
  readln(addFine);
  writeln('Speeding limit?');
  readln(limit);
  writeln('Speeders''s Speed?');
  readln(speed);


  { Calculations }
  total := fine;
  speed := speed - limit;
  total := total + (speed * addFine);

  { Output }
  writeln('The total fine is $', total:0:2, '.');

  { Halt the console }
  readln;
end.
 