program ACT315;

{
Name: Geoff Yoerger
Assignment: TODO
Due: TODO
Purpose: W
}

{$APPTYPE CONSOLE}

uses
  SysUtils;

var
  cents, moneyInDollars, moneyInPounds : real;
  name : String; { Owners name }
  
begin
  { init }
  name := 'Mr. Banks';

  { Intro to program }
  writeln('Welcome to the Monitary Exchange of Banks, run and owned by me, ', name);
  writeln('We will gladly change your dollars into British pounds, or even pennies, ');
  writeln('for No extra charge.');
  writeln;

  { User Input }
  writeln('How much dollars do you want converted this evening?');
  readln(moneyInDollars);

  { Calculations }
  moneyInPounds := moneyInDollars * 0.5;
  cents := (moneyInDollars * 100);

  { Output }
  writeln('You can exchange this for: ');
  writeln(cents:6:0, ' Cents');
  writeln('or');
  writeln(moneyInPounds:7:2, ' Pounds');
  writeln;
  writeln('Have a nice day');

  { Halt the console }
  readln;
end.
 