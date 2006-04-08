--------------------------------------------------------------------
--
-- wordify.adb -- This program copies standard input to standard output,
--                removing punctuation and writing one word per output line.
--                A word is considered to be a sequence of letters, numbers,
--                and (sorta like Ada identifiers) underscores.
--
-- Copyright (c) 1998 Terry J. Westley
--
-- See the file "license.htm" for information on usage and
-- redistribution of this file, and for a DISCLAIMER OF ALL WARRANTIES.
--
--------------------------------------------------------------------

with Ada.Characters.Handling; use Ada.Characters.Handling;
with Text_IO;

procedure Wordify is

   Line	          : String (1..1024);
   Length         : Natural;
   At_End_Of_Line : Boolean := True;

begin -- Wordify

   while not Text_IO.End_of_File loop
      Text_IO.Get_Line (Line, Length);
      for I in 1..Length loop
	 if Is_Alphanumeric (Line(I)) or Line(I) = '_' then
	    Text_IO.Put (Line(I));
	    At_End_Of_Line := False;
	 elsif not At_End_Of_Line then
	    Text_IO.New_Line;
	    At_End_Of_Line := True;
         end if;
      end loop;
   end loop;

end Wordify;
