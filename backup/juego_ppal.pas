unit juego_ppal;
interface

uses
  crt, tipos_datos, basicos;

function comprobacion_disparo(var matriz: t_matriz;var fil, col: t_dato2): boolean;
procedure comprobacion_hundimientos(var cont: t_dato2; matriz: t_matriz);
procedure armado_matriz();
procedure mostrar_matriz (var m: t_matriz; var fil, col: t_dato2);
procedure reiniciar_matriz();
procedure mostrar_matriz_con_barcos(var fil, col: t_dato2);
procedure coord_invalida(var fil, col: t_dato2);
procedure cargar_matriz_oponente(var matriz: t_matriz);
procedure juego(var matriz: t_matriz);

implementation



function comprobacion_disparo(var matriz: t_matriz;var fil, col: t_dato2): boolean;
begin
  if (matriz[fil, col] = 0) then
     comprobacion_disparo:= false
  else
           comprobacion_disparo:= true;
end;

procedure comprobacion_hundimientos(var cont: t_dato2; matriz: t_matriz);
begin
  cont:= 1;
  if recorrido_portaaviones(matriz) = false then
     begin
          writeln('');
          write ('| PORTAAVIONES HUNDIDO |');
          cont:= cont + 1;
     end;
  if recorrido_destructor(matriz) = false then
     begin
          write ('| DESTRUCTOR HUNDIDO |');
          cont:= cont + 1;
     end;
  if recorrido_submarino(matriz) = false then
     begin
          write ('| SUBMARINO HUNDIDO |');
          cont:= cont + 1;
     end;
  if recorrido_buque(matriz) = false then
     begin
          write ('| BUQUE HUNDIDO |');
          cont:= cont + 1;
     end;
  if recorrido_bote(matriz) = false then
     begin
          write ('| BOTE HUNDIDO |');
          cont:= cont + 1;
     end;
end;

procedure armado_matriz();
var i, j: 1..m;
begin
  for i:= 1 to m do
      begin
      if i=1 then
             writeln('+---+---+---+---+---+---+---+---+---+---+');
      write ('| ');
      for j:= 1 to m do
          write(matriz_muestra[i,j], ' | ');
          writeln();
          write('+---+---+---+---+---+---+---+---+---+---+');
          writeln();
      end;
end;

procedure mostrar_matriz (var m: t_matriz; var fil, col: t_dato2);
begin
  if comprobacion_disparo(m, fil, col) then
     begin
          textcolor(green);
          matriz_muestra[fil+1, col+1]:= 'X';
          armado_matriz();
          textcolor(white);
     end
  else
      if ((fil = 0) and (col = 0)) then
         begin
              textcolor(white);
              armado_matriz;
         end
      else
          begin
             textcolor(red);
             matriz_muestra[fil+1, col+1]:= '~';
             armado_matriz();
             textcolor(white);
          end;
end;

procedure reiniciar_matriz();
var i, j: 1..m;
begin
  for i:= 2 to m do
      for j:= 2 to m do
          matriz_muestra[i, j]:= ('.');
end;

procedure mostrar_matriz_con_barcos(var fil, col: t_dato2);
begin
  if (fil = 0) and (col = 0) then
     begin
          matriz_muestra[1,1]:= '0';
          armado_matriz();
     end
  else
      begin
           matriz_muestra[(fil + 1), (col + 1)]:= 'X';
           armado_matriz()
      end;
end;

procedure coord_invalida(var fil, col: t_dato2);
begin
  writeln('Esta coordenada es invalida o esta ocupada');
  write('Ingrese la fila nuevamente: ');
  readln (fil);
  write('Ingrese la columna nuevamente: ');
  readln (col);
end;

procedure cargar_matriz_oponente(var matriz: t_matriz);
var
  fil, col, i: t_dato2;
begin
  fil:= 0;
  col:= 0;
  clrscr;
  for i:= 1 to 5 do
  begin
    textcolor(red); writeln(' ------------------------------'); write('| '); textcolor(white);
    write('Coordenadas del Portaaviones'); textcolor(red); writeln(' |: ');
    writeln(' ------------------------------'); textcolor(white);
    mostrar_matriz_con_barcos(fil, col);
    write('Ingrese la fila: ');
    readln (fil);
    write('Ingrese la columna: ');
    readln (col);
    writeln();

    if (matriz[fil, col] = 5) or (fil < 1) or (col < 1) or (fil > 9) or (col > 9) then
    begin
         repeat
         coord_invalida(fil, col);
         writeln();
         until (fil >= 1) and (fil <= 9) and (col >= 1) and (col <= 9) and (matriz[fil, col] <> 5);
         clrscr;
         matriz[fil, col]:= 5;
    end
    else
            matriz[fil, col] := 5;
            clrscr;
  end;
  for i:= 1 to 4 do
      begin
           textcolor(red); writeln(' ----------------------------'); write('| '); textcolor(white);
           write('Coordenadas del Destructor'); textcolor(red); writeln(' |: ');
           writeln(' ----------------------------'); textcolor(white);
           mostrar_matriz_con_barcos(fil, col);
           write('Ingrese la fila: ');
           readln (fil);
           write('Ingrese la columna: ');
           readln (col);
           writeln();
           if (matriz[fil, col] = 5) or (matriz[fil, col] = 4) or (fil < 1) or (col < 1) or (fil > 9) or (col > 9) then
           begin
                repeat
                coord_invalida(fil, col);
                writeln();
                until ((matriz[fil, col] <> 5) and (matriz[fil, col] <> 4) and (fil >= 1) and (fil <= 9) and (col >= 1) and (col <= 9));
                matriz[fil, col] := 4;
                clrscr;
           end
           else
           matriz[fil, col] := 4;
           clrscr;
      end;
  for i:= 1 to 3 do
  begin
       textcolor(red); writeln(' ---------------------------'); write('| '); textcolor(white);
       write('Coordenadas del Submarino'); textcolor(red); writeln(' |: ');
       writeln(' ---------------------------'); textcolor(white);
       mostrar_matriz_con_barcos(fil, col);
       write('Ingrese la fila: ');
       readln (fil);
       write('Ingrese la columna: ');
       readln (col);
       writeln();
       if (matriz[fil, col] = 5) or (matriz[fil, col] = 4) or (matriz[fil, col] = 33) or (fil < 1) or (col < 1) or (fil > 9) or (col > 9) then
       begin
            repeat
                  coord_invalida(fil, col);
                  writeln();
            until (matriz[fil, col] <> 5) and (matriz[fil, col] <> 4) and (matriz[fil, col] <> 33) and (fil >= 1) and (fil <= 9) and (col >= 1) and (col <= 9);
            matriz[fil, col] := 33;
            clrscr;
       end
       else
           matriz[fil, col] := 33;
           clrscr;
  end;

  for i:= 1 to 3 do
  begin
       textcolor(red); writeln(' -----------------------'); write('| '); textcolor(white);
       write('Coordenadas del Buque'); textcolor(red); writeln(' |: ');
       writeln(' -----------------------'); textcolor(white);
       mostrar_matriz_con_barcos(fil, col);
       write('Ingrese la fila: ');
       readln (fil);
       write('Ingrese la columna: ');
       readln (col);
       writeln();
       if (matriz[fil, col] = 5) or (matriz[fil, col] = 4) or (matriz[fil, col] = 33) or (matriz[fil, col] = 3) or (fil < 1) or (col < 1) or (fil > 9) or (col > 9) then
       begin
            repeat
            coord_invalida(fil, col);
            writeln();
            until (matriz[fil, col] <> 5) and (matriz[fil, col] <> 4) and (matriz[fil, col] <> 33) and (matriz[fil, col] <> 3) and (fil >= 1) and (fil <= 9) and (col >= 1) and (col <= 9);
            matriz[fil, col] := 3;
            clrscr;
       end
       else
           matriz[fil, col] := 3;
           clrscr;
  end;
  for i:= 1 to 2 do
  begin
       textcolor(red); writeln(' -----------------------'); write('| '); textcolor(white);
       write('Coordenadas del Bote'); textcolor(red); writeln(' |: ');
       writeln(' -----------------------'); textcolor(white);
       mostrar_matriz_con_barcos(fil, col);
       write('Ingrese la fila: ');
       readln (fil);
       write('Ingrese la columna: ');
       readln (col);
       writeln();
       if (matriz[fil, col] = 5) or (matriz[fil, col] = 4) or (matriz[fil, col] = 33) or (matriz[fil, col] = 3) or (matriz[fil, col] = 2) or (fil < 1) or (col < 1) or (fil > 9) or (col > 9) then
       begin
            repeat
            coord_invalida(fil, col);
            writeln();
            until (matriz[fil, col] <> 5) and (matriz[fil, col] <> 4) and (matriz[fil, col] <> 33) and (matriz[fil, col] <> 3) and (matriz[fil, col] <> 2) and (fil >= 1) and (fil <= 9) and (col >= 1) and (col <= 9);
            matriz[fil, col] := 2;
            clrscr;
       end
       else
       matriz[fil, col] := 2;
       clrscr;
  end;
  textcolor(red); writeln(' --------------------------'); write('| '); textcolor(white);
       write('La flota es la siguiente'); textcolor(red); writeln(' |: ');
       writeln(' --------------------------'); textcolor(white);
  mostrar_matriz_con_barcos(fil, col);
  readkey;
  clrscr;
  reiniciar_matriz();
  logo();
end;

procedure juego(var matriz: t_matriz);
var
  fil, col, cont: t_dato2;
  flag: boolean;
  disparos: integer;
begin
  clrscr;
  disparos:= 0;
  flag:= true;
  fil:= 1;
  col:= 1;
  cont:=1;
  //Comprobacion si hay flota
  if comprobacion_matriz_vacia(matriz) then
     begin
          logo();
          textcolor(white);
          gotoxy (35,23);
          writeln(' -----------------------------');
          gotoxy (35,24);
          writeln('| NO SE PUEDE JUGAR SIN FLOTA |');
          gotoxy (35,25);
          writeln(' -----------------------------');
          readkey;
     end
  else
      begin
           fil:= 0;
           col:= 0;
           mostrar_matriz(matriz, fil, col);
           while flag do
                 begin
                      writeln('');
                      write ('Ingresar fila en donde tirar: ');
                      readln (fil);
                      write ('Ingresar columna en donde tirar: ');
                      readln (col);

                      clrscr;
                      disparos:= disparos + 1;
                      mostrar_matriz(matriz, fil, col);
                      if comprobacion_disparo(matriz, fil, col) then
                         matriz[fil, col]:= 0;


                      //Recorrido para comprobar hundimientos
                      comprobacion_hundimientos(cont, matriz);
                      if (cont > 5) then
                         begin
                              flag:= false;
                              reiniciar_matriz();
                         end;

                 end;
           readkey;
           clrscr;
           ganaste(disparos);
           inic(matriz);
  end;
  clrscr;
  logo();
end;
end.

