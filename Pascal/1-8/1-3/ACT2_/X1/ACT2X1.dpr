program ACT2X1;
{
Geoff Yoerger
Activity 2X1
Due: EC
Purpose: Do a mad libs program
}
{$APPTYPE CONSOLE}

uses
  SysUtils;

var

  n1, n2, n3, n4, n5, n6 : String;  { All the nouns }
  a1, a2, a3, a4, a5 : String;  { and the adjectives }
  pn1, pn2, pn3 : String;  { and the plural nouns }
  body1, body2 : String;  { and the body parts }
  bodyp1 : String;  { and the plural body parts }

begin

  { Intro }
  writeln('Hello and welcome to mad libs!');

  { Retrieve the words }
  writeln('Please input:');
  writeln('Noun');
  readln(n1);
  writeln('Noun');
  readln(n2);
  writeln('Noun');
  readln(n3);
  writeln('Noun');
  readln(n4);
  writeln('Noun');
  readln(n5);
  writeln('Noun');
  readln(n6);
  writeln('Adjective');
  readln(a1);
  writeln('Adjective');
  readln(a2);
  writeln('Adjective');
  readln(a3);
  writeln('Adjective');
  readln(a4);
  writeln('Adjective');
  readln(a5);
  writeln('Body Part');
  readln(body1);
  writeln('Body Part');
  readln(body2);
  writeln('Plural Noun');
  readln(pn1);
  writeln('Plural Noun');
  readln(pn2);
  writeln('Plural Noun');
  readln(pn3);
  writeln('Plural Body Part');
  readln(bodyp1);

  { Seperate the I and O}
  writeln;
  writeln;

  { Response }
  writeln(pn1, ' of all ages enjoy watching ', a1,' magicians perform their ', a2,' tricks. ');
  writeln('Every man, woman, and ', n1,' loves to see a magician pull a/an ', n2,' out of a hat,');
  writeln(' saw a live ', n3,' in half, or make a huge ', n4,' disappear into ', a3,' air.');
  writeln('Audiences love when magicians perform sleight of ', body1,' with a deck of ', pn2);
  writeln(' a/an ', a4,' coin, or a silk ', n5, '.');
  writeln;
  writeln('The greatest of all magicians was the ', a5,' Harry Houdini,');
  writeln(' who was able to escape from a locked ', n6 ,'even though his ', bodyp1,' were');
  writeln(' tied behind his ', body2,' and his feet were wrapped in iron ', pn3, '.');

  readln;

end.
 
