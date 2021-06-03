unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls, Unit2;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Memo1: TMemo;
    Memo2: TMemo;
    procedure Button1Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
var i, j, tabPosition: Integer;
  s1, s2, d1, d2: TStringList;
  line: String;
  finded: Boolean;
begin
  s1 := TStringList.Create;
  s2 := TStringList.Create;
  d1 := TStringList.Create;
  d2 := TStringList.Create;

  for i := 0 to Memo1.Lines.Count - 1 do begin
    line := Trim(Memo1.Lines.Strings[i]);
    tabPosition := Pos(#$9, line);
    if tabPosition > 0 then line := Copy(line, 0, tabPosition-1);
    if line <> '' then s1.Add(line);
  end;

  for i := 0 to Memo2.Lines.Count - 1 do begin
    line := Trim(Memo2.Lines.Strings[i]);
    tabPosition := Pos(#$9, line);
    if tabPosition > 0 then line := Copy(line, 0, tabPosition-1);
    if line <> '' then s2.Add(line);
  end;

  //s1.Sort;
  //s2.Sort;
  d1.Add('Відсутні в ' + Edit2.Text);
  d2.Add('Відсутні в ' + Edit1.Text);

  for i := 0 to s1.Count - 1 do begin
    finded := False;
    for j := 0 to s2.Count - 1 do begin
      if s1[i] = s2[j] then finded := True;
    end;
    if finded = False then d1.Add(Memo1.Lines[i]);
  end;

  for j := 0 to s2.Count - 1 do begin
    finded := False;
    for i := 0 to s1.Count - 1 do begin
      if s1[i] = s2[j] then finded := True;
    end;
    if finded = False then d2.Add(Memo2.Lines[j]);
  end;

  Form2.Memo1.Text := d1.Text + Chr(13) + Chr(10) + d2.Text;
  Form2.ShowModal;

  s1.Free;
  s2.Free;
  d1.Free;
  d2.Free;
end;

end.

