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
  RttiContext: TRttiContext;
  RttiType: TRttiType;
  Fields: TRttiField;

  oValue: TValue;
  AuxList: T;
begin

  for AuxList in AFromList do
  begin
    RttiType := RttiContext.GetType(AuxList.ClassType);
    AToList.Add(T.Create);
    for Fields in RttiType.GetFields do
    begin
      oValue := Fields.GetValue(Pointer(AuxList));
      Fields.SetValue(Pointer(AToList.Last), oValue);
    end;
  end;

end;

end.
