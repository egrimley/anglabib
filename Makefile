
anglabib.pdf: kombino.ps fontoj.ps anglabib.ps
	ps2pdf kombino.ps $@

fontoj.dvi: fontoj.tex espo.sty
	latex fontoj.tex

# Anstataŭ -G0 eblas ankaŭ komentigi la "G" en /etc/texmf/dvips/config.pdf.
fontoj.ps: fontoj.dvi
	dvips -Ppdf -G0 fontoj.dvi -o $@

anglabib.tex: perl anglabib
	perl perl anglabib > $@

anglabib.dvi: anglabib.tex espo.sty
	latex anglabib.tex

# Anstataŭ -G0 eblas ankaŭ komentigi la "G" en /etc/texmf/dvips/config.pdf.
anglabib.ps: anglabib.dvi
	dvips -Ppdf -G0 anglabib.dvi -o $@
