unit clone;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  System.Generics.Collections;

type

  TMyData = class
  public
    checkBox: Boolean;
    id: Integer;
    name: String;
    birthDate: TDate;

  end;

  TMyListOfData = TObjectList<TMyData>;

  TForm1 = class(TForm)
    btnClone: TButton;
    Memo1: TMemo;
    btnClearMainList: TButton;
    Memo2: TMemo;
    btnRefresh: TButton;
    btnPopulate: TButton;
    btnClearClonedList: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure btnPopulateClick(Sender: TObject);
    procedure btnClearMainListClick(Sender: TObject);
    procedure btnClearClonedListClick(Sender: TObject);
    procedure btnCloneClick(Sender: TObject);
  private
    myMainListOfData: TMyListOfData;
    myClonedListOfData: TMyListOfData;

  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
  Utils.GenericsRTTI;

{$R *.dfm}

procedure TForm1.btnRefreshClick(Sender: TObject);
var
  myData: TMyData;
begin
  // Putting data of main list to the memo1
  if assigned(myMainListOfData) then
  begin
    Memo1.Lines.Clear;
    for myData in myMainListOfData do
      Memo1.Lines.Add(IntToStr(myData.id) + ' - ' + myData.name);
  end;

  // Putting data of cloned list to the memo2
  if assigned(myClonedListOfData) then
  begin
    Memo2.Lines.Clear;
    for myData in myClonedListOfData do
      Memo2.Lines.Add(IntToStr(myData.id) + ' - ' + myData.name);
  end;
end;

procedure TForm1.btnClearClonedListClick(Sender: TObject);
begin
  if assigned(myClonedListOfData) then
    myClonedListOfData.Clear
end;

procedure TForm1.btnClearMainListClick(Sender: TObject);
begin
  if assigned(myMainListOfData) then
    myMainListOfData.Clear
end;

procedure TForm1.btnCloneClick(Sender: TObject);
begin
  TUtilsGenericsRTTI<TMyData>.Clone(myMainListOfData, myClonedListOfData);
end;

procedure TForm1.btnPopulateClick(Sender: TObject);
begin

  // Adding first Data
  myMainListOfData.Add(TMyData.Create);
  myMainListOfData.Last.checkBox := True;
  myMainListOfData.Last.id := Random(9999);
  myMainListOfData.Last.name := 'Victor';
  myMainListOfData.Last.birthDate := StrToDate('21/05/1992');

  // Adding second Data
  myMainListOfData.Add(TMyData.Create);
  myMainListOfData.Last.checkBox := False;
  myMainListOfData.Last.id := Random(9999);
  myMainListOfData.Last.name := 'Tadashi';
  myMainListOfData.Last.birthDate := StrToDate('01/01/2000');

end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  ReportMemoryLeaksOnShutdown := True;
  myMainListOfData := TMyListOfData.Create;
  myClonedListOfData := TMyListOfData.Create;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  FreeAndNil(myClonedListOfData);
  FreeAndNil(myMainListOfData);
end;

end.
