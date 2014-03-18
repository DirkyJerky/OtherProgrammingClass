program ACT53;

{
Name: Geoff Yoerger
Assignment: L5 - A3
Due: 2-19
Purpose: Write a format buget plan based on month income.
}

{$APPTYPE CONSOLE}

uses
  SysUtils;

var
  { Amount of money the user has per month }
  money : real;
  { Number of each budget items percentage }
  RentPercent, FoodPercent, EntertainmentPercent,
    Car_ExpensesPercent, InsurancePercent, ClothingPercent,
    UtilitiesPercent, SavingsPercent : real;
  
begin
  { Init }
  RentPercent :=  0.20;
  FoodPercent :=  0.20;
  EntertainmentPercent :=  0.08;
  Car_ExpensesPercent :=  0.10;
  InsurancePercent :=  0.10;
  ClothingPercent :=  0.18;
  UtilitiesPercent :=  0.05;
  SavingsPercent :=  0.09;

  { Intro to program }
  writeln('Welcome to your Budget Calculator');
  writeln;
  
  { User Input }
  writeln('How much take home money to you earn per month?');
  readln(money);

  { Calculations }  
  RentPercent := money * RentPercent;
  FoodPercent := money * FoodPercent;
  EntertainmentPercent := money * EntertainmentPercent;
  Car_ExpensesPercent := money * Car_ExpensesPercent;
  InsurancePercent := money * InsurancePercent;
  ClothingPercent := money * ClothingPercent;
  UtilitiesPercent := money * UtilitiesPercent;
  SavingsPercent := money * SavingsPercent;


  { Output }
  writeln('Rent...........$', RentPercent:7:2);
  writeln('Food...........$', FoodPercent:7:2);
  writeln('Entertainment..$', EntertainmentPercent:7:2);
  writeln('Car Expenses...$', Car_ExpensesPercent:7:2);
  writeln('Insurance......$', InsurancePercent:7:2);
  writeln('Clothing.......$', ClothingPercent:7:2);
  writeln('Utilities......$', UtilitiesPercent:7:2);
  writeln('Savings........$', SavingsPercent:7:2);
  writeln('=======================');
  writeln('Total..........$', money:7:2);

  { Halt the console }
  readln;
end.
 