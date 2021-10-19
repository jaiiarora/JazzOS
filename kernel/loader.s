.set MAGIC, 0x1badb002
.set FLAGS, (1<<0 | 1<<1)
.set CHECKSUM, -(MAGIC + FLAGS)

.section .multiboot
	.long MAGIC
	.long FLAGS
	.long CHECKSUM


.section .text
.extern kernelMain
.global loader

loader:
	mov $kernel_stack, %esp
	call kernelMain 
	push %eax
	push %ebx
	
_stop:
	cli
	hlt
	jmp_stop


.section .bss
.space 2*1024*1024 #2MB
kernel_stack: 
	 
