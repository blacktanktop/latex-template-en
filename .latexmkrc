#!/usr/bin/env perl
$latex            = 'pdflatex -synctex=1 -halt-on-error';
$latex_silent     = 'pdflatex -synctex=1 -halt-on-error -interaction=batchmode';
$bibtex           = 'upbibtex';
$dvipdf           = 'dvipdfmx %O -o %D %S';
$makeindex        = 'mendex %O -o %D %S';
$max_repeat       = 5;
$pdf_mode         = 3;