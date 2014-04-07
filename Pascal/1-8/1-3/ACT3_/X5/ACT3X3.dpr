program ACT3X3;

{
Name: Geoff Yoerger
Assignment: Lesson 3 EC 5
Due: EC
Purpose: Calculate simple interest
}

{$APPTYPE CONSOLE}

uses
  SysUtils;

var
  interest, principle : real;
  years : integer;

begin
  { Intro to program }
  writeln('Welcome to the Simple Interest calulator');
  writeln;
  
  { User Input }
  writeln('Priciple investment?');
  readln(principle);
  writeln('Number of years?');
  readln(years);
  writeln('Rate? (as decimal)');
  readln(interest);

  { Calculations }
  principle := principle + (principle * interest * years);

  { Output }
  writeln('After ', years,' years you will have $', principle:0:2, '.');

  { Halt the console }
  readln;
end.
 