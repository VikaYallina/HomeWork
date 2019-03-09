type list = record
     next:^list;
     info:integer;
     end;
     point = ^list;
var head,head2,tail,p,q:point; 
i,n:integer; 

procedure Addelem (var t,f,l:point); //процедура добавления элемента в список, нахождение головы и хвоста списка
  var y:point;
i:integer;
begin
 new (y);
 readln(i);
 y^.info:=i;
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
 
 function FindP(he,x:point):point; // функция нахождения адреса элемента, предыдущего данному
 var l:point;
   begin
     l:=he;
     while l^.next<>x do
     l:=l^.next;
     result:=l;
   end;
   
begin 
writeln('Введите количество элементов в списке');
readln(n);
writeln('Введите спсиок');
   for i:=1 to n do 
   Addelem(q,head,tail); //ввод списка
 head2:=tail; //присваиваем новому адресу головы адрес хвоста
 q:=tail;
 p:=nil;
  while p<>head do
   begin
   p:=FindP(head,q);//находим адрес элемента, предшевствующего данному
   q^.next:=p; //связываем данную ячейку с предшевствующей ей
   q:=p;
   if p=head then
      p^.next:=head2; //когда адрес элемента станет равен адресу первоначальной голове списка, то изменяем указатель на голову списка. В итоге получаем циклический список
  end; 
writeln('Вывод списка');
for i:=1 to 10 do
  begin
  writeln(head2^.info);
  head2:=head2^.next;
  end;
end. 
