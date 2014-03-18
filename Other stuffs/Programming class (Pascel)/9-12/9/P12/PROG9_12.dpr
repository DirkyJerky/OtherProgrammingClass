program ACTPROG00;

{
Name: Geoff Yoerger
Program 9.12
Due: AHEAD
Purpose: Find a persons weight on different planets
}

{$APPTYPE CONSOLE}

uses
  SysUtils;

const
  SUN_MULTI : Real = 27.94;
  MOON_MULTI : Real = 0.17;
  SATURN_MULTI : Real = 1.15;
  MERCURY_MULTI : Real = 0.37;
  MARS_MULTI : Real = 0.38;
  URANUS_MULTI : Real = 1.17;
  VENUS_MULTI : Real = 0.88;
  JUPITER_MULTI : Real = 2.64;
  NEPTUNE_MULTI : Real = 1.18;

var
  planet : String;
  weight : real;
  weightOnPlanet : real;
  weightMultiply : real;



//************
//*  Intro
//************
//*  Welcome the User
//************

PROCEDURE Intro ();
BEGIN
  writeln('Welcome to ', 'the Planet Weight calculator', '!');
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

PROCEDURE Prompt(VAR planetGet : String; VAR weightGet : real);
BEGIN
  writeln;
  writeln('What is your planet you are going to?');
  readln(planetGet);
  writeln('What is your weight on earth?');
  readln(weightGet);
END;


//************
//*  calcWeight
//************
//*  Give the user back the information needed
//************

PROCEDURE calcWeight (VAR newWeight : real; oldWeight : real; multiplyer : real);
BEGIN
  newWeight := oldWeight * multiplyer;
END;



//************
//*  Output
//************
//*  Give the user back the information needed
//************

PROCEDURE Output (planetOut : String; weightOnPlanetOut : real);
BEGIN
  writeln;
  writeln('On ',
          planetOut,
          ', you would weigh ',
          weightOnPlanetOut:0:2,
          ' pounds.');
END;


//************
//*  normalizePlanetName
//************
//*  PURPOSE
//************

PROCEDURE normalizePlanetName (VAR planetNameNorm : String; VAR weightMultiplyer : real);
BEGIN
  CASE Upcase(planetNameNorm[1]) OF
    'S': BEGIN
      CASE Upcase(planetNameNorm[2]) OF
        'U': BEGIN
          planetNameNorm := 'The Sun';
      weightMultiplyer := SUN_MULTI;
        END;
        'A':BEGIN
          planetNameNorm := 'Saturn';
      weightMultiplyer := SATURN_MULTI;
        END;
        ELSE
          planetNameNorm := '';
      END;
    END;
    'M': BEGIN
      CASE Upcase(planetNameNorm[2]) OF
        'O':BEGIN
          planetNameNorm := 'The Moon'; 
      weightMultiplyer := MOON_MULTI;
        END;
        'E':BEGIN
          planetNameNorm := 'Mercury'; 
      weightMultiplyer := MERCURY_MULTI;
        END;
        'A':BEGIN
          planetNameNorm := 'Mars'; 
      weightMultiplyer := MARS_MULTI;
        END;
        ELSE
          planetNameNorm := '';
      END;
    END;
    'U': BEGIN
      planetNameNorm := 'Uranus';
      weightMultiplyer := URANUS_MULTI;
    END;
    'V': BEGIN
      planetNameNorm := 'Venus';
      weightMultiplyer := VENUS_MULTI;
    END;
    'J': BEGIN
      planetNameNorm := 'Jupiter';
      weightMultiplyer := JUPITER_MULTI;
    END;
    'N': BEGIN
      planetNameNorm := 'Neptune';
      weightMultiplyer := NEPTUNE_MULTI;
    END;
    ELSE
      planetNameNorm := 'Earth';

    IF(planetNameNorm = '') THEN
      planetNameNorm := 'Earth';

    IF(weightMultiplyer = 0) THEN
      weightMultiplyer := 1;
  END;
END;





{MAIN ==========================================}
BEGIN
  Intro; // Welcome the user

  Prompt(planet, weight);
  normalizePlanetName(planet, weightMultiply);
  calcWeight(weightOnPlanet, weight, weightMultiply);
  Output(planet, weightOnPlanet);

  Outro; // Halt the console
END.
 