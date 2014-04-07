program ACT51;

{
Name: Geoff Yoerger
Assignment: 51
Due: 2 18 2014
Purpose: Make a MAXIMUM SECURITY CODE (CONFIDENTIAL)
}

{$APPTYPE CONSOLE}

uses
  SysUtils;

var
  code : real;
  initial : char;
  
begin
  { Intro to program }
  writeln('Welcome to Maximus Security Prison');
  writeln;
  
  { User Input }
  writeln('What is your last initial?');
  readln(initial);
  writeln('And the last 4 digits of your phone number?');
  readln(code);

  { Calculations }
  code := code + 2000;
  code := sqrt(code);
  code := code / 0.17;
  code := code * 3.2;

  { Output }
  writeln;
  writeln('Your code is:'); 
  writeln(succ(initial), code:4:0, pred(initial));

  { Halt the console }
  readln;
end.
 