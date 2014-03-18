program ACT31;

{
Name: Geoff Yoerger
Assignment: Lesson 3 Program 1
Due: 2-4-2014
Purpose: Tell the user how old they will be on Dec 31st 2072
}

{$APPTYPE CONSOLE}

uses
  SysUtils;

var
  calcYear, calcMonth, calcDay : integer;
  year, month, day : integer;
  testYear, testMonth, testDay : integer;
  name : String;
  
begin

  { Init }
  testYear := 2072;
  testMonth := 12;
  testDay := 31;

  { Intro to program }
  writeln('Welcome to The age calculator');
  writeln;
  
  { User Input }
  writeln('What is your name?');
  readln(name);
  writeln('What is the year you were born?');
  readln(year);
  writeln('What is the month you were born? (a number 1 - 12)');
  readln(month);
  writeln('What was the day you were born? (a number 1 - 31) ');
  readln(day);

  { Calculations }
  calcYear := testYear - year;
  calcMonth := testMonth - month;
  calcDay := testDay - day;

  { Output }
  
  if calcDay = 0 then
    if calcMonth = 0 then
      writeln('Happy birthday, ', name, '!')
    else
      writeln('Hello, ', name, '.')
  else
    writeln('Hello, ', name, '.');
  
  writeln('On Decemeber 31st 2072 you will be ', calcYear, ' years old,');
  writeln( calcMonth, ' months old, and ', calcDay, ' days old.');

  { Halt the console }
  readln;
end.
 