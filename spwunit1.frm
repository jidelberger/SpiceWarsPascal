object Form1: TForm1
  Left = 240
  Height = 515
  Top = 156
  Width = 639
  BorderStyle = bsSingle
  Caption = 'SpiceWars'
  ClientHeight = 515
  ClientWidth = 639
  OnCreate = FormCreate
  LCLVersion = '7.1'
  object Label1: TLabel
    Left = 42
    Height = 16
    Top = 27
    Width = 55
    Caption = 'Angebot:'
    ParentColor = False
  end
  object Label2: TLabel
    Left = 440
    Height = 16
    Top = 27
    Width = 60
    Caption = 'Laderaum'
    ParentColor = False
  end
  object Label3: TLabel
    Left = 272
    Height = 16
    Top = 27
    Width = 41
    Caption = 'Menge'
    ParentColor = False
  end
  object lstAngebot: TListBox
    Left = 42
    Height = 232
    Top = 48
    Width = 134
    ItemHeight = 0
    OnClick = lstAngebotClick
    TabOrder = 0
  end
  object lstLaderaum: TListBox
    Left = 440
    Height = 232
    Top = 48
    Width = 144
    ItemHeight = 0
    OnClick = lstLaderaumClick
    TabOrder = 1
  end
  object lstPlaces: TListBox
    Left = 42
    Height = 144
    Top = 336
    Width = 134
    ItemHeight = 0
    TabOrder = 2
  end
  object lblStadt: TLabel
    Left = 248
    Height = 16
    Top = 336
    Width = 33
    Caption = 'Stadt'
    ParentColor = False
  end
  object btnKaufen: TButton
    Left = 248
    Height = 25
    Top = 120
    Width = 115
    Caption = 'Kaufen >>>'
    OnClick = btnKaufenClick
    TabOrder = 3
  end
  object edtMenge: TEdit
    Left = 248
    Height = 22
    Top = 61
    Width = 115
    TabOrder = 4
  end
  object btnVerkaufen: TButton
    Left = 248
    Height = 25
    Top = 160
    Width = 115
    Caption = '<<< Verkaufen'
    OnClick = btnVerkaufenClick
    TabOrder = 5
  end
  object btnSegeln: TButton
    Left = 248
    Height = 25
    Top = 360
    Width = 115
    Caption = 'Weitersegeln'
    OnClick = btnSegelnClick
    TabOrder = 6
  end
end
