program aufgabe3WIP;
{$R+,Q+,X-}
uses
  SysUtils, Math;

var
  Startbahnhof, Zielbahnhof, Zwischenstation: Byte;
  Kosten1, Kosten2, KostenInsgesamt: Integer;
  DirektVerbindung: Boolean;
  Temp: Byte;
  Start1, Ziel1, Start2, Ziel2: Byte;

const
  ZWISCHENSTATIONPREIS = 70;
  SCHNELLVERBINDUNGPREIS = 100;

begin
  Startbahnhof := 0;
  Zielbahnhof := 0;
  Zwischenstation := 0;
  Kosten1 := 0;
  Kosten2 := 0;
  KostenInsgesamt := 0;
  DirektVerbindung := False;

  Writeln('Geben sie an von welchem Bahnhof sie starten (1-17):');
  Readln(Startbahnhof);
  Writeln('Geben sie an zu welchen Bahnhof sie reisen möchten (1-17):');
  Readln(Zielbahnhof);

  if Startbahnhof = Zielbahnhof then
  begin
    Writeln('FEHLER: Start- und Zielbahnhof sind identisch!');
    Exit;
  end;

  // Sortieren für die direkte Verbindungsprüfung
  if Startbahnhof > Zielbahnhof then
  begin
    Temp := Startbahnhof;
    Startbahnhof := Zielbahnhof;
    Zielbahnhof := Temp;
  end;

  // Direkte Verbindungsprüfung (gelbe Strecken)
  if (Startbahnhof = 1) and (Zielbahnhof = 3) or
     (Startbahnhof = 2) and ((Zielbahnhof = 3) or (Zielbahnhof = 5)) or
     (Startbahnhof = 3) and (Zielbahnhof = 4) or
     (Startbahnhof = 4) and (Zielbahnhof = 6) or
     (Startbahnhof = 5) and ((Zielbahnhof = 7) or (Zielbahnhof = 10)) or
     (Startbahnhof = 6) and ((Zielbahnhof = 7) or (Zielbahnhof = 9)) or
     (Startbahnhof = 7) and (Zielbahnhof = 10) or
     (Startbahnhof = 8) and ((Zielbahnhof = 9) or (Zielbahnhof = 12)) or
     (Startbahnhof = 9) and ((Zielbahnhof = 10) or (Zielbahnhof = 14)) or
     (Startbahnhof = 10) and (Zielbahnhof = 11) or
     (Startbahnhof = 12) and ((Zielbahnhof = 13) or (Zielbahnhof = 14)) or
     (Startbahnhof = 13) and (Zielbahnhof = 14) or
     (Startbahnhof = 14) and (Zielbahnhof = 16) or
     (Startbahnhof = 15) and ((Zielbahnhof = 16) or (Zielbahnhof = 17)) or
     (Startbahnhof = 16) and (Zielbahnhof = 17) then
  begin
    DirektVerbindung := True;
    Kosten1 := ZWISCHENSTATIONPREIS;
  end
  // Direkte Verbindungsprüfung (grüne Strecken)
  else if (Startbahnhof = 3) and (Zielbahnhof = 5) or
          (Startbahnhof = 4) and (Zielbahnhof = 8) or
          (Startbahnhof = 10) and (Zielbahnhof = 15) or
          (Startbahnhof = 14) and (Zielbahnhof = 15) then
  begin
    DirektVerbindung := True;
    Kosten1 := SCHNELLVERBINDUNGPREIS;
  end;

  if DirektVerbindung then
    KostenInsgesamt := Kosten1
  else
  begin
    // Keine direkte Verbindung, nach Zwischenstation fragen
    Writeln('Keine direkte Verbindung möglich. Geben sie eine Zwischenstation ein (1-17):');
    Readln(Zwischenstation);

    if (Zwischenstation = Startbahnhof) or (Zwischenstation = Zielbahnhof) then
    begin
      Writeln('FEHLER: Zwischenstation darf nicht gleich Start- oder Zielbahnhof sein!');
      Exit;
    end;

    // Prüfe erste Teilstrecke: Startbahnhof -> Zwischenstation
    Start1 := Startbahnhof;
    Ziel1 := Zwischenstation;
    
    // Sortieren für weniger Vergleiche
    if Start1 > Ziel1 then
    begin
      Temp := Start1;
      Start1 := Ziel1;
      Ziel1 := Temp;
    end;
    
    // Prüfe zweite Teilstrecke: Zwischenstation -> Zielbahnhof
    Start2 := Zwischenstation;
    Ziel2 := Zielbahnhof;
    
    // Sortieren für weniger Vergleiche
    if Start2 > Ziel2 then
    begin
      Temp := Start2;
      Start2 := Ziel2;
      Ziel2 := Temp;
    end;
    
    // Verbindungsprüfung für erste Teilstrecke (gelbe Strecken)
    if (Start1 = 1) and (Ziel1 = 3) or
       (Start1 = 2) and ((Ziel1 = 3) or (Ziel1 = 5)) or
       (Start1 = 3) and (Ziel1 = 4) or
       (Start1 = 4) and (Ziel1 = 6) or
       (Start1 = 5) and ((Ziel1 = 7) or (Ziel1 = 10)) or
       (Start1 = 6) and ((Ziel1 = 7) or (Ziel1 = 9)) or
       (Start1 = 7) and (Ziel1 = 10) or
       (Start1 = 8) and ((Ziel1 = 9) or (Ziel1 = 12)) or
       (Start1 = 9) and ((Ziel1 = 10) or (Ziel1 = 14)) or
       (Start1 = 10) and (Ziel1 = 11) or
       (Start1 = 12) and ((Ziel1 = 13) or (Ziel1 = 14)) or
       (Start1 = 13) and (Ziel1 = 14) or
       (Start1 = 14) and (Ziel1 = 16) or
       (Start1 = 15) and ((Ziel1 = 16) or (Ziel1 = 17)) or
       (Start1 = 16) and (Ziel1 = 17) then
    begin
      Kosten1 := ZWISCHENSTATIONPREIS;
    end
    // Verbindungsprüfung für erste Teilstrecke (grüne Strecken)
    else if (Start1 = 3) and (Ziel1 = 5) or
            (Start1 = 4) and (Ziel1 = 8) or
            (Start1 = 10) and (Ziel1 = 15) or
            (Start1 = 14) and (Ziel1 = 15) then
    begin
      Kosten1 := SCHNELLVERBINDUNGPREIS;
    end;
    
    // Verbindungsprüfung für zweite Teilstrecke (gelbe Strecken)
    if (Start2 = 1) and (Ziel2 = 3) or
       (Start2 = 2) and ((Ziel2 = 3) or (Ziel2 = 5)) or
       (Start2 = 3) and (Ziel2 = 4) or
       (Start2 = 4) and (Ziel2 = 6) or
       (Start2 = 5) and ((Ziel2 = 7) or (Ziel2 = 10)) or
       (Start2 = 6) and ((Ziel2 = 7) or (Ziel2 = 9)) or
       (Start2 = 7) and (Ziel2 = 10) or
       (Start2 = 8) and ((Ziel2 = 9) or (Ziel2 = 12)) or
       (Start2 = 9) and ((Ziel2 = 10) or (Ziel2 = 14)) or
       (Start2 = 10) and (Ziel2 = 11) or
       (Start2 = 12) and ((Ziel2 = 13) or (Ziel2 = 14)) or
       (Start2 = 13) and (Ziel2 = 14) or
       (Start2 = 14) and (Ziel2 = 16) or
       (Start2 = 15) and ((Ziel2 = 16) or (Ziel2 = 17)) or
       (Start2 = 16) and (Ziel2 = 17) then
    begin
      Kosten2 := ZWISCHENSTATIONPREIS;
    end
    // Verbindungsprüfung für zweite Teilstrecke (grüne Strecken)
    else if (Start2 = 3) and (Ziel2 = 5) or
            (Start2 = 4) and (Ziel2 = 8) or
            (Start2 = 10) and (Ziel2 = 15) or
            (Start2 = 14) and (Ziel2 = 15) then
    begin
      Kosten2 := SCHNELLVERBINDUNGPREIS;
    end;
    
    KostenInsgesamt := Kosten1 + Kosten2;
  end;

  // Ausgabe der Reiseinformationen
  Writeln('Ihre Reiseroute:');
  
  Write('Startbahnhof: ');
  case Startbahnhof of
    1: Writeln('Kiel');
    2: Writeln('Rostock');
    3: Writeln('Hamburg');
    4: Writeln('Bremen');
    5: Writeln('Berlin');
    6: Writeln('Hannover');
    7: Writeln('Magdeburg');
    8: Writeln('Dortmund');
    9: Writeln('Kassel');
    10: Writeln('Leipzig');
    11: Writeln('Dresden');
    12: Writeln('Köln');
    13: Writeln('Bonn');
    14: Writeln('Frankfurt');
    15: Writeln('Nürnberg');
    16: Writeln('Stuttgart');
    17: Writeln('München');
  else
    Writeln('Unbekannt');
  end;
  
  if not DirektVerbindung and (Zwischenstation > 0) then
  begin
    Write('Zwischenstation: ');
    case Zwischenstation of
      1: Writeln('Kiel');
      2: Writeln('Rostock');
      3: Writeln('Hamburg');
      4: Writeln('Bremen');
      5: Writeln('Berlin');
      6: Writeln('Hannover');
      7: Writeln('Magdeburg');
      8: Writeln('Dortmund');
      9: Writeln('Kassel');
      10: Writeln('Leipzig');
      11: Writeln('Dresden');
      12: Writeln('Köln');
      13: Writeln('Bonn');
      14: Writeln('Frankfurt');
      15: Writeln('Nürnberg');
      16: Writeln('Stuttgart');
      17: Writeln('München');
    else
      Writeln('Unbekannt');
    end;
  end;
  
  Write('Zielbahnhof: ');
  case Zielbahnhof of
    1: Writeln('Kiel');
    2: Writeln('Rostock');
    3: Writeln('Hamburg');
    4: Writeln('Bremen');
    5: Writeln('Berlin');
    6: Writeln('Hannover');
    7: Writeln('Magdeburg');
    8: Writeln('Dortmund');
    9: Writeln('Kassel');
    10: Writeln('Leipzig');
    11: Writeln('Dresden');
    12: Writeln('Köln');
    13: Writeln('Bonn');
    14: Writeln('Frankfurt');
    15: Writeln('Nürnberg');
    16: Writeln('Stuttgart');
    17: Writeln('München');
  else
    Writeln('Unbekannt');
  end;

  // Ausgabe der Kosten oder Fehlermeldung
  if KostenInsgesamt = 0 then
    Writeln('Keine gültige Verbindung gefunden!')
  else
    Writeln('Die Kosten betragen: ', KostenInsgesamt, ' Euro');
end.
