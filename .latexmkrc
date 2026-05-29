#!/usr/bin/env perl

$lualatex        = 'lualatex -synctex=1 -interaction=nonstopmode %O %S';
$biber           = 'biber %O %B';
$pdf_mode        = 4;
$postscript_mode = $dvi_mode = 0;
$out_dir         = 'out';

ensure_path('TEXINPUTS', './latex//');
