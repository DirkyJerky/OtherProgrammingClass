program ACT2X2;

{
Name: Geoff Yoerger
Assignment: L2 EC 2
Due: EC
Purpose: Tell a user how long it will take them to read a amount of books.
}

{$APPTYPE CONSOLE}

uses
  SysUtils;

var
  books, hours : integer;
  
begin
  { Intro to program }
  writeln('Welcome to the hour calulator!');
  writeln;

  { User Input }
  writeln('How many hours does it take you to read a book?');
  readln(hours);
  writeln('How many books do you want to read?');
  readln(books);

  { Output }
  writeln('It will take you ', books * hours, ' hours to read your books.');

  { Halt the console }
  readln;
end.
 