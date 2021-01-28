AS = ca65
CC = cc65
LD = ld65

.PHONY: clean
build: main.fds

integritycheck: main.fds
	radiff2 -x main.fds original.fds | head -n 100

%.o: %.asm
	$(AS) --create-dep "$@.dep" -g --debug-info $< -o $@

main.fds: layout fdswrap.o
	$(LD) --dbgfile $@.dbg -C layout fdswrap.o -o $@

clean:
	rm -f main*.fds *.o *.o.bin

include $(wildcard ./*.dep)
