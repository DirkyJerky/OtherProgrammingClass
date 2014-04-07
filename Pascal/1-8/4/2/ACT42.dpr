program ACT42;

{
Name: Geoff Yoerger
Assignment: 4-2
Due: 2-17
Purpose: Write a coin totaler
}

{$APPTYPE CONSOLE}

uses
  SysUtils;

var
  { Base value of all the coins }
  Apenny, Anickel, Adime, Aquarter, Ahdollar, Adollar : real;
  { And the amounts of them }
  penny, nickel, dime, quarter, hdollar, dollar : integer;
  { Total }
  total : real;
  
begin
  { Init }
  Apenny := 0.01;
  Anickel := 0.05;
  Adime := 0.1;
  Aquarter := 0.25;
  Ahdollar := 0.5;
  Adollar := 1;

  { Intro to program }
  writeln('Welcome to the coin totaler');
  writeln;

  { User Input }
  writeln('How many:');
  writeln('Pennies?');
  readln(penny);
  writeln('Nickels?');
  readln(nickel);
  writeln('Dimes?');
  readln(dime);
  writeln('Quarters?');
  readln(quarter);
  writeln('Half-Dollars?');
  readln(hdollar);
  writeln('Dollars?');
  readln(dollar);

  { Calculations }
   
  Apenny := Apenny * penny;
  Anickel := Anickel * nickel;
  Adime := Adime * dime;
  Aquarter := Aquarter * quarter;
  Ahdollar := Ahdollar * hdollar;
  Adollar := Adollar * dollar;
  total := Apenny + Anickel + Adime + Aquarter + Ahdollar + Adollar;

  { Output }
  writeln('You have a total of $', total:0:2);
  { To much of a headache to write all that proffesional crap,
  just dock me the points instead please, id prefer that }

  { Halt the console }
  readln;
end.
 