unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, Buttons, ExtCtrls;

type
  TForm3 = class(TForm)
    l1: TLabel;
    SG1: TStringGrid;
    l3: TLabel;
    e1: TEdit;
    bvlb: TBevel;
    btnbaton21: TBitBtn;
    btnbaton22: TBitBtn;
    procedure btnbaton22Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

uses Unit1;

{$R *.dfm}

procedure TForm3.btnbaton22Click(Sender: TObject);
begin
   form1.show;
end;

end.
