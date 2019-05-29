unit Utils.GenericsRTTI;

interface

uses
  System.Generics.Collections,
  RTTI;

type
  TUtilsGenericsRTTI<T: class, constructor> = class(TEnumerable<T>)
    class procedure Clone(AFromList, AToList: TObjectList<T>);
    class function CreateObjectByClassType: T;
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



class function TUtilsGenericsRTTI<T>.CreateObjectByClassType: T;
var
  ObjectType: TRttiType;
begin
  ObjectType := TRttiContext.Create.GetType(T.ClassInfo);
  if ObjectType <> nil then
    Result := ObjectType.AsInstance.GetMethod('Create').Invoke(ObjectType.AsInstance.MetaclassType, [nil]).AsType<T>;
end;

{ TUtilsRTTI }



class function TUtilsRTTI.CreateObjectByClassName(AClassName: String): TValue;
var
  ObjectType: TRttiType;
begin
  ObjectType := TRttiContext.Create.FindType(AClassName);
  if ObjectType <> nil then
    Result := ObjectType.AsInstance.GetMethod('Create').Invoke(ObjectType.AsInstance.MetaclassType, [nil]);

end;

end.
