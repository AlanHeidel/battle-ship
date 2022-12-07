unit menu;
interface
uses
crt, tipos_datos, basicos, juego_ppal;

procedure box_menu();
procedure opcion_color(opcion, seleccionado: byte);
procedure menu_principal();

implementation




procedure box_menu();
  begin
       textcolor(white);
       writeln('                                       -------------------');
       writeln('                                      |                   |');
       writeln('                                      |-------------------|');
       writeln('                                      |                   |');
       writeln('                                      |                   |');
       writeln('                                      |                   |');
       writeln('                                       -------------------');
  end;

procedure opcion_color(opcion, seleccionado: byte);
  begin
      if(opcion = seleccionado) then
          textbackground(red)
      else
          textbackground(black);
  end;

procedure menu_principal();
  var
    exit: boolean;
    seleccionado: byte;
    tecla: char;
  begin
      exit:= false;
      seleccionado:= 1;
      box_menu();
      while not exit do
      begin
           gotoxy (46, 20); writeln('M E N U');
           opcion_color(1, seleccionado); gotoxy (41, 22);
           writeln('1- Jugar');
           opcion_color(2, seleccionado); gotoxy (41, 23);
           writeln('2- Colocar Flota');
           opcion_color(3, seleccionado); gotoxy (41, 24);
           writeln('3- Salir');
           opcion_color(16, seleccionado);
           tecla:=readkey;
           if tecla=#00 then
              tecla:=readkey;
           case tecla of
                #72: if seleccionado > 1 then
                        seleccionado:= seleccionado - 1
                     else
                         seleccionado:= 3;
                #80: if seleccionado < 3 then
                        seleccionado:= seleccionado + 1
                     else
                         seleccionado:=1;
                #13: if (seleccionado = 1) then
                        begin
                        juego(matriz);
                        box_menu()
                        end
                     else
                         if (seleccionado = 2) then
                         begin
                              inic(matriz);
                              reiniciar_matriz();
                              cargar_matriz_oponente(matriz);
                              box_menu()
                         end
                         else
                             exit:= true;
                #27: begin
                          exit:= true;
                          seleccionado:=0;
                     end;
           end;
      end;
  end;


end.
