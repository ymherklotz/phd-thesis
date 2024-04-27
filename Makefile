GNUPLOT_EXTRA_ARGS=

.PHONY: all clean

all: figures/5-hyperblock-scheduling/bar-plot-full.pdf

figures/5-hyperblock-scheduling/unhashed-performance.pdf: GNUPLOT_EXTRA_ARGS=size 3,2
figures/5-hyperblock-scheduling/hashed-performance.pdf: GNUPLOT_EXTRA_ARGS=size 3,2
figures/5-hyperblock-scheduling/unhashed-performance-combined.pdf: GNUPLOT_EXTRA_ARGS=size 7,2
figures/5-hyperblock-scheduling/bar-plot.pdf: GNUPLOT_EXTRA_ARGS=size 7.5,9
figures/5-hyperblock-scheduling/bar-plot-sideways.pdf: GNUPLOT_EXTRA_ARGS=size 10,6.5
figures/5-hyperblock-scheduling/bar-plot-full.pdf: GNUPLOT_EXTRA_ARGS=size 8,10

figures/5-hyperblock-scheduling/%.pdf: figures/5-hyperblock-scheduling/%.gp
	cd figures/5-hyperblock-scheduling; gnuplot -e "set terminal cairolatex pdf $(GNUPLOT_EXTRA_ARGS); set output '$(basename $(notdir $<)).tex'" $(notdir $<)
	cd figures/5-hyperblock-scheduling; mv $(basename $(notdir $<)).tex $(basename $(notdir $<)).tex.in
	cd figures/5-hyperblock-scheduling; sed -e 's/Vericert-original/\\VericertBase/' \
		-e 's/Vericert-list-scheduling/\\VericertList/' \
		-e 's/Vericert-hyperblock-scheduling/\\VericertHyper/' \
		-e 's/Bambu-no-opt/\\BambuNoOpt/' \
		-e 's/Bambu-opt/\\BambuDefault/' \
		<$(basename $(notdir $<)).tex.in >$(basename $(notdir $<)).tex
	cd figures/5-hyperblock-scheduling; rm $(basename $(notdir $<)).tex.in
