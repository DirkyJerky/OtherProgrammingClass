program ACT82

{
Name: Geoff Yoerger
Activity 8.2
Due: AHEAD
Purpose: Make a label printer
}

{$APPTYPE CONSOLE}

uses
  SysUtils;

const
  LabelLine1 : String = 'Amy''s Garden Emporium';
  LabelLine2 : String = '243 Main Street';
  LabelLine3 : String = 'Evansville, WI 53536';
// Yay constants

var
  boxes : integer;



//************
//*  Intro
//************
//*  Welcome the User
//************

PROCEDURE Intro ();
BEGIN
  writeln('Welcome to your label printer!');
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

PROCEDURE Prompt(VAR numBoxes : integer);
BEGIN
  writeln;
  writeln('How many boxes?');
  readln(numBoxes);
END;




//************
//*  PrintLabel
//************
//*  Give the user back the information needed
//************
VAR
  i : integer;
PROCEDURE PrintLabel (totalBoxes : integer);
BEGIN
  writeln('Here are your labels');
  writeln;
  writeln;
  FOR i := 1 TO totalBoxes DO BEGIN
    writeln(LabelLine1);
    writeln(LabelLine2);
    writeln(LabelLine3);
    writeln('    Box Number ', i, ' of ', totalBoxes);
    writeln('---------------------');
  END;
END;





{MAIN ==========================================}
BEGIN
  Intro; // Welcome the user

  Prompt(boxes);
  PrintLabel(boxes);

  Outro; // Halt the console
END.
 