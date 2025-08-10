## This is a code for the ring function


YanXu_ring = function(data, blue, pink, 
                       max_location, min_location,
                       angle){
  # Load packages
  if (!require(ggplot2)) install.packages("ggplot2")
  if (!require(tidyverse)) install.packages("tidyverse")
  if (!require(tastypie)) install.packages("tastypie")
  # 1. Data pre-processing
  data$ymax <- cumsum(data$fraction)
  data$ymin <- c(0, head(data$ymax, n = -1))
  data$labelPosition <- (data$ymax + data$ymin) / 2
  data$label <- paste0(data$category, "\n value: ", data$count)
  indices1 <- grep(blue, data$category)
  indices2 <- grep(pink, data$category)
  data$special_color <- "normal"
  data$special_color[indices1] <- "highlight1"
  data$special_color[indices2] <- "highlight2"
  
  color_map <- c(
    "normal" = "white",   
    "highlight1" = "#8ccde3", 
    "highlight2" = "pink"
  )
  
  # 2. Draw a ring
  ring = ggplot(data, aes(
    ymax = ymax,        # Control the arc length 
    ymin = ymin,
    xmax = max_location, # Control the arc height
    xmin = min_location,
    fill = category
  )) +
    geom_rect(aes(fill = special_color), color = "black", size = 0.8) +
    scale_fill_manual(values = color_map) +
    coord_polar(theta = "y")  +
    xlim(c(0, max_location + 0.5))+
    theme_minimal() +  
    theme(
      axis.title = element_blank(),  
      axis.text.x = element_blank(),  
      axis.text.y = element_blank(),  
      axis.ticks = element_blank(),   
      panel.grid = element_line(color = "#8ccde3", size = 0.2, linetype = 2),
      legend.position = "none"
    )+
    geom_text(aes(x = (min_location + max_location)/2, 
                  y = labelPosition, 
                  label = category),
              parse = TRUE,
              color = "black",
              angle = angle,
              size = 2.5)
  
  return(ring)
}


