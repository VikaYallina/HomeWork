uses crt;
type list = record
  next : ^list;
  info : record
    ro:real;
    fi:0..360;
    end;
  end;
  point = ^list;
var head, tail, q:point;
i,n:integer;
p:real;
alpha:0..360;

procedure Addelem (var t,f,l:point); //процедура добавления элемента в список, нахождение головы и хвоста списка
  var y:point;
i1:real;
i2:0..360;
begin
 new (y);
 write('ro=');
 readln(i1);
 write('fi=');
 readln(i2);
 y^.info.ro:=i1;
 y^.info.fi:=i2;
 if f=nil then //если адрес головы пуст, то адрес головы и хвоста равен только что  добавленному
  begin
   f:=y;
   t:=y;
   l:=y;
   end
   else if f^.next=nil then //если голова не указывает на следующий элемент, то задается связь головы введенным элементом, хвостом становится только что введенный элемент
   begin
   f^.next:=y;
   l:=y;
   t:=y;
   end
     else begin
     l^.next:=y;
     t:=y;
     l:=y;
     end;
 end;
 
 begin
writeln('Введите количество точек');
readln(n);
writeln('Введите координаты точек');
   for i:=1 to n do 
   Addelem(q,head,tail);
write('p=');
read(p);
write('alpha=');
read(alpha);
q:=head;
i:=1;
  while q<>tail do
  begin
  if (q^.info.ro=p/(cos(q^.info.fi-alpha)) )then
    begin
    writeln(i,'-ая точка: ro=',q^.info.ro,' fi=',q^.info.fi);
    i:=i+1;
    end;
  q:=q^.next;
  end;
if i=1 then writeln('Точек лежащих на данной прямой нет');
end.    