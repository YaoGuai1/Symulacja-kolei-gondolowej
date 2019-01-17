with Ada.Text_IO,Ada.Strings, Gondole, Ada.Integer_Text_IO, ADA.IO_EXCEPTIONS;
use Ada.Text_IO,Ada.Strings, Gondole, Ada.Integer_Text_IO, ADA.IO_EXCEPTIONS;


procedure Kolej is
   imie1: String := "Gondola nr 1";
   imie2: String := "Gondola nr 2";
   seats1:Positive;
   seats2:Positive;
   dir: Boolean :=True;
   stat: Integer range 0..2 :=0;
   queue1: Positive;

begin

   loop
      Gondole.Ekran.wypiszg1;
      begin
         get(seats1);
         exit;
      exception
         when others =>
            Skip_Line;
            Gondole.Ekran.wypisz_error;
      end;
   end loop;

   loop
      Gondole.Ekran.wypiszg2;
      begin
         get(seats2);
         exit;
      exception
         when others =>
            Skip_Line;
            Gondole.Ekran.wypisz_error;

      end;
   end loop;


   loop
      Gondole.Ekran.wypiszq;
      begin
         get(queue1);
         exit;
      exception
         when others =>
            Skip_Line;
            Gondole.Ekran.wypisz_error;
      end;
   end loop;



   Stacja_bot.init(queue1);
   Gondole.Gondola_1.init(seats1, dir, stat, imie1);
   Gondole.Gondola_2.init(seats2, dir, stat, imie2);
   gondole.controller.Start;


end Kolej;
