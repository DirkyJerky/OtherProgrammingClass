program ACT32;

{
Name: Geoff Yoerger
Assignment: Lesson 3 Program 2
Due: TODO
Purpose: TODO
}

{$APPTYPE CONSOLE}

uses
  SysUtils;

var
  tax : real; { 6% sales tax }

  itemName : String; { Name of the item bieng purchased }
  price : real; { Price of the item }   
  numOfItems : integer; { And the number of items bieng purchased }

  total : real; { The total price }
  totalWithTax : real; { The total price with tax}

begin
  { Init }
  tax := 0.06; { Sales Tax }


  { Intro to program }
  writeln('Welcome to the Store!');
  writeln;
  
  { User Input }
  writeln('What item are you purchasing today?');
  readln(itemName);
  writeln('How much is that item?');
  readln(price);
  writeln('And how much ', itemName, '(s) do you want to buy today?');
  readln(numOfItems);

  { Calculations }
  total := price * numOfItems;
  tax := total * tax;
  totalWithTax := total + tax;

  { Output }
  writeln;
  writeln('Purchase Summary:');
  writeln(' ', numOfItems, ' ', itemName, '(s)..........$', total:6:2);
  writeln(' Sales Tax (6%)....$', tax:6:2);
  writeln('=====================');
  writeln('Total..............$', totalWithTax:6:2);


  { Halt the console }
  readln;
end.
 