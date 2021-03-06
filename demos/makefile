# Copyright (C) 1997-2000 Terry J. Westley
# Copyright (C) Simon Wright <simon@pushface.org>

# This package is free software; you can redistribute it and/or
# modify it under terms of the GNU General Public License as
# published by the Free Software Foundation; either version 2, or
# (at your option) any later version. This package is distributed in
# the hope that it will be useful, but WITHOUT ANY WARRANTY; without
# even the implied warranty of MERCHANTABILITY or FITNESS FOR A
# PARTICULAR PURPOSE. See the GNU General Public License for more
# details. You should have received a copy of the GNU General Public
# License distributed with this package; see file COPYING.  If not,
# write to the Free Software Foundation, 59 Temple Place - Suite
# 330, Boston, MA 02111-1307, USA.

# This makefile builds and runs the demo programs.

include ../makeconf

GPRBUILD ?= gprbuild

TCL_PROGRAMS =					\
freq$(EXE)					\
futurevalue$(EXE)				\
hello_world$(EXE)				\
tashell$(EXE)					\
timer$(EXE)					\
twashell$(EXE)					\
watching$(EXE)					\
wordify$(EXE)

TASH_PROGRAMS =					\
freq2$(EXE)

all::
	[ -d .build ] || mkdir .build
	$(GPRBUILD) -P tash_demos

test::
	./timer

test::
	./futurevalue

test::
	./tashell testfreq.tcl ../src words $(SUPPORTS_TASH)

test::
	echo 1023 >watching.in
	./watching watching.tcl <watching.in

ifeq ($(SUPPORTS_TASH),yes)
test::
	./freq2 < words > freq2.unsorted
endif

profile:
	./freq < words > freq.unsorted
	gprof freq gmon.out > freq.gprof

ifeq ($(SUPPORTS_TASH),yes)
profile2:
	./freq2 < words > freq2.unsorted
	gprof freq2 gmon.out > freq2.gprof
endif

lib:
	@ make -C ../src

# Distribution: expect DIST to be defined as the place beneath which
# the demos directory is to appear

SRC =						\
freq.adb					\
freq2.adb					\
futurevalue.adb					\
futurevalue_app.adb				\
futurevalue_app.ads				\
hello_world.adb					\
tash_demos.gpr					\
tashapp.adb					\
tashapp.ads					\
tashell.adb					\
timer.adb					\
timer_app.adb					\
timer_app.ads					\
twashapp.adb					\
twashapp.ads					\
twashell.adb					\
watching.adb					\
watching_support.adb				\
watching_support.ads				\
wordify.adb

SRC +=						\
freq.pl						\
freq.tcl					\
futurevalue.tcl					\
makefile					\
testfreq.tcl					\
timer.tcl					\
watching.tcl

DEMOS = $(DIST)/demos

dist:
	-rm -rf $(DEMOS)
	mkdir $(DEMOS)
	cp $(SRC) $(DEMOS)/

clean:
	-rm -rf .build *~ *.in *.out $.unsorted $(TCL_PROGRAMS) $(TASH_PROGRAMS)
