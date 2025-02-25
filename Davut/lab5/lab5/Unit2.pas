unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids;

type
  TForm2 = class(TForm)
    lb: TLabel;
    e2: TEdit;
    b: TBevel;
    baton21: TBitBtn;
    baton22: TBitBtn;
    e22: TEdit;
    lb1: TLabel;
    SG1: TStringGrid;
    l1: TLabel;
    ee1: TEdit;
    ee2: TEdit;
    l2: TLabel;
    l3: TLabel;
    ee3: TEdit;
    ee4: TEdit;
    l4: TLabel;
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.FormActivate(Sender: TObject);
begin
  Form2.Color:=clMoneyGreen;
end;

end.
