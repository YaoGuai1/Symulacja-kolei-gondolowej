with Ada.Text_IO, Ada.Strings, Ada.Integer_Text_IO, ada.float_text_io, ada.numerics,
     Ada.Calendar, Ada.Numerics.Float_Random, Ada.Numerics.Discrete_Random;
use Ada.Text_IO, Ada.Strings, Ada.Integer_Text_IO, ada.float_text_io, ada.numerics,
    Ada.Calendar;

package body Gondole is
   
   protected body Ekran is
      
      procedure print_State_Station is
      begin
         Put("Na dole pozostalo ");
         Put(Stacja_bot.get_queue);
         Put_Line(" ludzi w kolejce");
         Put("Na gorze pozostalo ");
         Put(Stacja_top.get_queue);
         Put_Line(" ludzi w kolejce");
      end;
      
      procedure print_State_Gondola1 is
      begin
         if Gondola_1.get_station=1 then
            Put(Gondola_1.get_nazwa);
            Put(": Kierunek :");
            if Gondola_1.get_direction then
               Put(" w gore ");
            else
               Put(" w dol ");
            end if;
            Put("/ Liczba pasazerow : ");
            Put_Line(Integer'Image(Gondola_1.get_number_of_passenger));
         elsif Gondola_1.get_station=2 then
            Put(Gondola_1.get_nazwa);
            Put_Line(" znajduje sie na stacji gornej");
         else
            Put(Gondola_1.get_nazwa);
            Put_Line(" znajduje sie na stacji dolnej");
         end if;
      end;
      
      
      procedure print_State_Gondola2 is
      begin
         Put("                                    ");
         if Gondola_2.get_station=1 then
            Put(Gondola_2.get_nazwa);
            Put(": Kierunek :");
            if Gondola_2.get_direction then
               Put(" w gore ");
            else
               Put(" w dol ");
            end if;
            Put("/ Liczba pasazerow : ");
            Put_Line(Integer'Image(Gondola_2.get_number_of_passenger));
         elsif Gondola_2.get_station=2 then
            Put(Gondola_2.get_nazwa);
            Put_Line(" znajduje sie na stacji gornej");
         else
            Put(Gondola_2.get_nazwa);
            Put_Line(" znajduje sie na stacji dolnej");
         end if;
      end;
      
      procedure print_End_Gondola1 is
      begin
         Put_Line("Gondola 1 zakonczyla prace");
      end;
      
      procedure print_End_Gondola2 is
      begin
         Put("                                    ");
         Put_Line("Gondola 2 zakonczyla prace");
      end;
      
      procedure menu is
      begin
         Put_Line("s to start");
         Put_Line("k to end");
      end;
      
      procedure przerwanie is
      begin
         Put_Line(">> przerwano dzialanie kolejki <<");
      end;
      
      procedure poczatek is
      begin
         Put_Line(">> rozpoczynam dzialanie kolejki linowej <<");
      end;
           
      procedure oposzczanie1 is
      begin
         Put(Gondola_1.get_nazwa);
         Put_Line(" : pasazerowie oposcili gondole ");
      end;
      
      procedure oposzczanie2 is
      begin
         Put("                                    ");
         Put(Gondola_2.get_nazwa);
         Put_Line(" : pasazerowie oposcili gondole ");
      end;
      
      procedure wypiszg1 is
      begin
         Put_Line("Wpisz liczbe siedzen w pierwszej gondoli");
      end;
      
      procedure wypiszg2 is
      begin
         Put_Line("Wpisz liczbe siedzen w drugiej gondoli");
      end;
      
      procedure wypiszq is
      begin
         Put_Line("Wpisz liczbe osob w kolejce");
      end;
      
      procedure wypisz_error is
      begin
         Put_Line("Bledny typ zmiennej, prosze wpisac liczbe siedzen ponownie jako liczbe wieksza od 0");
      end;
      
      
   end Ekran;
   
      
   

   
   protected body Stacja_bot is
      procedure init(x:Natural) is
      begin
         queue := x;
      end;

      procedure getting_in(x:Natural) is
      begin
         queue := queue-x;
      end;

      function is_empty return Boolean is
      begin
         if queue = 0 then
            return True;
         else
            return False;
         end if;
      end;
      
      function get_queue return Integer is
      begin
         return queue;
      end;
      

   end Stacja_bot;

   protected body Stacja_top is
      procedure getting_in(x:Natural) is
      begin
         queue := queue-x;
      end;

      procedure getting_out(x:Natural) is
      begin
         queue := queue+x;
      end;

      function is_empty return Boolean is
      begin
         if queue = 0 then
            return True;
         else
            return False;
         end if;
      end;
      
      function get_queue return Integer is
      begin
         return queue;
      end;

   end Stacja_top;

   protected body Gondola is
      procedure init(seats:Natural; dir:Boolean; stat:Integer; nam:String) is
      begin
         number_of_seats := seats;
         direction := dir;
         station := stat;
         nazwa := nam;
      end;

      procedure passengers_num_set(x:Natural) is
      begin
         if x <= number_of_seats then
           number_of_passengers := x;
         end if;
      end;

      procedure getting_out is
      begin
         number_of_passengers := 0;
         i := 0.0;

      end;

      procedure dir_set(dir:Boolean) is
      begin
         direction := dir;
      end;

      procedure station_set(stat:Integer) is
      begin
         station := stat;
      end;
      
      procedure set_boarding_time is
      begin
         Reset(R);
         boarding_time :=(Float(Random(R)))/100.0;
         i := i + boarding_time;
         number_of_passengers := number_of_passengers + 1;
      end;
        
      function get_number_of_passenger return Integer is
      begin
         return number_of_passengers;
      end;
      
      function get_number_of_seats return Integer is
      begin
         return number_of_seats;
      end;
      
      function get_i return Float is
      begin
         return i;
      end;
      
      function get_stop_time return Float is
      begin
         return stop_time;
      end;
      
      function get_ride_time return Float is
      begin
         return ride_time;
      end;
      
      function get_station return Integer is
      begin
         return station;
      end;
      
      function get_direction return Boolean is
      begin
         return direction;
      end;
      
      function get_nazwa return String is
      begin
         return nazwa;
      end;
      
      
      
      procedure set_i (x:Float) is
      begin
         i := x;
      end;
      
      procedure set_ride_time (x:Float) is
      begin
         ride_time:=x;
      end;
      
      procedure set_stop_time (x:Float) is
      begin
         stop_time := x;
      end;

   end;

   task body Jazda_gondola_1 is
      wait: Boolean := True;
      run: Boolean;
   begin
      Gondola_1.set_i(0.0);
      Gondola_1.set_ride_time(2.0);
      loop
         accept Start  do
            wait:=False;
            Gondola_1.set_stop_time(Float(Gondola_1.get_number_of_seats) * 0.45);
            run:=True;
         end Start;
         exit when not wait;
      end loop;
      
      while run loop

         while (Gondola_1.get_stop_time - Gondola_1.get_i) > 0.0 loop
            if (Gondola_1.get_number_of_passenger = Gondola_1.get_number_of_seats) or else (Stacja_bot.get_queue = 0) then
               exit;
            end if;
            Gondola_1.set_boarding_time;
            Stacja_bot.getting_in(1);
         end loop;
         Ekran.print_State_Gondola1;
         delay Duration(Gondola_1.get_i);
         Gondola_1.station_set(1); 
         Gondola_1.dir_set(True); 
         Ekran.print_State_Gondola1;
         delay Duration(Gondola_1.get_ride_time);
         Gondola_1.station_set(2);
         
         delay Duration(Gondola_1.get_i);
         Ekran.oposzczanie1;
         Stacja_top.getting_out(Gondola_1.get_number_of_passenger);
         Gondola_1.getting_out;
         while (Gondola_1.get_stop_time - Gondola_1.get_i) > 0.0 loop
            if (Gondola_1.get_number_of_passenger = Gondola_1.get_number_of_seats) or else (Stacja_top.get_queue = 0) then
               exit;
            end if;
            Gondola_1.set_boarding_time;
            Stacja_top.getting_in(1);
         end loop;
         Ekran.print_State_Gondola1;
         delay Duration(Gondola_1.get_i);
         Gondola_1.station_set(1);  
         Gondola_1.dir_set(False); 
         
         Ekran.print_State_Gondola1;
         delay Duration(Gondola_1.get_ride_time);
         Gondola_1.station_set(0);
         
         delay Duration(Gondola_1.get_i);
         Ekran.oposzczanie1;
         Gondola_1.getting_out;
         
         Ekran.print_State_Station;
         


         if Stacja_top.is_empty and Stacja_bot.is_empty then 
            Ekran.print_End_Gondola1;
            run:= False;
         end if;
         select
            accept Stop  do
               run:=False;
            end Stop;
         else
            null;
         end select;
         
         exit when not run;
      end loop;
     

   end;

   task body Jazda_gondola_2 is
      wait: Boolean := True;
      run: Boolean := False;
   begin
      Gondola_2.set_i(0.0);
      Gondola_2.set_ride_time(2.0);
      loop
         accept Start  do
            wait:=False;
            Gondola_2.set_stop_time(Float(Gondola_2.get_number_of_seats) * 0.45);
            run:=True;
         end Start;
         exit when not wait;
      end loop;
      loop
        

         while (Gondola_2.get_stop_time - Gondola_2.get_i) > 0.0 loop
            if (Gondola_2.get_number_of_passenger = Gondola_2.get_number_of_seats) or else (Stacja_bot.get_queue = 0) then
               exit;
            end if;
            Gondola_2.set_boarding_time;
            Stacja_bot.getting_in(1);
         end loop;
         Ekran.print_State_Gondola2;
         delay Duration(Gondola_2.get_i);

         Gondola_2.station_set(1); 
         Gondola_2.dir_set(True); 
         Ekran.print_State_Gondola2;
         delay Duration(Gondola_2.get_ride_time);
         Gondola_2.station_set(2);
         
         delay Duration(Gondola_2.get_i);
         Ekran.oposzczanie2;
         Stacja_top.getting_out(Gondola_2.get_number_of_passenger);
         Gondola_2.getting_out;
         while (Gondola_2.get_stop_time - Gondola_2.get_i) > 0.0 loop
            if (Gondola_2.get_number_of_passenger = Gondola_2.get_number_of_seats) or else (Stacja_top.get_queue = 0) then
               exit;
            end if;
            Gondola_2.set_boarding_time;
            Stacja_top.getting_in(1);
         end loop;
         Ekran.print_State_Gondola2;
         delay Duration(Gondola_2.get_i);
         Gondola_2.station_set(1); 
         Gondola_2.dir_set(False);
         
         Ekran.print_State_Gondola2;
         delay Duration(Gondola_2.get_ride_time);
         Gondola_2.station_set(0);
         
         delay Duration(Gondola_2.get_i);
         Ekran.oposzczanie2;
         Gondola_2.getting_out;

         if Stacja_top.is_empty and Stacja_bot.is_empty then 
            Ekran.print_End_Gondola2;
            exit;
         end if;
         
         select
            accept Stop  do
               run:=False;
            end Stop;
         else
            null;
         end select;
         
      end loop;
         
   end;
   
   task body controller is
      key:Character;
      wait1:Boolean:=False;
   begin
      loop
         accept Start  do
            wait1:=False;
            Ekran.menu;
         end Start;
         exit when not wait1;
      end loop;
      loop
         Get(key);
         if key='k' then
            abort Jazda_gondola_1;
            abort Jazda_gondola_2;
            Ekran.przerwanie;
            abort Controller;
         elsif key='s' then
            Ekran.poczatek;
            Jazda_gondola_1.Start;
            Jazda_gondola_2.Start;
         end if;
         
      end loop;
   end;
   

end Gondole;
