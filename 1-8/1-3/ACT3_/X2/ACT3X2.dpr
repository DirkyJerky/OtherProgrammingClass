program ACT3X2;

{
Name: Geoff Yoerger
Assignment: Lesson 3 extra credit 2
Due: EC
Purpose: Calculate a semerster grade given 3 other grades of varying importance
}

{$APPTYPE CONSOLE}

uses
  SysUtils;

var
  grade1, grade2, grade3, finalGrade : real;
  
begin
  { Intro to program }
  writeln('Welcome to the Smester grade calculator ');
  writeln;
  
  { User Input }
  writeln('First quarter grade (40%)? ');
  readln(grade1);
  writeln('Second (40%)? ');
  readln(grade2);
  writeln('Exam (20%)? ');
  readln(grade3);

  { Before calculations output }
  writeln('First Quarter.....', grade1:6:2, '%');
  writeln('Second Quarter....', grade2:6:2, '%');
  writeln('Exam..............', grade3:6:2, '%');
  writeln('=========================');


  { Calculations }
  grade1 := grade1 * 0.4;
  grade2 := grade2 * 0.4;
  grade3 := grade3 * 0.2;
  finalGrade := grade1 + grade2 + grade3;

  { Output };
  writeln('Final grade.......', finalGrade:6:2, '%');

  { Halt the console }
  readln;
end.
 