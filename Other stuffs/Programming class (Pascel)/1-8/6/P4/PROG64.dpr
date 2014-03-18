program PROG64;

{
Name: Geoff Yoerger
Program 6.4
Due: Wed 3 05 2014
Purpose: TODO
}

{$APPTYPE CONSOLE}

uses
  SysUtils;

var
  OnePlane, OneCar, OneBreakfast, OneLunch, OneDinner, OneHInn, OneRInn : real; 
  //The costs of the seperate expenses
  TwoPlane, SixCar, SevenBreakfast, SevenLunch, SevenDinner, FourHInn, FourRInn : real;
  // The trip total versions of those expenses
  TotalTravel, TotalFood, TotalLodge : real;
  // Total of each of the sections
  TripTotal : real;
  // And the final trip total



//************
//*  Intro
//************
//*  Welcome the User
//************

PROCEDURE Intro (); BEGIN
  writeln('Hello and welcome to your travel expense report generator.');
  writeln;
END;



//************
//*  Outro

//************
//*  Tie up loose ends and halt the console.
//************

PROCEDURE Outro (); BEGIN
  readln;
END;



//************
//*  GetExpenses
//************
//*  Prompt the user for necessary information
//************

PROCEDURE GetExpenses(VAR OnePlane, OneCar, OneBreakfast, OneLunch, OneDinner, OneHInn, OneRInn : real); BEGIN
  writeln('What is the cost of one plane ticket (Round-trip)?');
  readln(OnePlane);
  writeln('What is the cost of one Car rental per day?');
  readln(OneCar);
  writeln('What is the cost of one Breakfast?');
  readln(OneBreakfast);
  writeln('What is the cost of one Lunch?');
  readln(OneLunch);
  writeln('What is the cost of one Dinner?');
  readln(OneDinner);
  writeln('What is the cost of one night at the Holiday Inn?');
  readln(OneHInn);
  writeln('What is the cost of one night at the Ramada Inn?');
  readln(OneRInn);
END;



//************
//*  Output
//************
//*  Give the user back the information needed
//************

PROCEDURE Output (OnePlane, OneCar, OneBreakfast, OneLunch, OneDinner, OneHInn, OneRInn : real; 
      TwoPlane, SixCar, SevenBreakfast, SevenLunch, SevenDinner, FourHInn, FourRInn : real; 
          TotalTravel, TotalFood, TotalLodge : real; 
              TripTotal : real); BEGIN
  writeln;
  writeln('Please keep the following for your records');
  writeln;
  writeln('One Plane ticket* 2...................$', TwoPlane:0:2);
  writeln('One Car ticket * 6....................$', SixCar:0:2);
  writeln('  Travel Total......................$', TotalTravel:0:2);
  writeln;
  writeln('---------------------------------------------');
  writeln('One Daily Breakfast * 7...............$', SevenBreakfast:0:2);
  writeln('One Daily Lunch * 7...................$', SevenLunch:0:2);
  writeln('One Daily Dinner * 7..................$', SevenDinner:0:2);
  writeln('---------------------------------------------');
  writeln('  Food Total........................$', TotalFood:0:2);
  writeln;
  writeln('One Night at the Holiday Inn * 4......$', FourHInn:0:2);
  writeln('One Night at the Ramada Inn * 4.......$', FourRInn:0:2);
  writeln('---------------------------------------------');
  writeln('  Lodging Total.....................$', TotalLodge:0:2);
  writeln;
  writeln('=============================================');
  writeln('    Grand Total...................$', TripTotal:0:2);
END;




//************
//*  AddExpenses
//************
//*   PURPOSE
//************

PROCEDURE AddExpenses (OnePlane, OneCar, OneBreakfast, OneLunch, OneDinner, OneHInn, OneRInn : real;
    VAR TwoPlane, SixCar, SevenBreakfast, SevenLunch, SevenDinner, FourHInn, FourRInn : real); BEGIN
  TwoPlane := OnePlane * 2;
  SixCar := OneCar * 6;
  SevenBreakfast := OneBreakfast * 7;
  SevenLunch := OneLunch * 7;
  SevenDinner := OneDinner * 7;
  FourHInn := OneHInn * 4;
  FourRInn := OneRInn * 4;
END;

//************
//*  Total
//************
//*   PURPOSE
//************

PROCEDURE Total (TwoPlane, SixCar, SevenBreakfast, SevenLunch, SevenDinner, FourHInn, FourRInn : real;
      VAR TotalTravel, TotalFood, TotalLodge, TripTotal : real); BEGIN
  TotalTravel := TwoPlane + SixCar;
  TotalFood := SevenBreakfast + SevenLunch + SevenDinner;
  TotalLodge := FourHInn + FourRInn;
  TripTotal := TotalTravel + TotalFood + TotalLodge;
END;


{MAIN ==========================================} BEGIN
  Intro; // Welcome the user

  
  GetExpenses(OnePlane, OneCar, OneBreakfast, OneLunch, OneDinner, OneHInn, OneRInn); // Prompt the user for costs for the trip
  AddExpenses(OnePlane, OneCar, OneBreakfast, OneLunch, OneDinner, OneHInn, OneRInn, 
    TwoPlane, SixCar, SevenBreakfast, SevenLunch, SevenDinner, FourHInn, FourRInn);

  Total(TwoPlane, SixCar, SevenBreakfast, SevenLunch, SevenDinner, FourHInn, FourRInn,
      TotalTravel, TotalFood, TotalLodge, TripTotal);
  Output(OnePlane, OneCar, OneBreakfast, OneLunch, OneDinner, OneHInn, OneRInn, 
    TwoPlane, SixCar, SevenBreakfast, SevenLunch, SevenDinner, FourHInn, FourRInn,
       TotalTravel, TotalFood, TotalLodge,
         TripTotal);

  Outro; // Halt the console
END.

