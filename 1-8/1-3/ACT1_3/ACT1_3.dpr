program ACT1_3;

{
Name: Geoff Yoerger
Assignment: Lesson 1-3 Final
Due: 2 12 2014
Purpose: A more advanced version of the Burger King program.
}

{$APPTYPE CONSOLE}

uses
  SysUtils;

var

  burgers, smallFries, largeFries, cokes : integer;
  cheeseBurgers, chocShakes : integer;
  { Number of the seperate items... }

  burgerCost, sFriesCost, lFriesCost, cokeCost : real;
  cheeseBurgerCost, chocShakeCost : real;
  { And their costs }

  subTotal, tax, finalTotal : real;
  { Plus the sub total, tax, and final total }
  money, change, taxPercent : real;
  { And the moneys } 

begin

  { Cost var initialization }
 
  burgerCost := 0.79;
  sFriesCost := 0.99;
  lFriesCost := 1.29;
  cokeCost := 0.99;
  cheeseBurgerCost := 0.89;
  chocShakeCost := 1.19;

  tax := 0.06;

  { Intro }
  writeln('Hello!');
  writeln('Welcome to Burger King!');
  writeln('Our prices for our items are:');
  writeln('Cheeseburgers:     $', cheeseBurgerCost:6:2);
  writeln('Burgers:           $', burgerCost:6:2);
  writeln('Small Fries:       $', sFriesCost:6:2);
  writeln('Large Fries:       $', lFriesCost:6:2);
  writeln('Coke:              $', cokeCost:6:2);
  writeln('Chocolate Shakes:  $', chocShakeCost:6:2);
  writeln;

  { User input from computer }
  writeln('How many burgers do you want?');
  readln(burgers);
  writeln('How many Small Fries do you want?');
  readln(smallFries);
  writeln('How many Large Fries do you want?');
  readln(largeFries);
  writeln('How many Cokes do you want?');
  readln(cokes);
  writeln('How many Cheeseburgers do you want?');
  readln(cheeseBurgers);
  writeln('How many Chocolate shakes do you want?');
  readln(chocShakes);
  writeln;
  writeln;
  writeln('Please insert money:');
  readln(money);

  { Calculations }

  burgerCost := burgerCost * burgers;
  sFriesCost := sFriesCost * smallFries;
  lFriesCost := lFriesCost * largeFries;
  cokeCost := cokeCost * cokes;
  cheeseBurgerCost := cheeseBurgerCost * cheeseBurgers;
  chocShakeCost := chocShakeCost * chocShakes;
  subTotal := chocShakeCost + cokeCost + sFriesCost + lFriesCost + burgerCost
    + cheeseBurgerCost + chocShakeCost;
  taxPercent := tax * 100;
  tax := tax * subTotal;
  finalTotal := tax + subTotal;
  change := money - finalTotal;

  { Print the receipt }
  writeln;
  writeln;
  writeln('     Receipt      ');
  writeln('    =========     ');
  writeln;

  if burgers = 0 then else
    writeln(burgers,       ' Burger(s).............$', burgerCost:6:2);

  if smallFries = 0 then else
    writeln(smallFries,    ' Small Frie(s).........$', sFriesCost:6:2);

  if largeFries = 0 then else

    writeln(largeFries,    ' Large Frie(s).........$', lFriesCost:6:2);

  if cokes = 0 then else
    writeln(cokes,         ' Coke(s)...............$', cokeCost:6:2);

  if cheeseBurgers = 0 then else
    writeln(cheeseBurgers, ' Cheeseburger(s).......$', cheeseBurgerCost:6:2);

  if chocShakes = 0 then else
    writeln(chocShakes,    ' Chococolate Shake(s)..$', chocShakeCost:6:2);

  writeln('---------------------------------');
  writeln('Sub Total:              $', subTotal:6:2);
  writeln('Sales Tax:  ', taxPercent:5:2, '%      $', tax:6:2);
  writeln('---------------------------------');
  writeln('Total:                  $', finalTotal:6:2);
  writeln;
  writeln('Paid:                   $', money:6:2);
  writeln('Change:                 $', change:6:2);
    
  writeln;
  writeln('    =========     ');
  writeln('Have a nice Day!');

  readln;

end.
 
