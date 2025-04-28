program aufgabe3WIP;
{$R+,Q+,X-}
uses
  SysUtils, Math;

var
  Startbahnhof: Byte;
  Zielbahnhof: Byte;
  Zwischenstation: Byte;
  Kosten: Integer;
  Benachbart: Boolean;
  Schnellverbindung: Boolean;
  Temporaer: Byte;
  Benachbartzwischnestation: Boolean;
  Schnellverbindungzwischnestation: Boolean;

const
  ZWISCHENSTATIONPREIS = 70;
  SCHNELLVERBINDUNGPREIS = 100;

begin
  Startbahnhof := 0;
  Zielbahnhof := 0;
  Zwischenstation := 0;
  Kosten := 0;
  Benachbart := False;
  Schnellverbindung := False;
  Benachbartzwischnestation := False;
  Schnellverbindungzwischnestation := False;

  Writeln('Geben sie an von welchem Bahnhof sie starten');
  Readln(Startbahnhof);
  Writeln('Geben sie an zu welchen Bahnhof sie reisen möchten');
  Readln(Zielbahnhof);

  if Startbahnhof > Zielbahnhof then
  begin
    Temporaer := Startbahnhof;
    Startbahnhof := Zielbahnhof;
    Zielbahnhof := Temporaer;
  end;

    if Zwischenstation > Zielbahnhof then
  begin
    Temporaerzwischentation := Startbahnhof;
    Zwischenstation := Zielbahnhof;
    Zielbahnhof := Temporaerzwischentation;
  end;


    if ((Zwischenstation = 1) and ((Zielbahnhof = 2) or (Zielbahnhof = 3))) or
     ((Zwischenstation = 2) and (Zielbahnhof = 5)) or
     ((Zwischenstation = 3) and (Zielbahnhof = 4)) or
     ((Zwischenstation = 4) and (Zielbahnhof = 6)) or
     ((Zwischenstation = 5) and ((Zielbahnhof = 7) or (Zielbahnhof = 10))) or
     ((Zwischenstation = 6) and ((Zielbahnhof = 7) or (Zielbahnhof = 9))) or
     ((Zwischenstation = 7) and (Zielbahnhof = 10)) or
     ((Zwischenstation = 8) and ((Zielbahnhof = 9) or (Zielbahnhof = 12))) or
     ((Zwischenstation = 9) and ((Zielbahnhof = 10) or (Zielbahnhof = 14))) or
     ((Zwischenstation = 10) and (Zielbahnhof = 11)) or
     ((Zwischenstation = 12) and (Zielbahnhof = 13)) or
     ((Zwischenstation = 12) and (Zielbahnhof = 14)) or
     ((Zwischenstation = 13) and (Zielbahnhof = 14)) or
     ((Zwischenstation = 14) and (Zielbahnhof = 16)) or
     ((Zwischenstation = 15) and ((Zielbahnhof = 16) or (Zielbahnhof = 17))) or
     ((Zwischenstation = 16) and (Zielbahnhof = 17))
  then
  begin
    BenachbartZwischenstation := true;
  end;
  else if ((Zwischenstation = 4) and (Zielbahnhof = 8)) or
          ((Zwischenstation = 3) and (Zielbahnhof = 5)) or
          ((Zwischenstation = 14) and (Zielbahnhof = 15)) or
          ((Zwischenstation = 10) and (Zielbahnhof = 15)) then
  begin
    SchnellverbindungZwischenstation := True;
    BenachbartZwischenstation := True;
  end
  else
  begin
    BenachbartZwischenstation := false;
    SchnellverbindungZwischenstation := False;
  end;

  if ((Startbahnhof = 1) and ((Zielbahnhof = 2) or (Zielbahnhof = 3))) or
     ((Startbahnhof = 2) and (Zielbahnhof = 5)) or
     ((Startbahnhof = 3) and (Zielbahnhof = 4)) or
     ((Startbahnhof = 4) and (Zielbahnhof = 6)) or
     ((Startbahnhof = 5) and ((Zielbahnhof = 7) or (Zielbahnhof = 10))) or
     ((Startbahnhof = 6) and ((Zielbahnhof = 7) or (Zielbahnhof = 9))) or
     ((Startbahnhof = 7) and (Zielbahnhof = 10)) or
     ((Startbahnhof = 8) and ((Zielbahnhof = 9) or (Zielbahnhof = 12))) or
     ((Startbahnhof = 9) and ((Zielbahnhof = 10) or (Zielbahnhof = 14))) or
     ((Startbahnhof = 10) and (Zielbahnhof = 11)) or
     ((Startbahnhof = 12) and (Zielbahnhof = 13)) or
     ((Startbahnhof = 12) and (Zielbahnhof = 14)) or
     ((Startbahnhof = 13) and (Zielbahnhof = 14)) or
     ((Startbahnhof = 14) and (Zielbahnhof = 16)) or
     ((Startbahnhof = 15) and ((Zielbahnhof = 16) or (Zielbahnhof = 17))) or
     ((Startbahnhof = 16) and (Zielbahnhof = 17))
  then
  begin
    Benachbart := true;
    Schnellverbindung := False;
    Kosten := Kosten + ZWISCHENSTATIONPREIS * 2;
  end
  else if ((Startbahnhof = 4) and (Zielbahnhof = 8)) or
          ((Startbahnhof = 3) and (Zielbahnhof = 5)) or
          ((Startbahnhof = 14) and (Zielbahnhof = 15)) or
          ((Startbahnhof = 10) and (Zielbahnhof = 15)) then
  begin
    Schnellverbindung := True;
    Benachbart := True;
    Kosten := Kosten + SCHNELLVERBINDUNGPREIS;
  end
  else
  begin
    Benachbart := false;
    Schnellverbindung := False;
  end;


    if Benachbart = false and Schnellverbindung = false then
    begin
          Writeln('Geben sie eine Zwischenstation aus von der sie weiter Reisen möchten');
        Readln(Zwischenstationen);
        end;

  if Temporaer > 0 then
 begin
  Temporaer := Zielbahnhof;
  Zielbahnhof := Startbahnhof;
  Startbahnhof := Temporaer;
   end;


    if Temporaerzwischentation > 0 then
 begin
  Temporaerzwischentation := Zielbahnhof;
  Zielbahnhof := Zwischenstationen;
  Zwischenstation := Temporaerzwischentation;
   end;



 
  case Startbahnhof of
    1: Writeln('Der Startbahnhof ist Kiel');
    2: Writeln('Der Startbahnhof ist Rostock');
    3: Writeln('Der Startbahnhof ist Hamburg');
    4: Writeln('Der Startbahnhof ist Bremen');
    5: Writeln('Der Startbahnhof ist Berlin');
    6: Writeln('Der Startbahnhof ist Hannover');
    7: Writeln('Der Startbahnhof ist Magdeburg');
    8: Writeln('Der Startbahnhof ist Dortmund');
    9: Writeln('Der Startbahnhof ist Kassel');
    10: Writeln('Der Startbahnhof ist Leipzig');
    11: Writeln('Der Startbahnhof ist Dresden');
    12: Writeln('Der Startbahnhof ist Koeln');
    13: Writeln('Der Startbahnhof ist Bonn');
    14: Writeln('Der Startbahnhof ist Frankfurt');
    15: Writeln('Der Startbahnhof ist Nuernberg');
    16: Writeln('Der Startbahnhof ist Stuttgart');
    17: Writeln('Der Startbahnhof ist Muenchen');
  else
    Writeln('Fehlerhafte Eingabe!');
  end;

  case Zielbahnhof of
    1: Writeln('Der Zielbahnhof ist Kiel');
    2: Writeln('Der Zielbahnhof ist Rostock');
    3: Writeln('Der Zielbahnhof ist Hamburg');
    4: Writeln('Der Zielbahnhof ist Bremen');
    5: Writeln('Der Zielbahnhof ist Berlin');
    6: Writeln('Der Zielbahnhof ist Hannover');
    7: Writeln('Der Zielbahnhof ist Magdeburg');
    8: Writeln('Der Zielbahnhof ist Dortmund');
    9: Writeln('Der Zielbahnhof ist Kassel');
    10: Writeln('Der Zielbahnhof ist Leipzig');
    11: Writeln('Der Zielbahnhof ist Dresden');
    12: Writeln('Der Zielbahnhof ist Koeln');
    13: Writeln('Der Zielbahnhof ist Bonn');
    14: Writeln('Der Zielbahnhof ist Frankfurt');
    15: Writeln('Der Zielbahnhof ist Nuernberg');
    16: Writeln('Der Zielbahnhof ist Stuttgart');
    17: Writeln('Der Zielbahnhof ist Muenchen');
  else
    Writeln('Fehlerhafte Eingabe!');
  end;

  case Zwischenstationen of
    1: Writeln('Der Zwischenstopp liegt in Kiel');
    2: Writeln('Der Zwischenstopp liegt in Rostock');
    3: Writeln('Der Zwischenstopp liegt in Hamburg');
    4: Writeln('Der Zwischenstopp liegt in Bremen');
    5: Writeln('Der Zwischenstopp liegt in Berlin');
    6: Writeln('Der Zwischenstopp liegt in Hannover');
    7: Writeln('Der Zwischenstopp liegt in Magdeburg');
    8: Writeln('Der Zwischenstopp liegt in Dortmund');
    9: Writeln('Der Zwischenstopp liegt in Kassel');
    10: Writeln('Der Zwischenstopp liegt in Leipzig');
    11: Writeln('Der Zwischenstopp liegt in Dresden');
    12: Writeln('Der Zwischenstopp liegt in Koeln');
    13: Writeln('Der Zwischenstopp liegt in Bonn');
    14: Writeln('Der Zwischenstopp liegt in Frankfurt');
    15: Writeln('Der Zwischenstopp liegt in Nuernberg');
    16: Writeln('Der Zwischenstopp liegt in Stuttgart');
    17: Writeln('Der Zwischenstopp liegt in Muenchen');
  else
    Writeln('Fehlerhafte Eingabe!');
  end;





  if Zwischenstationen = Startbahnhof then
  begin
    Writeln('Sie sind bereits am Zielbahnhof angekommen!');
  end
  else if Zwischenstationen = Zielbahnhof then
  begin
    Writeln('Die Zwischenstation ist gleich dem Zielbahnhof!');
  end
  else if Startbahnhof = Zielbahnhof then
  begin
    Writeln('Der Startbahnhof ist gleich dem Zielbahnhof!');
  end
  else
  begin
    Writeln('Die Kosten betragen: ', Kosten, ' Euro');
  end;
end.
