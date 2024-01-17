GNUPLOT_EXTRA_ARGS=

.PHONY: all clean

all: figures/5-hyperblock-scheduling/bar-plot-sideways.pdf

figures/5-hyperblock-scheduling/unhashed-performance.pdf: GNUPLOT_EXTRA_ARGS=size 3,2
figures/5-hyperblock-scheduling/hashed-performance.pdf: GNUPLOT_EXTRA_ARGS=size 3,2
figures/5-hyperblock-scheduling/unhashed-performance-combined.pdf: GNUPLOT_EXTRA_ARGS=size 7,2
figures/5-hyperblock-scheduling/bar-plot.pdf: GNUPLOT_EXTRA_ARGS=size 7.5,9
figures/5-hyperblock-scheduling/bar-plot-sideways.pdf: GNUPLOT_EXTRA_ARGS=size 10,6.5

figures/5-hyperblock-scheduling/%.pdf: figures/5-hyperblock-scheduling/%.gp
	cd figures/5-hyperblock-scheduling; gnuplot -e "set terminal cairolatex pdf $(GNUPLOT_EXTRA_ARGS); set output '$(basename $(notdir $<)).tex'" $(notdir $<)
