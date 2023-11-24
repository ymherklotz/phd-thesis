$pdflatex = 'lualatex -synctex=1 -interaction=nonstopmode -shell-escape';
$pdf_mode = 1;

@default_files = ('thesis.tex');
@generated_exts = (@generated_exts, 'synctex.gz', 'run.xml');
