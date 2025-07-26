OUTDIR=../out
AS=as -c
LD=ld

.PHONY: all
all: bootsec

bootsec: boot.o
ifeq ($(wildcard ../out),)
	mkdir ../out
endif
	$(LD) $^ --oformat=binary -Ttext 0x7c00 -o $(OUTDIR)/$@
	dd if=$(OUTDIR)/$@ of=$(OUTDIR)/boot bs=512 count=1 status=none
	@rm $(OUTDIR)/bootsec

%.o: %.s
	$(AS) -c $< -o $@