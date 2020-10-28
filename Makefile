all: cgb-acid-hell.gbc

%.2bpp: %.png
	rgbgfx -o $@ $<

%.1bpp: %.png
	rgbgfx -d 1 -o $@ $<

cgb-acid-hell.o: cgb-acid-hell.asm
	rgbasm  -o cgb-acid-hell.o cgb-acid-hell.asm

cgb-acid-hell.gbc: cgb-acid-hell.o
	rgblink -n cgb-acid-hell.sym -m cgb-acid-hell.map -o $@ $<
	rgbfix -v -p 255 $@

	md5 $@

clean:
	rm -f cgb-acid-hell.o cgb-acid-hell.gbc cgb-acid-hell.sym cgb-acid-hell.map
	find . \( -iname '*.1bpp' -o -iname '*.2bpp' \) -exec rm {} +