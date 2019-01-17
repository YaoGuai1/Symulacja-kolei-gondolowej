with Ada, Ada.Text_IO, Ada.Strings, ada.integer_text_io, ada.float_text_io, ada.numerics,
     Ada.Calendar, Ada.Numerics.Float_Random, Ada.Numerics.Discrete_Random;
use Ada, Ada.Text_IO,Ada.Strings, ada.integer_text_io, ada.float_text_io, ada.numerics,
    Ada.Calendar;

package Gondole is
   subtype enterTime is  Integer range 30 .. 100;
   package Random_Enter_Time is new Ada.Numerics.Discrete_Random (enterTime);
   use Random_Enter_Time;
   
   protected Stacja_bot is
      procedure init(x:Natural);
      procedure getting_in(x:Natural);
      function is_empty return Boolean;
      function get_queue return Integer;
   private
      queue: Natural;
   end;
   
   protected Ekran is
      procedure print_State_Station;
      procedure print_State_Gondola1;
      procedure print_State_Gondola2;
      procedure print_End_Gondola1;
      procedure print_End_Gondola2;
      procedure menu;
      procedure poczatek;
      procedure przerwanie;
      procedure oposzczanie1;
      procedure oposzczanie2;
      procedure wypiszg1;
      procedure wypiszg2;
      procedure wypiszq;
      procedure wypisz_error;
   end;
   

   protected Stacja_top is
      procedure getting_out(x:Natural);
      procedure getting_in(x:Natural);
      function is_empty return Boolean;
      function get_queue return Integer;
   private
      queue: Natural :=0;
   end;

   protected type Gondola is
      procedure init(seats:Natural; dir:Boolean; stat:Integer; nam:String);
      procedure passengers_num_set(x:Natural);
      procedure getting_out;
      procedure dir_set(dir:Boolean);
      procedure station_set(stat:Integer);
      procedure set_boarding_time;
      function get_number_of_passenger return Integer;
      function get_number_of_seats return Integer;
      function get_stop_time return Float;
      function get_ride_time return Float;
      function get_i return Float;
      function get_nazwa return String;
      function get_direction return Boolean;
      function get_station return Integer;
      
      procedure set_stop_time(x:Float);
      procedure set_ride_time(x:Float);
      procedure set_i(x:Float);
     

      
      
   private
      number_of_seats: Natural;
      number_of_passengers: Natural;
      direction: Boolean; --True w gore, False w dol
      station: Integer; --1 w drodze, 0 stacja BOT, 2 stacja TOP
      nazwa: String (1..12);                                             
      i: Float;
      R: Generator;
      stop_time: Float;
      ride_time: Float;
      boarding_time: Float;
      key:Character;
      wait1:Boolean;
   end;

   task Jazda_gondola_1 is
      entry Start;
      entry Stop;
   end;
     
   task Jazda_gondola_2 is
      entry Start;
      entry Stop;
   end;
   
   task controller is
      entry Start;
   end;
   

 
   
   Gondola_1, Gondola_2: Gondola;
end Gondole;
