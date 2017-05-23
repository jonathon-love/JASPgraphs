# setwd("C:/Users/donvd/_Laptop/tempStackoverflow/ggplot2/")
# library(ggplot2)
# library(grid)
#
# graph = ggplot(faithful, aes(x = eruptions, y = waiting)) +
#     geom_point() +
#     theme(
#         # tick width, a bit exaggerated as example
#         axis.ticks = element_line(size = 5, color = "gray")
#     )
# graph # graph with no axis lines
#
# gb = ggplot_build(graph)
# xLim = range(gb$layout$panel_ranges[[1]]$x.major_source)
# yLim = range(gb$layout$panel_ranges[[1]]$y.major_source)
#
# graph +
#     geom_segment(y = -Inf, yend = -Inf, x = xLim[1], xend = xLim[2]) +
#     geom_segment(x = -Inf, xend = -Inf, y = yLim[1], yend = yLim[2])
#
# xLim = range(gb$layout$panel_ranges[[1]]$x.major_source)
# yLim = range(gb$layout$panel_ranges[[1]]$y.major_source)
#
# uType = "npc"
# uType2 = "mm"
# xr = diff(gb$layout$panel_ranges[[1]]$x.range) /2
# yr = diff(gb$layout$panel_ranges[[1]]$y.range) /2
#
# xLim[1] = convertWidth(unit(xLim[1], "native") - unit(2.5, uType2),
#                        unitTo = "native", valueOnly = TRUE)
#
# xLim[1] = xLim[1] - convertWidth(unit(2.5, units = uType2),
#                       unitTo = uType, valueOnly = TRUE) * xr
# xLim[2] = xLim[2] +  convertWidth(unit(2.5, units = uType2),
#                       unitTo = uType, valueOnly = TRUE) * xr
#
# yLim[1] = yLim[1] - convertHeight(unit(2.5, units = uType2),
#                              unitTo = uType, valueOnly = TRUE) * yr
# yLim[2] = yLim[2] + convertHeight(unit(2.5, units = uType2),
#                              unitTo = uType, valueOnly = TRUE) * yr
#
#
# setwd("C:/Users/donvd/Desktop/")
# cairo_pdf("Rplot000.pdf", width = 12, height = 7)
# graph +
#     geom_segment(y = -Inf, yend = -Inf, x = xLim[1], xend = xLim[2]) +
#     geom_segment(x = -Inf, xend = -Inf, y = yLim[1], yend = yLim[2])
# dev.off()
#
#
# xLim = range(gb$layout$panel_ranges[[1]]$x.major_source)
# yLim = range(gb$layout$panel_ranges[[1]]$y.major_source)
#
# uType = "npc"
# uType2 = "mm"
#
# xLim[1] = xLim[1] - convertWidth(unit(2.5, units = uType2),
#                                  unitTo = uType, valueOnly = TRUE)
# xLim[2] = xLim[2] +  convertWidth(unit(2.5, units = uType2),
#                                   unitTo = uType, valueOnly = TRUE)
#
# yLim[1] = yLim[1] - convertHeight(unit(2.5, units = uType2),
#                                   unitTo = uType, valueOnly = TRUE)
# yLim[2] = yLim[2] - convertHeight(unit(2.5, units = uType2),
#                                   unitTo = uType, valueOnly = TRUE)
#
# setwd("C:/Users/donvd/Desktop/")
# cairo_pdf("Rplot.pdf")
# graph +
#     geom_segment(y = -Inf, yend = -Inf, x = xLim[1], xend = xLim[2]) +
#     geom_segment(x = -Inf, xend = -Inf, y = yLim[1], yend = yLim[2])
# dev.off()
#
# # xLim[1] = xLim[1] * (1 - convertUnit(unit(1, units = uType2),
# #                       unitTo = uType, valueOnly = TRUE,
# #                       axisTo = "x", axisFrom = "x",
# #                       typeFrom = "location", typeTo = "location"))
# # xLim[2] = xLim[2] * (1 +  convertUnit(unit(1, units = uType2),
# #                       unitTo = uType, valueOnly = TRUE,
# #                       axisTo = "x", axisFrom = "x",
# #                       typeFrom = "location", typeTo = "location"))
# #
# # yLim[1] = yLim[1] * (1 - convertUnit(unit(1, units = uType2),
# #                       unitTo = uType, valueOnly = TRUE,
# #                       axisTo = "y", axisFrom = "y",
# #                       typeFrom = "location", typeTo = "location" ))
# # yLim[2] = yLim[2] * (1 + convertUnit(unit(1, units = uType2),
# #                       unitTo = uType, valueOnly = TRUE,
# #                       axisTo = "y", axisFrom = "y",
# #                       typeFrom = "location", typeTo = "location"))
#
# # xLim[1] = xLim[1] - convertUnit(unit(1, units = uType2),
# #                       unitTo = uType, valueOnly = TRUE,
# #                       axisTo = "x", axisFrom = "x",
# #                       typeFrom = "location", typeTo = "location")
# # xLim[2] = xLim[2] +  convertUnit(unit(1, units = uType2),
# #                       unitTo = uType, valueOnly = TRUE,
# #                       axisTo = "x", axisFrom = "x",
# #                       typeFrom = "location", typeTo = "location")
#
# # yLim[1] = yLim[1] * (1 - convertUnit(unit(1, units = uType2),
# #                       unitTo = uType, valueOnly = TRUE,
# #                       axisTo = "y", axisFrom = "y",
# #                       typeFrom = "location", typeTo = "location" ))
# # yLim[2] = yLim[2] * (1 + convertUnit(unit(1, units = uType2),
# #                       unitTo = uType, valueOnly = TRUE,
# #                       axisTo = "y", axisFrom = "y",
# #                       typeFrom = "location", typeTo = "location"))
#
