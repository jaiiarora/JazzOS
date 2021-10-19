GPPPARAMS = -m32
ASPARAMS = --32
LDPARAMS= -melf_i386
objects = loader.o kernerl.o

%.o: %.cpp
	g++ ${GPPARAMS} -O $@ -C $<

%.O: %.S
	as ${ASPARAMS} -o $@ $<

mykernel.bin: linker.ld ${objects}
	ld ${LDPARAMS} -T $< -o $@ ${objects}

install: mykernel.bin
	sudo cp $< /boot/mykernel.bin
