program aufgabe3Perfekt;
{$R+,Q+,X-}
uses
  SysUtils;

var
  Startbahnhof, Zielbahnhof, Zwischenstation: Byte;
  Kosten: Integer;
  DirektGefunden: Boolean;

const
  ZWISCHENSTATIONPREIS = 70;
  SCHNELLVERBINDUNGPREIS = 100;

begin
  Writeln('Geben Sie den Startbahnhof ein (1-17):');
  Readln(Startbahnhof);
  Writeln('Geben Sie den Zielbahnhof ein (1-17):');
  Readln(Zielbahnhof);

  if Startbahnhof = Zielbahnhof then
  begin
    Writeln('Start- und Zielbahnhof dürfen nicht gleich sein.');
    Halt;
  end;

  Kosten := 0;
  DirektGefunden := False;

  { Direkte Verbindung prüfen (Gelb = 70 €, Grün = 100 €) }
  if ((Startbahnhof = 1) and (Zielbahnhof = 3)) or ((Startbahnhof = 3) and (Zielbahnhof = 1)) or
     ((Startbahnhof = 2) and (Zielbahnhof = 3)) or ((Startbahnhof = 3) and (Zielbahnhof = 2)) or
     ((Startbahnhof = 2) and (Zielbahnhof = 5)) or ((Startbahnhof = 5) and (Zielbahnhof = 2)) or
     ((Startbahnhof = 3) and (Zielbahnhof = 4)) or ((Startbahnhof = 4) and (Zielbahnhof = 3)) or
     ((Startbahnhof = 3) and (Zielbahnhof = 6)) or ((Startbahnhof = 6) and (Zielbahnhof = 3)) or
     ((Startbahnhof = 4) and (Zielbahnhof = 6)) or ((Startbahnhof = 6) and (Zielbahnhof = 4)) or
     ((Startbahnhof = 5) and (Zielbahnhof = 7)) or ((Startbahnhof = 7) and (Zielbahnhof = 5)) or
     ((Startbahnhof = 6) and (Zielbahnhof = 7)) or ((Startbahnhof = 7) and (Zielbahnhof = 6)) or
     ((Startbahnhof = 7) and (Zielbahnhof = 10)) or ((Startbahnhof = 10) and (Zielbahnhof = 7)) or
     ((Startbahnhof = 8) and (Zielbahnhof = 9)) or ((Startbahnhof = 9) and (Zielbahnhof = 8)) or
     ((Startbahnhof = 8) and (Zielbahnhof = 12)) or ((Startbahnhof = 12) and (Zielbahnhof = 8)) or
     ((Startbahnhof = 9) and (Zielbahnhof = 15)) or ((Startbahnhof = 15) and (Zielbahnhof = 9)) or
     ((Startbahnhof = 10) and (Zielbahnhof = 11)) or ((Startbahnhof = 11) and (Zielbahnhof = 10)) or
     ((Startbahnhof = 12) and (Zielbahnhof = 13)) or ((Startbahnhof = 13) and (Zielbahnhof = 12)) or
     ((Startbahnhof = 13) and (Zielbahnhof = 14)) or ((Startbahnhof = 14) and (Zielbahnhof = 13)) or
     ((Startbahnhof = 14) and (Zielbahnhof = 16)) or ((Startbahnhof = 16) and (Zielbahnhof = 14)) or
     ((Startbahnhof = 15) and (Zielbahnhof = 16)) or ((Startbahnhof = 16) and (Zielbahnhof = 15)) or
     ((Startbahnhof = 15) and (Zielbahnhof = 17)) or ((Startbahnhof = 17) and (Zielbahnhof = 15)) or
     ((Startbahnhof = 16) and (Zielbahnhof = 17)) or ((Startbahnhof = 17) and (Zielbahnhof = 16)) then
  begin
    Kosten := ZWISCHENSTATIONPREIS;
    DirektGefunden := True;
  end
  else if ((Startbahnhof = 3) and (Zielbahnhof = 5)) or ((Startbahnhof = 5) and (Zielbahnhof = 3)) or
          ((Startbahnhof = 4) and (Zielbahnhof = 8)) or ((Startbahnhof = 8) and (Zielbahnhof = 4)) or
          ((Startbahnhof = 6) and (Zielbahnhof = 8)) or ((Startbahnhof = 8) and (Zielbahnhof = 6)) or
          ((Startbahnhof = 9) and (Zielbahnhof = 15)) or ((Startbahnhof = 15) and (Zielbahnhof = 9)) or
          ((Startbahnhof = 14) and (Zielbahnhof = 15)) or ((Startbahnhof = 15) and (Zielbahnhof = 14)) then
  begin
    Kosten := SCHNELLVERBINDUNGPREIS;
    DirektGefunden := True;
  end;

  if DirektGefunden then
  begin
    Writeln('Gesamtkosten: ', Kosten, ' Euro');
    Halt;
  end;

  Writeln('Keine direkte Verbindung. Bitte eine Zwischenstation eingeben (1-17):');
  Readln(Zwischenstation);

  if (Zwischenstation = Startbahnhof) or (Zwischenstation = Zielbahnhof) then
  begin
    Writeln('Zwischenstation darf nicht Start oder Ziel sein.');
    Halt;
  end;

  DirektGefunden := False;

  { Start -> Zwischenstation prüfen }
  if ((Startbahnhof = 1) and (Zwischenstation = 3)) or ((Startbahnhof = 3) and (Zwischenstation = 1)) or
     ((Startbahnhof = 2) and (Zwischenstation = 3)) or ((Startbahnhof = 3) and (Zwischenstation = 2)) or
     ((Startbahnhof = 2) and (Zwischenstation = 5)) or ((Startbahnhof = 5) and (Zwischenstation = 2)) or
     ((Startbahnhof = 3) and (Zwischenstation = 4)) or ((Startbahnhof = 4) and (Zwischenstation = 3)) or
     ((Startbahnhof = 3) and (Zwischenstation = 6)) or ((Startbahnhof = 6) and (Zwischenstation = 3)) or
     ((Startbahnhof = 4) and (Zwischenstation = 6)) or ((Startbahnhof = 6) and (Zwischenstation = 4)) or
     ((Startbahnhof = 5) and (Zwischenstation = 7)) or ((Startbahnhof = 7) and (Zwischenstation = 5)) or
     ((Startbahnhof = 6) and (Zwischenstation = 7)) or ((Startbahnhof = 7) and (Zwischenstation = 6)) or
     ((Startbahnhof = 7) and (Zwischenstation = 10)) or ((Startbahnhof = 10) and (Zwischenstation = 7)) or
     ((Startbahnhof = 8) and (Zwischenstation = 9)) or ((Startbahnhof = 9) and (Zwischenstation = 8)) or
     ((Startbahnhof = 8) and (Zwischenstation = 12)) or ((Startbahnhof = 12) and (Zwischenstation = 8)) or
     ((Startbahnhof = 9) and (Zwischenstation = 15)) or ((Startbahnhof = 15) and (Zwischenstation = 9)) or
     ((Startbahnhof = 10) and (Zwischenstation = 11)) or ((Startbahnhof = 11) and (Zwischenstation = 10)) or
     ((Startbahnhof = 12) and (Zwischenstation = 13)) or ((Startbahnhof = 13) and (Zwischenstation = 12)) or
     ((Startbahnhof = 13) and (Zwischenstation = 14)) or ((Startbahnhof = 14) and (Zwischenstation = 13)) or
     ((Startbahnhof = 14) and (Zwischenstation = 16)) or ((Startbahnhof = 16) and (Zwischenstation = 14)) or
     ((Startbahnhof = 15) and (Zwischenstation = 16)) or ((Startbahnhof = 16) and (Zwischenstation = 15)) or
     ((Startbahnhof = 15) and (Zwischenstation = 17)) or ((Startbahnhof = 17) and (Zwischenstation = 15)) or
     ((Startbahnhof = 16) and (Zwischenstation = 17)) or ((Startbahnhof = 17) and (Zwischenstation = 16)) then
  begin
    Kosten := ZWISCHENSTATIONPREIS;
    DirektGefunden := True;
  end
  else if ((Startbahnhof = 3) and (Zwischenstation = 5)) or ((Startbahnhof = 5) and (Zwischenstation = 3)) or
          ((Startbahnhof = 4) and (Zwischenstation = 8)) or ((Startbahnhof = 8) and (Zwischenstation = 4)) or
          ((Startbahnhof = 6) and (Zwischenstation = 8)) or ((Startbahnhof = 8) and (Zwischenstation = 6)) or
          ((Startbahnhof = 9) and (Zwischenstation = 15)) or ((Startbahnhof = 15) and (Zwischenstation = 9)) or
          ((Startbahnhof = 14) and (Zwischenstation = 15)) or ((Startbahnhof = 15) and (Zwischenstation = 14)) then
  begin
    Kosten := SCHNELLVERBINDUNGPREIS;
    DirektGefunden := True;
  end;

  if not DirektGefunden then
  begin
    Writeln('Keine Verbindung vom Start zur Zwischenstation.');
    Halt;
  end;

  DirektGefunden := False;

  { Zwischenstation -> Zielbahnhof prüfen }
  if ((Zwischenstation = 1) and (Zielbahnhof = 3)) or ((Zwischenstation = 3) and (Zielbahnhof = 1)) or
     ((Zwischenstation = 2) and (Zielbahnhof = 3)) or ((Zwischenstation = 3) and (Zielbahnhof = 2)) or
     ((Zwischenstation = 2) and (Zielbahnhof = 5)) or ((Zwischenstation = 5) and (Zielbahnhof = 2)) or
     ((Zwischenstation = 3) and (Zielbahnhof = 4)) or ((Zwischenstation = 4) and (Zielbahnhof = 3)) or
     ((Zwischenstation = 3) and (Zielbahnhof = 6)) or ((Zwischenstation = 6) and (Zielbahnhof = 3)) or
     ((Zwischenstation = 4) and (Zielbahnhof = 6)) or ((Zwischenstation = 6) and (Zielbahnhof = 4)) or
     ((Zwischenstation = 5) and (Zielbahnhof = 7)) or ((Zwischenstation = 7) and (Zielbahnhof = 5)) or
     ((Zwischenstation = 6) and (Zielbahnhof = 7)) or ((Zwischenstation = 7) and (Zielbahnhof = 6)) or
     ((Zwischenstation = 7) and (Zielbahnhof = 10)) or ((Zwischenstation = 10) and (Zielbahnhof = 7)) or
     ((Zwischenstation = 8) and (Zielbahnhof = 9)) or ((Zwischenstation = 9) and (Zielbahnhof = 8)) or
     ((Zwischenstation = 8) and (Zielbahnhof = 12)) or ((Zwischenstation = 12) and (Zielbahnhof = 8)) or
     ((Zwischenstation = 9) and (Zielbahnhof = 15)) or ((Zwischenstation = 15) and (Zielbahnhof = 9)) or
     ((Zwischenstation = 10) and (Zielbahnhof = 11)) or ((Zwischenstation = 11) and (Zielbahnhof = 10)) or
     ((Zwischenstation = 12) and (Zielbahnhof = 13)) or ((Zwischenstation = 13) and (Zielbahnhof = 12)) or
     ((Zwischenstation = 13) and (Zielbahnhof = 14)) or ((Zwischenstation = 14) and (Zielbahnhof = 13)) or
     ((Zwischenstation = 14) and (Zielbahnhof = 16)) or ((Zwischenstation = 16) and (Zielbahnhof = 14)) or
     ((Zwischenstation = 15) and (Zielbahnhof = 16)) or ((Zwischenstation = 16) and (Zielbahnhof = 15)) or
     ((Zwischenstation = 15) and (Zielbahnhof = 17)) or ((Zwischenstation = 17) and (Zielbahnhof = 15)) or
     ((Zwischenstation = 16) and (Zielbahnhof = 17)) or ((Zwischenstation = 17) and (Zielbahnhof = 16)) then
  begin
    Kosten := Kosten + ZWISCHENSTATIONPREIS;
    DirektGefunden := True;
  end
  else if ((Zwischenstation = 3) and (Zielbahnhof = 5)) or ((Zwischenstation = 5) and (Zielbahnhof = 3)) or
          ((Zwischenstation = 4) and (Zielbahnhof = 8)) or ((Zwischenstation = 8) and (Zielbahnhof = 4)) or
          ((Zwischenstation = 6) and (Zielbahnhof = 8)) or ((Zwischenstation = 8) and (Zielbahnhof = 6)) or
          ((Zwischenstation = 9) and (Zielbahnhof = 15)) or ((Zwischenstation = 15) and (Zielbahnhof = 9)) or
          ((Zwischenstation = 14) and (Zielbahnhof = 15)) or ((Zwischenstation = 15) and (Zielbahnhof = 14)) then
  begin
    Kosten := Kosten + SCHNELLVERBINDUNGPREIS;
    DirektGefunden := True;
  end;

  if not DirektGefunden then
  begin
    Writeln('Keine Verbindung von Zwischenstation zum Zielbahnhof.');
    Halt;
  end;

  Writeln('Gesamtkosten: ', Kosten, ' Euro');
end.


end.
