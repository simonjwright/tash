--------------------------------------------------------------------
--
-- tashapp.adb --
--
-- Copyright (c) 1995-1997 Terry J. Westley
--
-- See the file "license.htm" for information on usage and
-- redistribution of this file, and for a DISCLAIMER OF ALL WARRANTIES.
--
--------------------------------------------------------------------

with Tcl.Ada;

package body TashApp is

   use type C.Int;

   function Init (
      Interp : in Tcl.Tcl_Interp) return C.Int is

   begin -- Init

      if Tcl.Tcl_Init(interp) = Tcl.TCL_ERROR then
         return Tcl.TCL_ERROR;
      end if;

      -- Call the init procedures for included packages.  Each call should
      -- look like this:
      --
      -- if Mod.Init(interp) = Tcl.TCL_ERROR then
      --    return Tcl.TCL_ERROR;
      -- end if;
      --
      -- where "Mod" is the name of the module.

      -- Call CreateCommand for application-specific commands, if
      -- they weren't already created by the init procedures called above.

      -- Specify a user-specific startup file to invoke if the application
      -- is run interactively.  Typically the startup file is "~/.apprc"
      -- where "app" is the name of the application.  If this line is deleted
      -- then no user-specific startup file will be run under any conditions.

      declare
         Result : constant String := Tcl.Ada.Tcl_SetVar (
            interp, "tcl_rcFileName", "~/.tashrc", Tcl.TCL_GLOBAL_ONLY);
      begin
         return Tcl.TCL_OK;
      end;

   end Init;

end TashApp;
