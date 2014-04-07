program ACT535;

{
Name: Geoff Yoerger
Assignment: 5-3.5
Due: 2-18
Purpose: Perform lots of calculations involving 2 integers.
}

{$APPTYPE CONSOLE}

uses
  SysUtils;

var
  int1, int2 : integer;
  calc : real;
  
begin
  { Intro to program }
  writeln('Welcome to the calulator!');
  writeln;

  { User Input }
  writeln('Please enter two integers: ');
  readln(int1, int2);
  writeln;

  { Output }
  calc := int1 + int2;
  writeln(int1, ' + ', int2, ' = ', calc:0:0);
  calc := int1 * int2;
  writeln(int1, ' * ', int2, ' = ', calc:0:0);
  writeln;  
  calc := int1 - int2;
  writeln(int1, ' - ', int2, ' = ', calc:0:0);  
  calc := int2 - int1;
  writeln(int2, ' - ', int1, ' = ', calc:0:0);
  writeln;
  calc := int1 / int2;
  writeln(int1, ' / ', int2, ' = ', calc:0:4);
  calc := int2 / int1;
  writeln(int2, ' / ', int1, ' = ', calc:0:4);
  writeln;
  calc := int1 DIV int2;
  writeln(int1, ' DIV ', int2, ' = ', calc:0:0);
  calc := int2 DIV int1;
  writeln(int2, ' DIV ', int1, ' = ', calc:0:0); 
  writeln;
  calc := int1 MOD int2;
  writeln(int1, ' MOD ', int2, ' = ', calc:0:0);
  calc := int2 MOD int1;
  writeln(int2, ' MOD ', int1, ' = ', calc:0:0);

  { Halt the console }
  readln;
end.
 