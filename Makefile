
.PHONY: all
all: fontoj.ps anglabib.ps

fontoj.dvi: fontoj.tex espo.sty
	latex fontoj.tex

fontoj.ps: fontoj.dvi
	dvips fontoj.dvi -o $@

anglabib.tex: perl anglabib
	perl perl anglabib > $@

anglabib.dvi: anglabib.tex espo.sty
	latex anglabib.tex

anglabib.ps: anglabib.dvi
	dvips anglabib.dvi -o $@
