unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, ComCtrls, StdCtrls, Buttons, jpeg, ExtCtrls;

type
  arr_type = array of array of Real;
  TForm1 = class(TForm)
    matrix_a_sg: TStringGrid;
    matrix_b_sg: TStringGrid;
    nums_trackbar: TTrackBar;
    write_to_file_btn: TBitBtn;
    read_from_file_btn: TBitBtn;
    enter_values_btn: TBitBtn;
    calc_btn: TBitBtn;
    len_of_arr_a: TEdit;
    width_of_arr_a: TEdit;
    len_of_arr_b: TEdit;
    width_of_arr_b: TEdit;
    up_down_len_a: TUpDown;
    up_down_width_a: TUpDown;
    up_down_len_b: TUpDown;
    up_down_width_b: TUpDown;
    close_btn: TBitBtn;
    dlgOpen: TOpenDialog;
    dlgSave: TSaveDialog;
    matrix_a_lbl: TLabel;
    matrix_b_lbl: TLabel;
    col_count_a_lbl: TLabel;
    col_count_b_lbl: TLabel;
    n_count_lbl: TLabel;
    page: TPageControl;
    Multiply: TTabSheet;
    error_inversed: TLabel;
    inversed_a_sg: TStringGrid;
    a_minus_b: TTabSheet;
    error_a_minus_b: TLabel;
    a_minus_b_sg: TStringGrid;
    a_mult_b: TTabSheet;
    error_a_mult_b: TLabel;
    a_mult_b_sg: TStringGrid;
    num_mult_a: TTabSheet;
    a_mult_by_num: TStringGrid;
    det_a: TTabSheet;
    det_a_edt: TEdit;
    transpose_a_page: TTabSheet;
    transposed_a_sg: TStringGrid;
    sorted_a: TTabSheet;
    sorted_a_sg: TStringGrid;
    a_plus_b: TTabSheet;
    error_a_plus_b: TLabel;
    a_plus_b_sg: TStringGrid;
    det_error_lbl: TLabel;
    grp1: TGroupBox;
    grp2: TGroupBox;
    procedure up_down_len_aClick(Sender: TObject; Button: TUDBtnType);
    procedure up_down_width_aClick(Sender: TObject; Button: TUDBtnType);
    procedure up_down_len_bClick(Sender: TObject; Button: TUDBtnType);
    procedure up_down_width_bClick(Sender: TObject; Button: TUDBtnType);
    procedure close_btnClick(Sender: TObject);
    procedure calc_btnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure read_from_file_btnClick(Sender: TObject);
    procedure write_to_file_btnClick(Sender: TObject);
    procedure enter_values_btnClick(Sender: TObject);
    procedure FormClick(Sender: TObject);
    procedure matrix_a_sgKeyPress(Sender: TObject; var Key: Char);
    procedure matrix_b_sgKeyPress(Sender: TObject; var Key: Char);
    procedure bgClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
type mas = array of array of Real;
var
  Form1: TForm1;
  a, b: arr_type;
  len_a, len_b, width_a, width_b: Integer;
  result: Real;
implementation

uses Unit2;

{$R *.dfm}

function init(): Boolean;
var i, j: integer; ADlg: TForm; Ctrl: TControl;
begin

  for i:=0 to len_a-1 do   // Проверка заполненности матрицы А
    for j:=0 to width_a-1 do
      begin
        if Form1.matrix_a_sg.Cells[i, j] = '' then
            begin
              ADlg := CreateMessageDialog('Заполните матрицу А', mtError, [mbOK]);
              with Adlg do
                try
                  Caption := 'Ошибка!';
                  Ctrl := FindChildControl('Yes');
                  Case ShowModal of
                    ID_YES: ;
                  end;
                finally
                  Free;
                end;
                init := False;
                Exit;
            end;
      end;

  for i:=0 to len_b-1 do   // Проверка заполненности матрицы В
    for j:=0 to width_b-1 do
      begin
        if Form1.matrix_b_sg.Cells[i, j] = '' then
            begin
              ADlg := CreateMessageDialog('Заполните матрицу В', mtError, [mbOK]);
              with Adlg do
                try
                  Caption := 'Ошибка!';
                  Ctrl := FindChildControl('Yes');
                  Case ShowModal of
                    ID_YES: ;
                  end;
                finally
                  Free;
                end;
                init := False;
                Exit;
            end;
      end;

  SetLength(a, width_a); // Инициализация массива А и ввод его размерности
    for i:=0 to width_a-1 do
    begin
      SetLength(a[i], len_a);
      for j:=0 to len_a-1 do
        begin
          a[i,j] := StrToFloat(Form1.matrix_a_sg.Cells[j, i]);
        end;
    end;

  SetLength(b, width_b); // Инициализация массива В и ввод его размерности
  for i:=0 to width_b-1 do
    begin
      SetLength(b[i], len_b);
      for j:=0 to len_b-1 do
        begin
          b[i,j] := StrToFloat(Form1.matrix_b_sg.Cells[j, i]);
        end;
    end;

  init := True;

end;


procedure calculate_determinant; // Вычисление определителя матрицы A методом Гаусса
var i, j, k, r, n: Integer; s: string; max, c, m: Real; temp_arr: arr_type;
begin
  with Form1 do
  begin
    if len_a <> width_a then
      begin
        det_error_lbl.Visible := True;
        Exit;
      end;

    n:= len_a-1;
    SetLength(temp_arr, n+1, n+1);

    for i:=0 to n do
      for j:=0 to n do
        begin
          temp_arr[i,j] := a[i,j];
        end;


    result:=1;

    for k:=0 to n do
     begin
       max:=abs(temp_arr[k,k]);
       r:=k;
       for i:=k+1 to n do
        begin
         if abs(temp_arr[i,k])>max then
           begin
             max:=abs(temp_arr[i,k]);
             r:=i;
           end;
        end;
       if r<>k then result:=-result;
         for j:=0 to n do
           begin
             c:=temp_arr[k,j];
             temp_arr[k,j]:=temp_arr[r,j];
             temp_arr[r,j]:=c;
           end;
       for i:=k+1 to n do
         begin
           if Abs(temp_arr[k,k]) < 0.0001 then
             begin
              result := 0;
              Str(result:0:3, s);
              det_a_edt.Text := s;
              det_a_edt.Visible := True;
              Exit;
             end;
           m:=temp_arr[i,k]/temp_arr[k,k];
           for j:=k to n do
             temp_arr[i,j]:=temp_arr[i,j]-m*temp_arr[k,j];
         end;
     end;

   for i:=0 to n do
    result:=result*temp_arr[i,i];

    if Abs(result) < 0.0001 then
      begin

        result := 0;
        Str(result:0:3, s);
        det_a_edt.Text := s;
        det_a_edt.Visible := True;
        Exit;

      end;


    Str(result:0:3, s);
    det_a_edt.Text := s;

    det_a_edt.Visible := True;

  end;
end;


procedure calculate_a_plus_b; // Сложение А + В
var i, j: Integer; s: string; temp: Real;
begin
  with Form1 do
  begin
    if (len_a + width_a <> width_b +len_b) then
      begin

        a_plus_b_sg.Visible := False;
        error_a_plus_b.Visible := True;
        Exit;

      end;


    for i:=0 to width_a-1 do
      for j:=0 to len_a-1 do
        begin
          temp := a[i, j] + b[i, j];
          Str(temp:0:2, s);
          a_plus_b_sg.Cells[j, i] := s;
        end;

    a_plus_b_sg.ColCount := len_a;
    a_plus_b_sg.RowCount := width_a;
    a_plus_b_sg.Visible := True;
  end;
end;

procedure calculate_a_minus_b; // Вычитание А - В
var i, j: Integer; s: string; temp: Real;
begin
  with Form1 do
  begin
    if (len_a + width_a <> width_b +len_b) then
      begin

        a_minus_b_sg.Visible := False;
        error_a_minus_b.Visible := True;
        Exit;

      end;


    for i:=0 to width_a-1 do
      for j:=0 to len_a-1 do
        begin
          temp := a[i, j] - b[i, j];
          Str(temp:0:2, s);
          a_minus_b_sg.Cells[j, i] := s;
        end;

    a_minus_b_sg.ColCount := len_a;
    a_minus_b_sg.RowCount := width_a;
    a_minus_b_sg.Visible := True;
  end;
end;

procedure calculate_a_multiply_b; // Умножение A * B
var i, j, k: Integer; s: string;
    temp_arr: arr_type;
    c: mas;
begin
  with Form1 do
  begin

    if not (width_b = len_a)  then
      begin

        a_mult_b_sg.Visible := False;
        error_a_mult_b.Visible := True;
        Exit;

      end;

    SetLength(temp_arr,  width_a, len_b);

    for i:=0 to width_a-1 do
      for j:=0 to len_b-1 do
        begin
          for k:=0 to width_b-1 do
            begin
              temp_arr[i,j] := temp_arr[i,j] + a[i, k] * b[k, j];
            end;
            Str(temp_arr[i,j]:0:2, s);
            a_mult_b_sg.Cells[j, i] := s;
        end;

    a_mult_b_sg.ColCount := len_b;
    a_mult_b_sg.RowCount := width_a;
    a_mult_b_sg.Visible := True;
    
  end;
end;

procedure multiply_a_by_num; // Умножение матрицы А на число а
var i, j: Integer; s: string; temp: Real;
begin
  with Form1 do
  begin
    for i:=0 to width_a-1 do
      for j:=0 to len_a-1 do
        begin
          temp := a[i, j] * nums_trackbar.Position;
          Str(temp:0:2, s);
          a_mult_by_num.Cells[j, i] := s;
        end;

    a_mult_by_num.ColCount := len_a;
    a_mult_by_num.RowCount := width_a;
    a_mult_by_num.Visible := True;
  end;
end;

procedure transpose_a; // Транспонирование А
var i, j: Integer; s: string; temp: Real; temp_arr: arr_type;
begin
  with Form1 do
  begin

    SetLength(temp_arr, len_a, width_a);


    for i:=0 to width_a-1 do
        for j:=0 to len_a-1 do
        begin
          temp_arr[j, i] := a[i, j];
          temp := temp_arr[j, i];
          Str(temp:0:2, s);
          transposed_a_sg.Cells[i, j] := s;
        end;

    transposed_a_sg.ColCount := width_a;
    transposed_a_sg.RowCount := len_a;
    transposed_a_sg.Visible := True;
  end;
end;

procedure calculate_inversed_matrix_a; // Нахождение обратной матрицы для А
var i, j, k, kol: Integer; s: string; temp: Real; temp_arr, temp_arr1: arr_type;
begin
  with Form1 do
  begin

    if (len_a <> width_a) or (Abs(result) < 0.001) then
      begin
        error_inversed.Visible := True;
        Exit;
      end;


    kol := len_a;

    SetLength(temp_arr, kol, kol);
    SetLength(temp_arr1, kol, kol);

    for i:=0 to kol-1 do
      for j:=0 to kol-1 do
        begin
          temp_arr1[i,j] := a[i,j];
        end;


    for k:=0 to kol - 1 do
      begin
         for i:=0 to kol - 1 do
          for j:=0 to kol - 1 do
            begin
                 if (i=k) and (j=k) then
                    temp_arr[i,j] := 1/temp_arr1[i,j];
                 if (i=k) and (j<>k) then
                    temp_arr[i,j] := temp_arr1[i,j]/temp_arr1[k,k];
                 if (i<>k) and (j=k) then
                    temp_arr[i,j] := -temp_arr1[i,k]/temp_arr1[k,k];
                 if (i<>k) and (j<>k) then
                    temp_arr[i,j] := temp_arr1[i,j] - temp_arr1[k,j] * temp_arr1[i,k]/temp_arr1[k,k];
            end;
         for i:= 0 to kol - 1 do
           for j:= 0 to kol - 1 do
             begin
              temp_arr1[i,j] := temp_arr[i,j]
             end;
      end;

      for i:=0 to kol-1 do
        for j:=0 to kol-1 do
          begin
            temp := temp_arr1[i, j];
            Str(temp:0:4, s);
            inversed_a_sg.Cells[j, i] := s;
          end;
    inversed_a_sg.ColCount := width_a;
    inversed_a_sg.RowCount := len_a;
    inversed_a_sg.Visible := True;
  end;
end;

procedure usual_sort;  // Сортировка матрицы А
var i, j, n, j_min: integer;
    min:Real;
    s: string;
    temp_row, ans_row: array of Real;
begin
with Form1 do
begin
  sorted_a_sg.Visible := True;
  sorted_a_sg.RowCount := width_a;
  sorted_a_sg.ColCount := len_a;

  for n := 0 to width_a - 1 do
  begin
    SetLength(temp_row, len_a);
    SetLength(ans_row, len_a);

    for j := 0 to len_a - 1 do
    begin
      ans_row[j] := a[n, j];
    end;

    for j := 0 to len_a - 1 do
    begin
      min := ans_row[j];
      j_min := j;
      for i := 0 to len_a - 1 do
      begin
        if ans_row[i] < min then
        begin
          min := ans_row[i];
          j_min := i;
        end;
      end;
      temp_row[j] := min;
      ans_row[j_min] := 9999;
    end;

    for j := 0 to len_a - 1 do
    begin
      Str(temp_row[j]:0:2, s);
      Form1.sorted_a_sg.Cells[j, n] := s;
    end;
  end;
end;
end;
   {
procedure sort;
var i,j,k,m: Integer;
  nech,ch,temp: Extended;
  s: string;
begin
  if width_a<>len_a then
  begin
    Form1.lbl2.Visible:=True;;
    Exit;
  end;
  Form1.SG.Visible:=True;
  Form1.SG.RowCount := width_a;
  Form1.SG.ColCount := len_a;
  nech:=0;
  ch:=0;
  m:=0;
{   for i:=1 to width_a do
     begin
       inc(m);
       if (m mod 2 = 0) then
        ch:=ch+a[i,i];
       if (m mod 2 <> 0) then
         nech:=nech+a[i,i];
     end;}
{for i:=0 to width_a-1 do
begin
  if (i mod 2 = 0) and (i > 0) and (i <= len_a) then
    ch:=ch+a[i,i]
    else
      nech:=nech+a[i,i];
end;
     if ch<nech then
          for i:=0 to width_a-1 do
     for j:=0 to len_a-1 do
     for k:=0 to len_a-2 do
       if  a[i,k]<a[i,k+1] then
     begin
        temp:=a[i,k];
        a[i,k]:=a[i,k+1];
        a[i,k+1]:=temp;
     end;
     for i:=0 to width_a-1 do
       for j:=0 to len_a-1 do
       begin
                    temp := a[i, j];
            Str(temp:0:2, s);
            Form1.SG.Cells[j, i] := s;
     end;
end;
     }
procedure TForm1.up_down_len_aClick(Sender: TObject; Button: TUDBtnType);
begin
  len_a := StrToInt(len_of_arr_a.Text);
  matrix_a_sg.ColCount := len_a;
  FormClick(Form1);
end;

procedure TForm1.up_down_width_aClick(Sender: TObject; Button: TUDBtnType);
begin
  width_a := StrToInt(width_of_arr_a.Text);
  matrix_a_sg.RowCount := width_a;
  FormClick(Form1);
end;

procedure TForm1.up_down_len_bClick(Sender: TObject; Button: TUDBtnType);
begin
  len_b := StrToInt(len_of_arr_b.Text);
  matrix_b_sg.ColCount := len_b;
  FormClick(Form1);
end;

procedure TForm1.up_down_width_bClick(Sender: TObject; Button: TUDBtnType);
begin
  width_b := StrToInt(width_of_arr_b.Text);
  matrix_b_sg.RowCount := width_b;
  FormClick(Form1);
end;

procedure TForm1.close_btnClick(Sender: TObject);
begin
  Form1.Close;
  Form2.Close;
end;

procedure TForm1.calc_btnClick(Sender: TObject);
begin
  if init() then
    begin
      a_minus_b_sg.Visible := False;
      a_mult_by_num.Visible := False;
      a_minus_b_sg.Visible := False;
      a_plus_b_sg.Visible := False;
      error_a_minus_b.Visible := False;
      error_a_plus_b.Visible := False;
      error_a_mult_b.Visible := False;
      det_error_lbl.Visible := False;
      det_a_edt.Visible := False;
      inversed_a_sg.Visible := False;
      error_inversed.Visible := False;


      multiply_a_by_num;
      calculate_determinant;
      transpose_a;
      calculate_a_plus_b;
      calculate_a_minus_b;
      calculate_a_multiply_b;
      calculate_inversed_matrix_a;
      usual_sort;
      page.Visible := True;
      matrix_a_lbl.Visible := True;
      matrix_b_sg.Visible := True;
    end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
 len_a := 1;
 len_b := 1;
 width_a := 1;
 width_b := 1;
end;

procedure TForm1.read_from_file_btnClick(Sender: TObject);
var F:TextFile; k: string; i, j: integer;
begin
  if dlgOpen.Execute then
    begin
      AssignFile(F, dlgOpen.FileName);
      Reset(F);
      Readln(F, k);
      len_a := StrToInt(k);
      up_down_len_a.Position := len_a;
      Readln(F, k);
      width_a := StrToInt(k);
      up_down_width_a.Position := width_a;
      Readln(F, k);
      len_b := StrToInt(k);
      up_down_len_b.Position := len_b;
      Readln(F, k);
      width_b := StrToInt(k);
      up_down_width_b.Position := width_b;

      for i:=0 to len_a-1 do
        for j:=0 to width_a-1 do
          begin
            Readln(F, k);
            matrix_a_sg.Cells[i, j] := k;
          end;

      for i:=0 to len_b-1 do
        for j:=0 to width_b-1 do
          begin
            Readln(F, k);
            matrix_b_sg.Cells[i, j] := k;
          end;

      matrix_a_sg.RowCount := width_a;
      matrix_a_sg.ColCount := len_a;
      matrix_b_sg.RowCount := width_b;
      matrix_b_sg.ColCount := len_b;

      CloseFile(F);
      enter_values_btnClick(Form1);
      FormClick(Form1);
      matrix_a_sg.Visible := True;
      matrix_b_sg.Visible := True;
    end;
end;


procedure TForm1.write_to_file_btnClick(Sender: TObject);
var F: TextFile; i, j: integer;
begin
  if dlgSave.Execute then
    begin
      AssignFile(F, dlgSave.FileName);
      Rewrite(F);

      Writeln(F, inttostr(len_a));
      Writeln(F, inttostr(width_a));
      Writeln(F, inttostr(len_b));
      Writeln(F, inttostr(width_b));

      for i:=0 to len_a-1 do
        for j:=0 to width_a-1 do
          begin
            Writeln(F, matrix_a_sg.Cells[i, j]);
          end;

      for i:=0 to len_b-1 do
        for j:=0 to width_b-1 do
          begin
            Writeln(F, matrix_b_sg.Cells[i, j]);
          end;

      CloseFile(F);
    end;
    matrix_a_sg.Visible := True;
    matrix_b_sg.Visible := True;
    calc_btn.Visible := True;
end;


procedure TForm1.enter_values_btnClick(Sender: TObject);
begin
  grp2.Visible:=True;
end;

procedure TForm1.FormClick(Sender: TObject);
begin
  grp1.Visible:=True;
end;

procedure TForm1.matrix_a_sgKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = '.' then Key := ',';
  if not (Key in ['0'..'9', ',', '.', '-', #08]) then Key:= #0;
end;

procedure TForm1.matrix_b_sgKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = '.' then Key := ',';
  if not (Key in ['0'..'9', ',', '.', '-', #08]) then Key:= #0;
end;

procedure TForm1.bgClick(Sender: TObject);
begin
  matrix_a_lbl.Visible:=True;
  matrix_a_sg.Visible:=True;
  matrix_b_lbl.Visible:=True;
  matrix_b_sg.Visible:=True;
end;

end.
