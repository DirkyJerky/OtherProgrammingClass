program RT1;

{
Name: Geoff Yoerger
Activity Running Total 1
Due: AHEAD
Purpose: Total 20 integers entered by the user
}

{$APPTYPE CONSOLE}

uses
  SysUtils;

const
  lowerBounds : Integer = 20;

var
  total : integer = 0;
  // Running total
  num : integer;
  // Current iteration result
  i : integer; // Useless var







//************
//*  Output
//************
//*  Give the user back the information needed
//************

PROCEDURE Output (theTotal : integer);
BEGIN
  writeln;
  writeln('Your total is: ', theTotal);
END;



{MAIN ==========================================}
BEGIN
  writeln('Please enter ', lowerBounds, ' numbers:');
  FOR i := 1 to lowerBounds DO BEGIN
    write(i, ': ');
    readln(num);
    total := total + num;
  END;
  Output(total);
  readln;
END.
 