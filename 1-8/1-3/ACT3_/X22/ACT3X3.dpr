program ACT3X3;

{
Name: Geoff Yoerger
Assignment: Lesson 3 EC 2
Due: EC
Purpose: Convert years to minutes
}

{$APPTYPE CONSOLE}

uses
  SysUtils;

var
  years, minutes : real;

begin
  { Intro to program }
  writeln('Welcome to the Year to Minutes converter');
  writeln;
  
  { User Input }
  writeln('Number of years?');
  readln(years);

  { Calculations }
  minutes := years * 365 * 24 * 24;

  { Output }
  writeln(years:0:2, ' years is ', minutes:0:0,' minutes.');

  { Halt the console }
  readln;
end.
 