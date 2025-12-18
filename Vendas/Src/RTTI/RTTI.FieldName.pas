unit RTTI.FieldName;

interface

uses
  SysUtils;

type
  FieldName = class(TCustomAttribute)

    private
    FName: string;

  public
    constructor create(const AName :string);
    property Name: string read FName write FName;
    end;
implementation

{ FieldName }

constructor FieldName.create(const AName: string);
begin
  FName := AName;
end;

end.
