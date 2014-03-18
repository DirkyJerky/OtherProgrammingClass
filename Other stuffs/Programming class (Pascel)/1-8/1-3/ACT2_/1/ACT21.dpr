program ACT21;
{
Geoff Yoerger
Activity 2.1
Due: 1-27-14
Purpose: Prompt for fast food items and print the reciept.
}
{$APPTYPE CONSOLE}

uses
  SysUtils;

var

  burgers, fries, sodas : integer;  { Number of the seperate items... }
  bCost, fCost, sCost, totalCost : integer; { And their costs (plus the total) }

begin

  { Cost var initialization }
  bCost := 3;
  fCost := 2;
  sCost := 1;

  { Intro }
  writeln('Hello!');
  writeln('Welcome to Burger King!');
  writeln('Burgers: $', bCost);
  writeln('Fries:   $', fCost);
  writeln('Sodas:   $', sCost);

  { User input from computer }
  writeln('How many burgers do you want?');
  readln(burgers);
  writeln('How many fries do you want?');
  readln(fries);
  writeln('How many sodas do you want?');
  readln(sodas);

  { Print the receipt }
  writeln;
  writeln;
  writeln('     Receipt      ');
  writeln('    =========     ');
  writeln(burgers, ' burgers for          $', bCost * burgers);
  writeln(fries, ' fries for            $', fCost * fries);
  writeln(sodas, ' sodas for            $', sCost * sodas);
  
  { Get the total cost of everything, and finish tghe receipt }
  totalCost := sCost * sodas + fCost * fries + bCost * burgers;
  writeln;
  writeln(burgers + fries + sodas, ' items for a total of $', totalCost);
  writeln;
  writeln('    =========     ');
  writeln('Have a nice Day!');




  readln;

end.
 
