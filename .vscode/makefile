BIN_LIB = CMPSYS
LIBLIST=$(BIN_LIB) SAMPLE
SHELL=/QOpenSys/usr/bin/qsh

all: depts.sqlrpgle employees.sqlrpgle

depts.sqlrpgle: depts.dspf
employees.sqlrpgle: emps.dspf

%.sqlrpgle:
	system  -s "CHGATR OBJ('./dpirpg/$*.sqlrpgle') ATR(*CCSID) VALUE(1252)"
	liblist -a $(LIBLIST);\
	system     "CRTSQLRPGI OBJ($(BIN_LIB)/$*) SRCSTMF('./DPIRPG/$.*sqlrpgle') COMMIT(*NONE) DBGVIEW(*SOURCE) OPTION(*EVENTF)"

%.dspf:
 	system  -s "CRTSRCPF FILE($(BIN_LIB)/DPISRN) RCDLEN(112)"
	system     "CPYFRMSTMF FROMSTMF('./DPISRN/$*.dspf') TOMBR('/QSYS.LIB/$(BIN_LIB).lib/DPISRN.file/$*.mbr') MBROPT(*REPLACE)"
	system  -s "CRTDSPF FILE($(BIN_LIB)/$*) SRCFILE($(BIN_LIB)/DPISRN) SRCMBR($*)" 