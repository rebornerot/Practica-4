program RequestApp;

uses
  Web.WebReq,
  Web.WebBroker,
  RequestWebModule in 'RequestWebModule.pas' {WebModule1: TWebModule};

{$R *.res}

begin
  WebRequestHandler.WebModuleClass := WebModuleClass;
  WebRequestHandlerProc := WebRequestHandler;
end.