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
	cp -r scripts/* $(DESTDIR)$(USRHOME)/bin
	chmod 755 $(DESTDIR)$(USRHOME)/bin/network
	chmod 755 $(DESTDIR)$(USRHOME)/bin/volume
	chmod 755 $(DESTDIR)$(USRHOME)/bin/weather
uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/dwmblocks
	rm -rf $(DESTDIR)$(USRHOME)/.config/dwm
