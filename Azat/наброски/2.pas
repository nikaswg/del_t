
var
  Str, Str1: string;
  i, c: integer;
const
  s1: string = ', ';
  s2: string = ': ';
  s3: string = '- ';
begin
  readln(Str); // Добавлена точка с запятой
  Str1 := '';
  c := 0;
  
  for i := 1 to length(Str) do 
  begin
    if Str[i] = ' ' then 
    begin
      c := c + 1;
    end 
    else 
    begin
      if c = 1 then 
        Str1 := Str1 + s1;
      if c = 2 then 
        Str1 := Str1 + s2;
      if c >= 3 then 
        Str1 := Str1 + s3;
      c := 0;
      Str1 := Str1 + Str[i];
    end;
   end;

  writeln(Str1);
end.