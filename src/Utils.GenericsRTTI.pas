unit Utils.GenericsRTTI;

interface

uses
  System.Generics.Collections;

type
  TUtilsGenericsRTTI<T: class, constructor> = class(TEnumerable<T>)
    class procedure Clone(AFromList, AToList: TObjectList<T>);
  end;

implementation

uses
  Rtti;

{ TUtilsGenericsRTTI<T> }

class procedure TUtilsGenericsRTTI<T>.Clone(AFromList, AToList: TObjectList<T>);
var
  Fields: TRttiField;
  AuxList: T;
begin

  for AuxList in AFromList do
  begin
    AToList.Add(T.Create);
    for Fields in TRttiContext.Create.GetType(AuxList.ClassType).GetFields do
    begin
      Fields.SetValue(Pointer(AToList.Last), Fields.GetValue(Pointer(AuxList)));
    end;

  end;

end;

end.
