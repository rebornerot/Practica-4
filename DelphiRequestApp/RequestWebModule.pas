unit RequestWebModule;

interface

uses
  System.SysUtils, System.Classes, Web.HTTPApp, Data.DB, ADODB;

type
  TWebModule1 = class(TWebModule)
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    procedure WebModule1DefaultAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure WebModule1SubmitAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
  end;

var
  WebModuleClass: TComponentClass = TWebModule1;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TWebModule1.WebModule1DefaultAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
var
  html: string;
begin
  Response.ContentType := 'text/html; charset=utf-8';

  ADOConnection1.Connected := True;
  ADOQuery1.SQL.Text := 'SELECT ID, UserName, RequestText, CreatedAt FROM Requests ORDER BY ID DESC';
  ADOQuery1.Open;

  html := '<!DOCTYPE html><html><head><meta charset="UTF-8"><title>Заявки пользователей</title></head><body>';
  html := html + '<h2>Новая заявка</h2>';
  html := html + '<form method="post" action="submit">';
  html := html + 'Имя: <input type="text" name="name" required><br><br>';
  html := html + 'Текст заявки:<br><textarea name="text" rows="4" cols="50" required></textarea><br><br>';
  html := html + '<input type="submit" value="Отправить заявку">';
  html := html + '</form>';

  html := html + '<hr><h2>Список заявок</h2>';
  html := html + '<table border="1" cellpadding="5">';
  html := html + '<tr><th>ID</th><th>Пользователь</th><th>Текст</th><th>Дата</th></tr>';

  while not ADOQuery1.Eof do
  begin
    html := html + '<tr>';
    html := html + '<td>' + ADOQuery1.FieldByName('ID').AsString + '</td>';
    html := html + '<td>' + HTMLEncode(ADOQuery1.FieldByName('UserName').AsString) + '</td>';
    html := html + '<td>' + HTMLEncode(ADOQuery1.FieldByName('RequestText').AsString) + '</td>';
    html := html + '<td>' + DateTimeToStr(ADOQuery1.FieldByName('CreatedAt').AsDateTime) + '</td>';
    html := html + '<tr>';
    ADOQuery1.Next;
  end;

  html := html + '</table></body></html>';
  ADOQuery1.Close;
  ADOConnection1.Connected := False;

  Response.Content := html;
end;

procedure TWebModule1.WebModule1SubmitAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
var
  userName, requestText: string;
begin
  userName := Request.ContentFields.Values['name'];
  requestText := Request.ContentFields.Values['text'];

  if (userName = '') or (requestText = '') then
  begin
    Response.SendRedirect('/');
    Exit;
  end;

  ADOConnection1.Connected := True;
  ADOQuery1.SQL.Text := 'INSERT INTO Requests (UserName, RequestText) VALUES (:name, :text)';
  ADOQuery1.Parameters.ParamByName('name').Value := userName;
  ADOQuery1.Parameters.ParamByName('text').Value := requestText;
  ADOQuery1.ExecSQL;
  ADOConnection1.Connected := False;

  Response.SendRedirect('/');
end;

end.