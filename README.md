# MELTS LLD plotter

Script to plot liquid lines of descent calculated by MELTS


Workflow:

- Paste one or many melts-liquid.tbl files into the same directory as the lld_plotter.R script.
- Paste a precompiled GeoRoc dataset into the same directory. I used my GeoRoc parser tool to filter some of the data, but an unaltered one from the GeoRoc website should also work if the references at the end are removed (I haven't tested this!)
- Run the lld_plotter.R script from its current directory.

Note: the settings file doesn't do anything yet.

Note: Each .tbl file should include the string "melts-liquid" and additional text (e.g. "1E+0") will be used to draw labels on generated plots. In the default example, I used a starting composition based on the Yellowstone-Snake River Plain volcanic province and ran the model with different H2O concentrations in the starting composition -- hence 1E+0 wt% (1 wt% H2O) etc.
