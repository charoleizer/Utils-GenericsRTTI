object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 187
  ClientWidth = 537
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object btnClone: TButton
    Left = 24
    Top = 56
    Width = 75
    Height = 25
    Caption = 'Clone'
    TabOrder = 1
    TabStop = False
    OnClick = btnCloneClick
  end
  object Memo1: TMemo
    Left = 144
    Top = 24
    Width = 169
    Height = 89
    ReadOnly = True
    TabOrder = 5
  end
  object btnClearMainList: TButton
    Left = 144
    Top = 119
    Width = 97
    Height = 25
    Caption = 'Clear Main List'
    TabOrder = 3
    TabStop = False
    OnClick = btnClearMainListClick
  end
  object Memo2: TMemo
    Left = 328
    Top = 24
    Width = 169
    Height = 89
    ReadOnly = True
    TabOrder = 6
  end
  object btnRefresh: TButton
    Left = 24
    Top = 87
    Width = 75
    Height = 25
    Caption = 'Refresh'
    TabOrder = 2
    TabStop = False
    OnClick = btnRefreshClick
  end
  object btnPopulate: TButton
    Left = 24
    Top = 25
    Width = 75
    Height = 25
    Caption = 'Populate'
    TabOrder = 0
    TabStop = False
    OnClick = btnPopulateClick
  end
  object btnClearClonedList: TButton
    Left = 328
    Top = 119
    Width = 97
    Height = 25
    Caption = 'Clear Cloned List'
    TabOrder = 4
    TabStop = False
    OnClick = btnClearClonedListClick
  end
end
