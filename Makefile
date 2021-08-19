USRHOME ?= /home/ozpv
PREFIX ?= /usr/local
CC ?= cc
LDFLAGS = -lX11

output: dwmblocks.c blocks.def.h blocks.h
	${CC}  dwmblocks.c $(LDFLAGS) -o dwmblocks
blocks.h:
	cp blocks.def.h $@


clean:
	rm -f *.o *.gch dwmblocks
install: output
	mkdir -p $(DESTDIR)$(PREFIX)/bin
	install -m 0755 dwmblocks $(DESTDIR)$(PREFIX)/bin/dwmblocks
	mkdir -p $(DESTDIR)$(USRHOME)/.config/dwm/
	cp -r scripts/* $(DESTDIR)$(USRHOME)/.config/dwm/
uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/dwmblocks
	rm -rf $(DESTDIR)$(USRHOME)/.config/dwm
