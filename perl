# perl perl anglabib > t.tex

print "
\\documentstyle[a4,espo]{article}
\\setlength{\\topmargin}{-1cm}
\\setlength{\\textheight}{24cm}
\\setlength{\\oddsidemargin}{1cm}
\\setlength{\\evensidemargin}{1cm}
\\setlength{\\textwidth}{15cm}
\\setlength{\\parindent}{-5mm}
\\raggedbottom
\\hyphenpenalty=5000
\\begin{document}
\\small
";

while(<>) {
  chop;

  s/ "/ ``/g;
  s/([^\\])"/\1''/g;
  s/&/\\&/g;
  s/\$/\\\$/g;
  s/-([0-9)])/--\1/g;

  if (/^A: / && $_ eq $A) {next;}
  if (/^A: /) {$A=$_;}
  s/^A: *(.*)$/\\hspace{-5mm}{\\bf \1}\\nopagebreak\n/;

  /^T: .*[^.?!]$/ && s/$/./;
  s/^T: *(.*)$/{\1}/;
  /^L: .*[^.?!]$/ && s/$/./;
  s/^L: *(.*)$/{El: \1}/;

  /^O: .*[^.?!]$/ && s/$/./;
  s/^O: *(.*)$/{\\sl \1}/;
  /^F: .*[^.?!]$/ && s/$/./;
  s/^F: *(.*)$/{\\sl From: \1}/;

  /^E: .*[^.?!]$/ && s/$/./;
  s/^E: *(.*)$/{\1}/;

  s/^R: *(.*)$/{\\bf \1}/;

  s/^U: *(.*)$/{\1.}/;
  s/^J: *(.*)$/{\1.}/;
  s/^P: *(.*)$/{\1p.}/;
  s/^D: *(.*)$/{\1.}/;

  s/^S: *(.*)$/{\\bf En:} \1/;

  s/^.: *(.*)$/{[\1]}/;

  print "$_\n";
  }

print "
\\end{document}
";
