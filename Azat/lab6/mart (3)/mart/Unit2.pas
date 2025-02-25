unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, jpeg;

type
  TForm2 = class(TForm)
    name_of_user_lbl: TLabel;
    next_btn: TBitBtn;
    close_btn: TBitBtn;
    bg: TImage;
    procedure next_btnClick(Sender: TObject);
    procedure close_btnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses
  Unit1;

{$R *.dfm}

procedure TForm2.next_btnClick(Sender: TObject);
begin
  Form1.Show;
end;

procedure TForm2.close_btnClick(Sender: TObject);
begin
 Form1.Close;
 Form2.Close;
end;

end.
 