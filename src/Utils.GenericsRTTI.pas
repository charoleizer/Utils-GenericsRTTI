unit Utils.GenericsRTTI;

interface

uses
  System.Generics.Collections,
  RTTI;

type
  TUtilsGenericsRTTI<T: class, constructor> = class(TEnumerable<T>)
    class procedure Clone(AFromList, AToList: TObjectList<T>);
  end;

  TUtilsRTTI = class
    class function CreateObjectByClassName(AClassName: String): TValue;
  end;

implementation

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


{ TUtilsRTTI }


class function TUtilsRTTI.CreateObjectByClassName(AClassName: String): TValue;
var
  Tipo: TRttiType;
begin
  Tipo := TRttiContext.Create.FindType(AClassName);
  if Tipo <> nil then
    Result := Tipo.AsInstance.GetMethod('Create').Invoke(Tipo.AsInstance.MetaclassType, []);
end;

end.
