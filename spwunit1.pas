unit spwunit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, math;

type

  { TForm1 }

  TForm1 = class(TForm)
    btnKaufen: TButton;
    btnSegeln: TButton;
    btnVerkaufen: TButton;
    edtMenge: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    lblStadt: TLabel;
    lstPlaces: TListBox;
    lstLaderaum: TListBox;
    lstAngebot: TListBox;
    procedure btnKaufenClick(Sender: TObject);
    procedure btnSegelnClick(Sender: TObject);
    procedure btnVerkaufenClick(Sender: TObject);
    procedure DatenAnzeigen();
    procedure FormCreate(Sender: TObject);
    procedure lstAngebotClick(Sender: TObject);
    procedure lstLaderaumClick(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
  Geld : Integer;
  Laderaum: Integer;
  Gewuerze: array [1..5] of String;
  aktKosten: array [1..5] of Integer;
  eigeneLadung: array [1..5] of Integer;
  kostenMin : array [1..5] of Integer;
  kostenMax : array [1..5] of Integer;

implementation

{$R *.frm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin
  randomize();
  Geld := 1000;
  Laderaum := 100;
  //Gewürze
  Gewuerze[1] := 'Pfeffer';
  Gewuerze[2] := 'Muskat';
  Gewuerze[3] := 'Nelken';
  Gewuerze[4] := 'Vanille';
  Gewuerze[5] := 'Zimt';
  // Kosten
  aktKosten[1] := 100;
  aktKosten[2] := 30;
  aktKosten[3] := 50;
  aktKosten[4] := 20;
  aktKosten[5] := 10;
  //Ladung
  eigeneLadung[1] := 0;
  eigeneLadung[2] := 0;
  eigeneLadung[3] := 0;
  eigeneLadung[4] := 0;
  eigeneLadung[5] := 0;
  //Handelsziele
  lstPlaces.Items.Append('Venedig');
  lstPlaces.Items.Append('Ravenna');
  lstPlaces.Items.Append('Bari');
  lstPlaces.Items.Append('Palermo');
  lstPlaces.Items.Append('Ganua');
  lblStadt.Caption:= 'Venedig';
  Datenanzeigen();
  //Mindeskosten
  kostenMin[1] := 50;
  kostenMin[2] := 5;
  kostenMin[3] := 20;
  kostenMin[4] := 100;
  kostenMin[5] := 60;
  //Maximalkosten
  kostenMax[1] := 150;
  kostenMax[2] := 85;
  kostenMax[3] := 180;
  kostenMax[4] := 470;
  kostenMax[5] := 300;
end;

procedure TForm1.lstAngebotClick(Sender: TObject);
var
  index : Integer;
begin
  index := lstAngebot.ItemIndex+1;
  edtMenge.Text := IntToStr(floor(Geld/aktKosten[index]));
end;

procedure TForm1.lstLaderaumClick(Sender: TObject);
var
  index : Integer;
begin
  index := lstLaderaum.ItemIndex + 1;
  edtMenge.Text := IntToStr(eigeneLadung[index]);
end;

Procedure TForm1.Datenanzeigen();
var
  i : Integer;
begin
  Form1.lstAngebot.Clear;
  Form1.lstLaderaum.Clear;
  For i := 1 to 5 do
  begin
    Form1.lstAngebot.Items.Append(Gewuerze[i] + ' ' + IntToStr(aktKosten[i]));
    Form1.lstLaderaum.Items.Append(Gewuerze[i] + ' ' + IntToStr(eigeneLadung[i]));
  end;
  Form1.lstLaderaum.Items.Append('--------');
  Form1.lstLaderaum.Items.Append('Geld: ' + IntToStr(Geld));
  edtMenge.Text := '';
end;

procedure TForm1.btnKaufenClick(Sender: TObject);
var
  Anzahl : Integer;
  Nummer : Integer;
begin
  Anzahl := StrToInt(edtMenge.Text);
  Nummer := lstAngebot.ItemIndex+1;
  if (Anzahl * aktKosten[Nummer]) <= Geld then
  begin
    Geld := Geld - Anzahl * aktKosten[Nummer];
    eigeneLadung[Nummer] := eigeneLadung[Nummer] + Anzahl;
  end;
  Datenanzeigen();
end;

procedure TForm1.btnSegelnClick(Sender: TObject);
var
  i : Integer;
begin
  lblStadt.Caption := lstPlaces.GetSelectedText;
  for i := 1 to 5 do
    aktKosten[i] := kostenMin[i] + random(kostenMax[i] - kostenMin[i]);
  Datenanzeigen();
end;

procedure TForm1.btnVerkaufenClick(Sender: TObject);
var
  Anzahl : Integer;
  Nummer : Integer;
begin
  Anzahl := StrToInt(edtMenge.Text);
  Nummer := lstLaderaum.ItemIndex+1;
  if Anzahl <= eigeneLadung[Nummer] then
  begin
    Geld := Geld + Anzahl * aktKosten[Nummer];
    eigeneLadung[Nummer] := eigeneLadung[Nummer] - Anzahl;
  end;
  Datenanzeigen();
end;


end.

