object WebModule1: TWebModule1
  OldCreateOrder = False
  Actions = <
    item
      Default = True
      Name = 'DefaultAction'
      PathInfo = '/'
      OnAction = WebModule1DefaultAction
    end
    item
      Name = 'SubmitAction'
      PathInfo = '/submit'
      OnAction = WebModule1SubmitAction
    end>
  Height = 230
  Width = 415
  object ADOConnection1: TADOConnection
    Connected = False
    LoginPrompt = False
    Mode = cmReadWrite
    Provider = 'SQLOLEDB.1'
    Left = 72
    Top = 48
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 72
    Top = 112
  end
end