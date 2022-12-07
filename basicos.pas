unit basicos;
interface
uses
crt, tipos_datos;

procedure logo ();
procedure inic (var matriz: t_matriz);
function comprobacion_matriz_vacia(matriz: t_matriz): boolean;
function recorrido_portaaviones(matriz: t_matriz): boolean;
function recorrido_destructor(matriz: t_matriz): boolean;
function recorrido_submarino(matriz: t_matriz): boolean;
function recorrido_buque(matriz: t_matriz): boolean;
function recorrido_bote(matriz: t_matriz): boolean;
procedure ganaste(var disparos: integer);

implementation



procedure logo ();
begin
  textcolor(red);
  writeln ('                                   ----------------------------');
  writeln ('                                  | B A T A L L A    N A V A L |');
  writeln ('                                   ----------------------------');
  writeln ('');
  textcolor(white);
  writeln ('                                          _____');
  writeln ('                                 **      |_____|    _     _     _');
  writeln ('                                **       |     |   |_|   |_|   |_| ');
  writeln ('                              **         |     |   | |   | |   | |');
  writeln ('                              _          |     |___|_|___|_|___|_|___');
  writeln ('                             |_|         |     | o     o     o     o |');
  writeln ('                             | |         |     |---------------------|');
  writeln ('                _____________|_|_________|_____|_____________________|_________');
  writeln ('                \                                                             /');
  writeln ('                 \____     o     o     o     o     o     o     o     o   ____/');
  writeln ('                      |-------------------------------------------------|');
  textcolor(cyan); textbackground(blue); write ('~~~~~~~~~~~~~~~~~~~~~~');
  textcolor(white); textbackground(black); write('|                                                 |');
  textcolor(cyan); textbackground(blue); writeln('~~~~~~~~~~~~~~~~~~~~~'); write ('~~~~~~~~~~~~~~~~~~~~~~~');
  textcolor(white); textbackground(black); write('\_______________________________________________/');
  textcolor(cyan); textbackground(blue); writeln('~~~~~~~~~~~~~~~~~~~~~~'); writeln ('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~');
  textbackground(black);
end;

procedure inic (var matriz: t_matriz);

var
  i, j: 1..n;
begin
  for i:= 1 to n do
      for j:= 1 to n do
          matriz[i, j]:= 0;
end;

function comprobacion_matriz_vacia(matriz: t_matriz): boolean;
var i, j: t_dato2;
begin
  comprobacion_matriz_vacia:= true;
  for i:= 1 to n do
      for j:= 1 to n do
          if matriz[i, j] <> 0 then
          comprobacion_matriz_vacia:= false;
end;

function recorrido_portaaviones(matriz: t_matriz): boolean;
var
  i, j: t_dato2;
begin
  recorrido_portaaviones := false;
       for i:= 1 to n do
           for j:= 1 to n do
               begin
               if matriz[i, j] = 5 then
                       recorrido_portaaviones := true;
               end;
end;

function recorrido_destructor(matriz: t_matriz): boolean;
var
  i, j: t_dato2;
begin
  recorrido_destructor := false;
       for i:= 1 to n do
           for j:= 1 to n do
               begin
                    if matriz[i, j] = 4 then
                       recorrido_destructor := true;
               end;
end;

function recorrido_submarino(matriz: t_matriz): boolean;
var
  i, j: t_dato2;
begin
  recorrido_submarino := false;
       for i:= 1 to n do
           for j:= 1 to n do
               begin
                    if matriz[i, j] = 33 then
                       recorrido_submarino := true;
               end;
end;

function recorrido_buque(matriz: t_matriz): boolean;
var
  i, j: t_dato2;
begin
  recorrido_buque := false;
       for i:= 1 to n do
           for j:= 1 to n do
               begin
                    if matriz[i, j] = 3 then
                       recorrido_buque := true;
               end;
end;

function recorrido_bote(matriz: t_matriz): boolean;
var
  i, j: t_dato2;
begin
  recorrido_bote := false;
       for i:= 1 to n do
           for j:= 1 to n do
               begin
                    if matriz[i, j] = 2 then
                       recorrido_bote := true;
               end;
end;

procedure ganaste(var disparos: integer);
begin
  textcolor(green);
  writeln('                              ~~~~~~~~~~~~~~~ ');
  writeln('                             | G A N A S T E |');
  writeln('                              ~~~~~~~~~~~~~~~');
  writeln ('                      TODA LA FLOTA HA SIDO HUNDIDA ');
  writeln('                   -------------------------------------');
  textcolor(white);
  writeln ('                    Disparaste: ', disparos, ' veces.');
  writeln ('                    Presione una tecla . . .');
  readkey;
end;

end.
