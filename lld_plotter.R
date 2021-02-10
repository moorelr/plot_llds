# moorelr/georoc-parser is licensed under The MIT License
# Copyright 2019 Lowell R. Moore

georoc_directory <- getwd()
georoc <- read.csv(paste(georoc_directory, "Georoc_parsed.csv", sep = "/"))

plot_elements <- c("MgO", "SiO2", "TiO2", "Al2O3", "CaO", "Na2O", "K2O")
plot_layout <- c(2, 3)
pdf_w <- 8
pdf_h <- 6

add_llds <- function(x_elem, y_elem, directory = getwd()){
  flag_melts_files <- grep("melts-liquid", list.files(directory))
  for(lld_i in flag_melts_files){
    # debug: lld_i <- 4
    path_lld_i <- paste(directory, list.files(directory)[lld_i], sep = "/")
    liquid <- read.csv(path_lld_i)
    x_melts <- liquid[,paste("wt..", x_elem, sep = "")]
    y_melts <- liquid[,paste("wt..", y_elem, sep = "")]
    lines(x_melts, y_melts, lwd = 2, col = rgb(0, 0, 0.8))
    
    x_label <- mean(x_melts)
    y_label <- mean(y_melts)
    label_text <- list.files(directory)[lld_i]
    text(x_label, y_label, labels = label_text, adj = c(0.5, 0.5), cex = 0.5, col = "blue")
  }
}

draw_plot <- function(x_elem, y_elem, directory = getwd()){
  # Debug: x_elem <- "MgO"; y_elem <- "CaO"; directory <- melts_output
  
  x_georoc <- georoc[,paste(toupper(x_elem), ".WT..", sep = "")]
  y_georoc <- georoc[,paste(toupper(y_elem), ".WT..", sep = "")]
  
  plot(x_georoc, y_georoc, pch = 19, col = rgb(0.8, 0, 0, 0.5)
       , xlab = paste(x_elem, ", wt%", sep = ""), ylab = paste(ylab = y_elem, ", wt%", sep = "")
       )
  add_llds(x_elem, y_elem, directory)
}

pdf(file = "lld_plots.pdf"
    , width = pdf_w, height = pdf_h, useDingbats = FALSE
    )

par(mfrow = plot_layout)

for(i in 2:length(plot_elements)){
  draw_plot(plot_elements[1], plot_elements[i])
}

par(mfrow = c(1, 1))

dev.off()
