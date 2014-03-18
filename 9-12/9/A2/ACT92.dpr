program Boilerplate;

{
Name: Geoff Yoerger
Activity 9.2
Due: AHEAD
Purpose: Tell how much days are in a month
}

{$APPTYPE CONSOLE}

uses
  SysUtils;

VAR
    monthNum : integer;
    monthName : String;
    monthDays : byte;
    leapYear : boolean;
    leapYearAns : char;



//************
//*  Intro
//************
//*  Welcome the User
//************

PROCEDURE Intro ();
BEGIN
  writeln('Welcome to the days-in-a-month finder!');
  writeln;
END;


//************
//*  Outro
//************
//*  Tie up loose ends and halt the console.
//************

PROCEDURE Outro ();
BEGIN
  readln;
END;


//************
//*  Prompt
//************
//*  Prompt the user for necessary information
//************

PROCEDURE Prompt(VAR monthNumGet : integer);
BEGIN
  writeln('Please enter the integer corresponding to the month in question');
  readln(monthNumGet);
END;


//************
//*  findMonthName
//************
//*  Find the corrisponding month for an integer
//************
PROCEDURE findMonthName(monthNumFind : integer; VAR monthNameFind : String);BEGIN
    CASE monthNumFind OF 
        0: monthNameFind := 'December';
        1: monthNameFind := 'January';
        2: monthNameFind := 'February';
        3: monthNameFind := 'March';
        4: monthNameFind := 'April';
        5: monthNameFind := 'May';
        6: monthNameFind := 'June';
        7: monthNameFind := 'July';
        8: monthNameFind := 'August';
        9: monthNameFind := 'September';
        10: monthNameFind := 'October';
        11: monthNameFind := 'November';
        12: monthNameFind := 'December';
        ELSE
          findMonthName(monthNumFind MOD 12, monthNameFind);
    END;
END;


//************
//*  evalBoolean
//************
//*  Evaluate a boolean based on a char
//************
PROCEDURE evalBoolean(input : char; VAR outputBool : boolean); BEGIN
    input := Upcase(input); // Uppercase
    IF(input = 'Y') THEN
        outputBool := true
    ELSE
        outputBool := false;
END;



//************
//*  findMonthDays
//************
//*  Find the corrisponding days of a month
//************
PROCEDURE findMonthDays(monthNumFind : integer; VAR monthDaysFind : byte); BEGIN
    CASE (monthNumFind MOD 12) OF
        0, 1, 3, 5, 7, 8, 10, 12:
            monthDaysFind := 31;
        4, 6, 9, 11:
            monthDaysFind := 30;
        2: BEGIN // Find if its a leap year
            writeln('Is it a leap year? (y/n)');
            readln(leapYearAns);
            evalBoolean(leapYearAns, leapYear);

            IF (leapYear) THEN
                monthDaysFind := 29
            ELSE
                monthDaysFind := 28;
            //ENDIF
        END;
    END;//CASE
END;

 
//************
//*  Output
//************
//*  Give the user back the information needed
//************

PROCEDURE Output ( monthDaysOut : byte; monthNameOut : String);
BEGIN
  writeln;
  writeln('There are ', monthDaysOut, ' days in ', monthNameOut, '.');
END;


{MAIN ==========================================}
BEGIN
  Intro; // Welcome the user

  Prompt(monthNum);
  findMonthName(monthNum, monthName);
  findMonthDays(monthNum, monthDays);
  Output(monthDays, monthName);

  Outro; // Halt the console
END.
 