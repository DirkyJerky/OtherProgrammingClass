program ACT22;
{
Geoff Yoerger
Activity 2.2
Due: 2-05
Purpose: Prompt for a users name and age and return them a greeting
}
{$APPTYPE CONSOLE}

uses
  SysUtils;

var

  name : String;  { The user's name }
  age : integer; { And their age }

begin

  { Intro }
  writeln('Hello!');

  { User input from computer }
  writeln('What is your name?');
  readln(name);
  writeln('How old are you?');
  readln(age);

  { Response }
  writeln('Hi ', name, '!');
  if age = 1 then         { Fix the plurals in the sentence }
    writeln('You are ', age,' year old!')
  else
    writeln('You are ', age,' years old!');

  readln;

end.
 
