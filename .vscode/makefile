BIN_LIB = CMPSYS
#AQUI VA LA LIBRERIA CON LA QUE SE TRABAJA
LIBLIST=$(BIN_LIB) PGGJXXXXXX
SHELL=/QOpenSys/usr/bin/qsh

all: depts.sqlrpgle employees.sqlrpgle

depts.sqlrpgle: depts.dspf
employees.sqlrpgle: emps.dspf

%.sqlrpgle:
	system  -s "CHGATR OBJ('./dpirpg/$*.sqlrpgle') ATR(*CCSID) VALUE(1252)"
	liblist -a $(LIBLIST);\
	system "CRTSQLRPGI OBJ($(BIN_LIB)/$*) SRCSTMF('./DPIRPG/$*.sqlrpgle') COMMIT(*NONE) DBGVIEW(*SOURCE) OPTION(*EVENTF)"

%.dspf:
 	system  -s "CRTSRCPF FILE($(BIN_LIB)/DPISRN) RCDLEN(112)"
	system     "CPYFRMSTMF FROMSTMF('./DPISRN/$*.dspf') TOMBR('/QSYS.LIB/$(BIN_LIB).lib/DPISRN.file/$*.mbr') MBROPT(*REPLACE)"
	system  -s "CRTDSPF FILE($(BIN_LIB)/$*) SRCFILE($(BIN_LIB)/DPISRN) SRCMBR($*)" 

%.rpgle:
	system  -s "CHGATR OBJ('/home/DSGOGAMTJ/RPG_DEMO/DPIRPG/$*.rpgle') ATR(*CCSID) VALUE(1252)"
	liblist -a $(LIBLIST);\
	system "CRTBNDRPG OBJ($(BIN_LIB)/$*) SRCSTMF('/home/DSGOGAMTJ/RPG_DEMO/DPIRPG/$*.pgle') DBGVIEW(*SOURCE) OPTION(*EVENTF)"

