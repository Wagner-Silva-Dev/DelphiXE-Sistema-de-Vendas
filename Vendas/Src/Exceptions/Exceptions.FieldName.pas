unit Exceptions.FieldName;

interface

uses
SysUtils;

type
  ExceptionsFieldName = class(Exception)
  private
    FFieldName: string;

  public
    constructor Create(const AMessage, AFieldName: string); reintroduce;
    property FieldName: string read FFieldName write FFieldName;
  end;

implementation

{ ExceptionsFieldName }

constructor ExceptionsFieldName.Create(const AMessage, AFieldName: string);
begin
  Self.Message := AMessage;
  FieldName := AFieldName;
end;

end.
