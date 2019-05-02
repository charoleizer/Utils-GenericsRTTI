program Sample;

uses
  Vcl.Forms,
  clone in 'clone.pas' {Form1},
  Utils.GenericsRTTI in '..\Utils.GenericsRTTI.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
