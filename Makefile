FC=ifort
LD=$(FC)

FFLAGS=-O2 -c
LFLAGS=-O2 -lnetcdf -lnetcdff

MOD_FILES = $(patsubst %.f90,%.o,$(wildcard mod*f90))

.SUFFIXES:
.SUFFIXES: .f90 .o

.f90.o : 
	$(FC) $(FFLAGS) -o $@ $<

SST : main.o $(MOD_FILES)
	$(LD) $(LFLAGS) -o $@ $^

main.o : $(MOD_FILES)

clean:
	rm -rf SST *.o *.mod

debug:
	@echo $(MOD_FILES)

.PHONY: clean debug
