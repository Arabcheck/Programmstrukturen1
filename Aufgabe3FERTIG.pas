program aufgabe3WIP;
{$R+,Q+,X-}
uses
  SysUtils, Math;

var
  Startbahnhof: Byte;
  Zielbahnhof: Byte;
  Zwischenstation: Byte;
  Kosten1: Integer;
  Kosten2: Integer;
  KostenInsgesamt: Integer;
  Benachbart1: Boolean;
  Schnellverbindung1: Boolean;
  Benachbart2: Boolean;
  Schnellverbindung2: Boolean;
  DirektVerbindung: Boolean;

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
  Benachbart1 := False;
  Schnellverbindung1 := False;
  Benachbart2 := False;
  Schnellverbindung2 := False;
  DirektVerbindung := False;

  Writeln('Geben sie an von welchem Bahnhof sie starten');
  Readln(Startbahnhof);
  Writeln('Geben sie an zu welchen Bahnhof sie reisen möchten');
  Readln(Zielbahnhof);

  if Startbahnhof = Zielbahnhof then
  begin
    Writeln('Der Startbahnhof ist gleich dem Zielbahnhof!');
  end
  else
  begin
    // Prüfen, ob direkte Verbindung existiert
    if ((Startbahnhof = 1) and (Zielbahnhof = 3)) or
       ((Startbahnhof = 3) and (Zielbahnhof = 1)) or
       ((Startbahnhof = 2) and (Zielbahnhof = 3)) or
       ((Startbahnhof = 3) and (Zielbahnhof = 2)) or
       ((Startbahnhof = 2) and (Zielbahnhof = 5)) or
       ((Startbahnhof = 5) and (Zielbahnhof = 2)) or
       ((Startbahnhof = 3) and (Zielbahnhof = 4)) or
       ((Startbahnhof = 4) and (Zielbahnhof = 3)) or
       ((Startbahnhof = 4) and (Zielbahnhof = 6)) or
       ((Startbahnhof = 6) and (Zielbahnhof = 4)) or
       ((Startbahnhof = 5) and (Zielbahnhof = 7)) or
       ((Startbahnhof = 7) and (Zielbahnhof = 5)) or
       ((Startbahnhof = 5) and (Zielbahnhof = 10)) or
       ((Startbahnhof = 10) and (Zielbahnhof = 5)) or
       ((Startbahnhof = 6) and (Zielbahnhof = 7)) or
       ((Startbahnhof = 7) and (Zielbahnhof = 6)) or
       ((Startbahnhof = 6) and (Zielbahnhof = 9)) or
       ((Startbahnhof = 9) and (Zielbahnhof = 6)) or
       ((Startbahnhof = 7) and (Zielbahnhof = 10)) or
       ((Startbahnhof = 10) and (Zielbahnhof = 7)) or
       ((Startbahnhof = 8) and (Zielbahnhof = 9)) or
       ((Startbahnhof = 9) and (Zielbahnhof = 8)) or
       ((Startbahnhof = 8) and (Zielbahnhof = 12)) or
       ((Startbahnhof = 12) and (Zielbahnhof = 8)) or
       ((Startbahnhof = 9) and (Zielbahnhof = 10)) or
       ((Startbahnhof = 10) and (Zielbahnhof = 9)) or
       ((Startbahnhof = 9) and (Zielbahnhof = 14)) or
       ((Startbahnhof = 14) and (Zielbahnhof = 9)) or
       ((Startbahnhof = 10) and (Zielbahnhof = 11)) or
       ((Startbahnhof = 11) and (Zielbahnhof = 10)) or
       ((Startbahnhof = 12) and (Zielbahnhof = 13)) or
       ((Startbahnhof = 13) and (Zielbahnhof = 12)) or
       ((Startbahnhof = 12) and (Zielbahnhof = 14)) or
       ((Startbahnhof = 14) and (Zielbahnhof = 12)) or
       ((Startbahnhof = 13) and (Zielbahnhof = 14)) or
       ((Startbahnhof = 14) and (Zielbahnhof = 13)) or
       ((Startbahnhof = 14) and (Zielbahnhof = 16)) or
       ((Startbahnhof = 16) and (Zielbahnhof = 14)) or
       ((Startbahnhof = 15) and (Zielbahnhof = 16)) or
       ((Startbahnhof = 16) and (Zielbahnhof = 15)) or
       ((Startbahnhof = 15) and (Zielbahnhof = 17)) or
       ((Startbahnhof = 17) and (Zielbahnhof = 15)) or
       ((Startbahnhof = 16) and (Zielbahnhof = 17)) or
       ((Startbahnhof = 17) and (Zielbahnhof = 16))
    then
    begin
      DirektVerbindung := True;
      Kosten1 := ZWISCHENSTATIONPREIS;
    end
    else if ((Startbahnhof = 3) and (Zielbahnhof = 5)) or
            ((Startbahnhof = 5) and (Zielbahnhof = 3)) or
            ((Startbahnhof = 4) and (Zielbahnhof = 8)) or
            ((Startbahnhof = 8) and (Zielbahnhof = 4)) or
            ((Startbahnhof = 10) and (Zielbahnhof = 15)) or
            ((Startbahnhof = 15) and (Zielbahnhof = 10)) or
            ((Startbahnhof = 14) and (Zielbahnhof = 15)) or
            ((Startbahnhof = 15) and (Zielbahnhof = 14)) then
    begin
      DirektVerbindung := True;
      Kosten1 := SCHNELLVERBINDUNGPREIS;
    end
    else
    begin
      DirektVerbindung := False;
    end;

    // Wenn keine direkte Verbindung, nach Zwischenstation fragen
    if not DirektVerbindung then
    begin
      Writeln('Keine direkte Verbindung möglich. Geben sie eine Zwischenstation ein:');
      Readln(Zwischenstation);

      // Teilstrecke 1: Startbahnhof -> Zwischenstation
      if ((Startbahnhof = 1) and (Zwischenstation = 3)) or
         ((Startbahnhof = 3) and (Zwischenstation = 1)) or
         ((Startbahnhof = 2) and (Zwischenstation = 3)) or
         ((Startbahnhof = 3) and (Zwischenstation = 2)) or
         ((Startbahnhof = 2) and (Zwischenstation = 5)) or
         ((Startbahnhof = 5) and (Zwischenstation = 2)) or
         ((Startbahnhof = 3) and (Zwischenstation = 4)) or
         ((Startbahnhof = 4) and (Zwischenstation = 3)) or
         ((Startbahnhof = 4) and (Zwischenstation = 6)) or
         ((Startbahnhof = 6) and (Zwischenstation = 4)) or
         ((Startbahnhof = 5) and (Zwischenstation = 7)) or
         ((Startbahnhof = 7) and (Zwischenstation = 5)) or
         ((Startbahnhof = 5) and (Zwischenstation = 10)) or
         ((Startbahnhof = 10) and (Zwischenstation = 5)) or
         ((Startbahnhof = 6) and (Zwischenstation = 7)) or
         ((Startbahnhof = 7) and (Zwischenstation = 6)) or
         ((Startbahnhof = 6) and (Zwischenstation = 9)) or
         ((Startbahnhof = 9) and (Zwischenstation = 6)) or
         ((Startbahnhof = 7) and (Zwischenstation = 10)) or
         ((Startbahnhof = 10) and (Zwischenstation = 7)) or
         ((Startbahnhof = 8) and (Zwischenstation = 9)) or
         ((Startbahnhof = 9) and (Zwischenstation = 8)) or
         ((Startbahnhof = 8) and (Zwischenstation = 12)) or
         ((Startbahnhof = 12) and (Zwischenstation = 8)) or
         ((Startbahnhof = 9) and (Zwischenstation = 10)) or
         ((Startbahnhof = 10) and (Zwischenstation = 9)) or
         ((Startbahnhof = 9) and (Zwischenstation = 14)) or
         ((Startbahnhof = 14) and (Zwischenstation = 9)) or
         ((Startbahnhof = 10) and (Zwischenstation = 11)) or
         ((Startbahnhof = 11) and (Zwischenstation = 10)) or
         ((Startbahnhof = 12) and (Zwischenstation = 13)) or
         ((Startbahnhof = 13) and (Zwischenstation = 12)) or
         ((Startbahnhof = 12) and (Zwischenstation = 14)) or
         ((Startbahnhof = 14) and (Zwischenstation = 12)) or
         ((Startbahnhof = 13) and (Zwischenstation = 14)) or
         ((Startbahnhof = 14) and (Zwischenstation = 13)) or
         ((Startbahnhof = 14) and (Zwischenstation = 16)) or
         ((Startbahnhof = 16) and (Zwischenstation = 14)) or
         ((Startbahnhof = 15) and (Zwischenstation = 16)) or
         ((Startbahnhof = 16) and (Zwischenstation = 15)) or
         ((Startbahnhof = 15) and (Zwischenstation = 17)) or
         ((Startbahnhof = 17) and (Zwischenstation = 15)) or
         ((Startbahnhof = 16) and (Zwischenstation = 17)) or
         ((Startbahnhof = 17) and (Zwischenstation = 16))
      then
      begin
        Kosten1 := ZWISCHENSTATIONPREIS;
      end
      else if ((Startbahnhof = 3) and (Zwischenstation = 5)) or
              ((Startbahnhof = 5) and (Zwischenstation = 3)) or
              ((Startbahnhof = 4) and (Zwischenstation = 8)) or
              ((Startbahnhof = 8) and (Zwischenstation = 4)) or
              ((Startbahnhof = 10) and (Zwischenstation = 15)) or
              ((Startbahnhof = 15) and (Zwischenstation = 10)) or
              ((Startbahnhof = 14) and (Zwischenstation = 15)) or
              ((Startbahnhof = 15) and (Zwischenstation = 14)) then
      begin
        Kosten1 := SCHNELLVERBINDUNGPREIS;
      end
      else
      begin
        Kosten1 := 0;
      end;

      // Teilstrecke 2: Zwischenstation -> Zielbahnhof
      if ((Zwischenstation = 1) and (Zielbahnhof = 3)) or
         ((Zwischenstation = 3) and (Zielbahnhof = 1)) or
         ((Zwischenstation = 2) and (Zielbahnhof = 3)) or
         ((Zwischenstation = 3) and (Zielbahnhof = 2)) or
         ((Zwischenstation = 2) and (Zielbahnhof = 5)) or
         ((Zwischenstation = 5) and (Zielbahnhof = 2)) or
         ((Zwischenstation = 3) and (Zielbahnhof = 4)) or
         ((Zwischenstation = 4) and (Zielbahnhof = 3)) or
         ((Zwischenstation = 4) and (Zielbahnhof = 6)) or
         ((Zwischenstation = 6) and (Zielbahnhof = 4)) or
         ((Zwischenstation = 5) and (Zielbahnhof = 7)) or
         ((Zwischenstation = 7) and (Zielbahnhof = 5)) or
         ((Zwischenstation = 5) and (Zielbahnhof = 10)) or
         ((Zwischenstation = 10) and (Zielbahnhof = 5)) or
         ((Zwischenstation = 6) and (Zielbahnhof = 7)) or
         ((Zwischenstation = 7) and (Zielbahnhof = 6)) or
         ((Zwischenstation = 6) and (Zielbahnhof = 9)) or
         ((Zwischenstation = 9) and (Zielbahnhof = 6)) or
         ((Zwischenstation = 7) and (Zielbahnhof = 10)) or
         ((Zwischenstation = 10) and (Zielbahnhof = 7)) or
         ((Zwischenstation = 8) and (Zielbahnhof = 9)) or
         ((Zwischenstation = 9) and (Zielbahnhof = 8)) or
         ((Zwischenstation = 8) and (Zielbahnhof = 12)) or
         ((Zwischenstation = 12) and (Zielbahnhof = 8)) or
         ((Zwischenstation = 9) and (Zielbahnhof = 10)) or
         ((Zwischenstation = 10) and (Zielbahnhof = 9)) or
         ((Zwischenstation = 9) and (Zielbahnhof = 14)) or
         ((Zwischenstation = 14) and (Zielbahnhof = 9)) or
         ((Zwischenstation = 10) and (Zielbahnhof = 11)) or
         ((Zwischenstation = 11) and (Zielbahnhof = 10)) or
         ((Zwischenstation = 12) and (Zielbahnhof = 13)) or
         ((Zwischenstation = 13) and (Zielbahnhof = 12)) or
         ((Zwischenstation = 12) and (Zielbahnhof = 14)) or
         ((Zwischenstation = 14) and (Zielbahnhof = 12)) or
         ((Zwischenstation = 13) and (Zielbahnhof = 14)) or
         ((Zwischenstation = 14) and (Zielbahnhof = 13)) or
         ((Zwischenstation = 14) and (Zielbahnhof = 16)) or
         ((Zwischenstation = 16) and (Zielbahnhof = 14)) or
         ((Zwischenstation = 15) and (Zielbahnhof = 16)) or
         ((Zwischenstation = 16) and (Zielbahnhof = 15)) or
         ((Zwischenstation = 15) and (Zielbahnhof = 17)) or
         ((Zwischenstation = 17) and (Zielbahnhof = 15)) or
         ((Zwischenstation = 16) and (Zielbahnhof = 17)) or
         ((Zwischenstation = 17) and (Zielbahnhof = 16))
      then
      begin
        Kosten2 := ZWISCHENSTATIONPREIS;
      end
      else if ((Zwischenstation = 3) and (Zielbahnhof = 5)) or
              ((Zwischenstation = 5) and (Zielbahnhof = 3)) or
              ((Zwischenstation = 4) and (Zielbahnhof = 8)) or
              ((Zwischenstation = 8) and (Zielbahnhof = 4)) or
              ((Zwischenstation = 10) and (Zielbahnhof = 15)) or
              ((Zwischenstation = 15) and (Zielbahnhof = 10)) or
              ((Zwischenstation = 14) and (Zielbahnhof = 15)) or
              ((Zwischenstation = 15) and (Zielbahnhof = 14)) then
      begin
        Kosten2 := SCHNELLVERBINDUNGPREIS;
      end
      else
      begin
        Kosten2 := 0;
      end;

      KostenInsgesamt := Kosten1 + Kosten2;
    end
    else
    begin
      // Direkte Verbindung, keine Zwischenstation nötig
      KostenInsgesamt := Kosten1;
    end;

    // Ausgabe der Reiseinformationen mit Städtenamen
    Writeln('Ihre Reiseroute:');
    
    // Anzeige des Startbahnhofs
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
    
    // Anzeige der Zwischenstation, falls vorhanden
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
    
    // Anzeige des Zielbahnhofs
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
    
    // Ausgabe der Kosten
    if KostenInsgesamt = 0 then
      Writeln('Keine gültige Verbindung gefunden!')
    else
      Writeln('Die Kosten betragen: ', KostenInsgesamt, ' Euro');
  end;



end.
