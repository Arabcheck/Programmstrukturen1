program aufgabe3WIP;
{$R+,Q+,X-}
uses
  SysUtils, Math;

var
  Startbahnhof, Zielbahnhof, Zwischenstation: Byte;
  Kosten1, Kosten2, KostenInsgesamt: Integer;
  DirektVerbindung: Boolean;
  Original_Start, Original_Ziel: Byte;

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

  // Speichern der originalen Werte
  Original_Start := Startbahnhof;
  Original_Ziel := Zielbahnhof;

  if Startbahnhof = Zielbahnhof then
  begin
    Writeln('FEHLER: Start- und Zielbahnhof sind identisch!');
  end;

  // Direkte Verbindungsprüfung (gelbe Strecken)
  if (Startbahnhof = 1) and (Zielbahnhof = 3) or (Startbahnhof = 3) and (Zielbahnhof = 1) or
     (Startbahnhof = 2) and (Zielbahnhof = 3) or (Startbahnhof = 3) and (Zielbahnhof = 2) or
     (Startbahnhof = 2) and (Zielbahnhof = 5) or (Startbahnhof = 5) and (Zielbahnhof = 2) or
     (Startbahnhof = 3) and (Zielbahnhof = 4) or (Startbahnhof = 4) and (Zielbahnhof = 3) or
     (Startbahnhof = 3) and (Zielbahnhof = 6) or (Startbahnhof = 6) and (Zielbahnhof = 3) or
     (Startbahnhof = 4) and (Zielbahnhof = 6) or (Startbahnhof = 6) and (Zielbahnhof = 4) or
     (Startbahnhof = 5) and (Zielbahnhof = 11) or (Startbahnhof = 11) and (Zielbahnhof = 5) or
     (Startbahnhof = 6) and (Zielbahnhof = 7) or (Startbahnhof = 7) and (Zielbahnhof = 6) or
     (Startbahnhof = 6) and (Zielbahnhof = 9) or (Startbahnhof = 9) and (Zielbahnhof = 6) or
     (Startbahnhof = 7) and (Zielbahnhof = 10) or (Startbahnhof = 10) and (Zielbahnhof = 7) or
     (Startbahnhof = 8) and (Zielbahnhof = 9) or (Startbahnhof = 9) and (Zielbahnhof = 8) or
     (Startbahnhof = 8) and (Zielbahnhof = 12) or (Startbahnhof = 12) and (Zielbahnhof = 8) or
     (Startbahnhof = 8) and (Zielbahnhof = 14) or (Startbahnhof = 14) and (Zielbahnhof = 8) or
     (Startbahnhof = 9) and (Zielbahnhof = 14) or (Startbahnhof = 14) and (Zielbahnhof = 9) or
     (Startbahnhof = 9) and (Zielbahnhof = 15) or (Startbahnhof = 15) and (Zielbahnhof = 9) or
     (Startbahnhof = 10) and (Zielbahnhof = 11) or (Startbahnhof = 11) and (Zielbahnhof = 10) or
     (Startbahnhof = 11) and (Zielbahnhof = 6) or (Startbahnhof = 6) and (Zielbahnhof = 11) or
     (Startbahnhof = 12) and (Zielbahnhof = 13) or (Startbahnhof = 13) and (Zielbahnhof = 12) or
     (Startbahnhof = 13) and (Zielbahnhof = 14) or (Startbahnhof = 14) and (Zielbahnhof = 13) or
     (Startbahnhof = 14) and (Zielbahnhof = 16) or (Startbahnhof = 16) and (Zielbahnhof = 14) or
     (Startbahnhof = 15) and (Zielbahnhof = 16) or (Startbahnhof = 16) and (Zielbahnhof = 15) or
     (Startbahnhof = 15) and (Zielbahnhof = 17) or (Startbahnhof = 17) and (Zielbahnhof = 15) or
     (Startbahnhof = 15) and (Zielbahnhof = 9) or (Startbahnhof = 9) and (Zielbahnhof = 15) or
     (Startbahnhof = 16) and (Zielbahnhof = 17) or (Startbahnhof = 17) and (Zielbahnhof = 16) then
  begin
    DirektVerbindung := True;
    Kosten1 := ZWISCHENSTATIONPREIS;
  end
  // Direkte Verbindungsprüfung (grüne Strecken - Schnellverbindungen)
  else if (Startbahnhof = 3) and (Zielbahnhof = 5) or (Startbahnhof = 5) and (Zielbahnhof = 3) or
          (Startbahnhof = 4) and (Zielbahnhof = 8) or (Startbahnhof = 8) and (Zielbahnhof = 4) or
          (Startbahnhof = 10) and (Zielbahnhof = 15) or (Startbahnhof = 15) and (Zielbahnhof = 10) or
          (Startbahnhof = 14) and (Zielbahnhof = 15) or (Startbahnhof = 15) and (Zielbahnhof = 14) then
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

    if (Zwischenstation = Original_Start) or (Zwischenstation = Original_Ziel) then
    begin
      Writeln('FEHLER: Zwischenstation darf nicht gleich Start- oder Zielbahnhof sein!');
    end;

    // Prüfe erste Teilstrecke: Original_Start -> Zwischenstation
    Kosten1 := 0;
    // Gelbe Strecken
    if (Original_Start = 1) and (Zwischenstation = 3) or (Original_Start = 3) and (Zwischenstation = 1) or
       (Original_Start = 2) and (Zwischenstation = 3) or (Original_Start = 3) and (Zwischenstation = 2) or
       (Original_Start = 2) and (Zwischenstation = 5) or (Original_Start = 5) and (Zwischenstation = 2) or
       (Original_Start = 3) and (Zwischenstation = 4) or (Original_Start = 4) and (Zwischenstation = 3) or
       (Original_Start = 3) and (Zwischenstation = 6) or (Original_Start = 6) and (Zwischenstation = 3) or
       (Original_Start = 4) and (Zwischenstation = 6) or (Original_Start = 6) and (Zwischenstation = 4) or
       (Original_Start = 5) and (Zwischenstation = 11) or (Original_Start = 11) and (Zwischenstation = 5) or
       (Original_Start = 6) and (Zwischenstation = 7) or (Original_Start = 7) and (Zwischenstation = 6) or
       (Original_Start = 6) and (Zwischenstation = 9) or (Original_Start = 9) and (Zwischenstation = 6) or
       (Original_Start = 7) and (Zwischenstation = 10) or (Original_Start = 10) and (Zwischenstation = 7) or
       (Original_Start = 8) and (Zwischenstation = 9) or (Original_Start = 9) and (Zwischenstation = 8) or
       (Original_Start = 8) and (Zwischenstation = 12) or (Original_Start = 12) and (Zwischenstation = 8) or
       (Original_Start = 8) and (Zwischenstation = 14) or (Original_Start = 14) and (Zwischenstation = 8) or
       (Original_Start = 9) and (Zwischenstation = 14) or (Original_Start = 14) and (Zwischenstation = 9) or
       (Original_Start = 9) and (Zwischenstation = 15) or (Original_Start = 15) and (Zwischenstation = 9) or
       (Original_Start = 10) and (Zwischenstation = 11) or (Original_Start = 11) and (Zwischenstation = 10) or
       (Original_Start = 11) and (Zwischenstation = 6) or (Original_Start = 6) and (Zwischenstation = 11) or
       (Original_Start = 12) and (Zwischenstation = 13) or (Original_Start = 13) and (Zwischenstation = 12) or
       (Original_Start = 13) and (Zwischenstation = 14) or (Original_Start = 14) and (Zwischenstation = 13) or
       (Original_Start = 14) and (Zwischenstation = 16) or (Original_Start = 16) and (Zwischenstation = 14) or
       (Original_Start = 15) and (Zwischenstation = 16) or (Original_Start = 16) and (Zwischenstation = 15) or
       (Original_Start = 15) and (Zwischenstation = 17) or (Original_Start = 17) and (Zwischenstation = 15) or
       (Original_Start = 15) and (Zwischenstation = 9) or (Original_Start = 9) and (Zwischenstation = 15) or
       (Original_Start = 16) and (Zwischenstation = 17) or (Original_Start = 17) and (Zwischenstation = 16) then
    begin
      Kosten1 := ZWISCHENSTATIONPREIS;
    end
    // Grüne Strecken (Schnellverbindungen)
    else if (Original_Start = 3) and (Zwischenstation = 5) or (Original_Start = 5) and (Zwischenstation = 3) or
            (Original_Start = 4) and (Zwischenstation = 8) or (Original_Start = 8) and (Zwischenstation = 4) or
            (Original_Start = 10) and (Zwischenstation = 15) or (Original_Start = 15) and (Zwischenstation = 10) or
            (Original_Start = 14) and (Zwischenstation = 15) or (Original_Start = 15) and (Zwischenstation = 14) then
    begin
      Kosten1 := SCHNELLVERBINDUNGPREIS;
    end;
    
    // Prüfe zweite Teilstrecke: Zwischenstation -> Original_Ziel
    Kosten2 := 0;
    // Gelbe Strecken
    if (Zwischenstation = 1) and (Original_Ziel = 3) or (Zwischenstation = 3) and (Original_Ziel = 1) or
       (Zwischenstation = 2) and (Original_Ziel = 3) or (Zwischenstation = 3) and (Original_Ziel = 2) or
       (Zwischenstation = 2) and (Original_Ziel = 5) or (Zwischenstation = 5) and (Original_Ziel = 2) or
       (Zwischenstation = 3) and (Original_Ziel = 4) or (Zwischenstation = 4) and (Original_Ziel = 3) or
       (Zwischenstation = 3) and (Original_Ziel = 6) or (Zwischenstation = 6) and (Original_Ziel = 3) or
       (Zwischenstation = 4) and (Original_Ziel = 6) or (Zwischenstation = 6) and (Original_Ziel = 4) or
       (Zwischenstation = 5) and (Original_Ziel = 11) or (Zwischenstation = 11) and (Original_Ziel = 5) or
       (Zwischenstation = 6) and (Original_Ziel = 7) or (Zwischenstation = 7) and (Original_Ziel = 6) or
       (Zwischenstation = 6) and (Original_Ziel = 9) or (Zwischenstation = 9) and (Original_Ziel = 6) or
       (Zwischenstation = 7) and (Original_Ziel = 10) or (Zwischenstation = 10) and (Original_Ziel = 7) or
       (Zwischenstation = 8) and (Original_Ziel = 9) or (Zwischenstation = 9) and (Original_Ziel = 8) or
       (Zwischenstation = 8) and (Original_Ziel = 12) or (Zwischenstation = 12) and (Original_Ziel = 8) or
       (Zwischenstation = 8) and (Original_Ziel = 14) or (Zwischenstation = 14) and (Original_Ziel = 8) or
       (Zwischenstation = 9) and (Original_Ziel = 14) or (Zwischenstation = 14) and (Original_Ziel = 9) or
       (Zwischenstation = 9) and (Original_Ziel = 15) or (Zwischenstation = 15) and (Original_Ziel = 9) or
       (Zwischenstation = 10) and (Original_Ziel = 11) or (Zwischenstation = 11) and (Original_Ziel = 10) or
       (Zwischenstation = 11) and (Original_Ziel = 6) or (Zwischenstation = 6) and (Original_Ziel = 11) or
       (Zwischenstation = 12) and (Original_Ziel = 13) or (Zwischenstation = 13) and (Original_Ziel = 12) or
       (Zwischenstation = 13) and (Original_Ziel = 14) or (Zwischenstation = 14) and (Original_Ziel = 13) or
       (Zwischenstation = 14) and (Original_Ziel = 16) or (Zwischenstation = 16) and (Original_Ziel = 14) or
       (Zwischenstation = 15) and (Original_Ziel = 16) or (Zwischenstation = 16) and (Original_Ziel = 15) or
       (Zwischenstation = 15) and (Original_Ziel = 17) or (Zwischenstation = 17) and (Original_Ziel = 15) or
       (Zwischenstation = 15) and (Original_Ziel = 9) or (Zwischenstation = 9) and (Original_Ziel = 15) or
       (Zwischenstation = 16) and (Original_Ziel = 17) or (Zwischenstation = 17) and (Original_Ziel = 16) then
    begin
      Kosten2 := ZWISCHENSTATIONPREIS;
    end
    // Grüne Strecken (Schnellverbindungen)
    else if (Zwischenstation = 3) and (Original_Ziel = 5) or (Zwischenstation = 5) and (Original_Ziel = 3) or
            (Zwischenstation = 4) and (Original_Ziel = 8) or (Zwischenstation = 8) and (Original_Ziel = 4) or
            (Zwischenstation = 10) and (Original_Ziel = 15) or (Zwischenstation = 15) and (Original_Ziel = 10) or
            (Zwischenstation = 14) and (Original_Ziel = 15) or (Zwischenstation = 15) and (Original_Ziel = 14) then
    begin
      Kosten2 := SCHNELLVERBINDUNGPREIS;
    end;
    
    // Überprüfen, ob beide Teilstrecken vorhanden sind
    if (Kosten1 = 0) or (Kosten2 = 0) then
      KostenInsgesamt := 0
    else
      KostenInsgesamt := Kosten1 + Kosten2;
  end;

  // Ausgabe der Reiseinformationen
  Writeln('Ihre Reiseroute:');
  
  Write('Startbahnhof: ');
  case Original_Start of
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
  case Original_Ziel of
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
