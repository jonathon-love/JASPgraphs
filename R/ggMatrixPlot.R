addVerticalLabels <- function(totalGraph, graphs2add, x, yIncrement, width, height, yOffset = 0) {
    
    for (i in seq_along(graphs2add)) {
        if (!is.null(graphs2add[[i]])) {
            totalGraph <- totalGraph + 
                cowplot::draw_plot(graphs2add[[i]], 
                                   x = x, 
                                   y = yOffset + yIncrement * (i-1), 
                                   width = width, 
                                   height = height)
        }
    }
    return(totalGraph)
}

addHorizontalLabels <- function(totalGraph, graphs2add, y, xIncrement, width, height, xOffset = 0) {

    for (i in seq_along(graphs2add)) {
        if (!is.null(graphs2add[[i]])) {
            totalGraph <- totalGraph + 
                cowplot::draw_plot(graphs2add[[i]], 
                                   x = xOffset + xIncrement * (i-1), 
                                   y = y, 
                                   width = width, 
                                   height = height)
        }
    }
    return(totalGraph)
}

addCenterPlots <- function(totalGraph, plotMatrix, xIncrement, yIncrement, xOffset, yOffset) {
    
    for (i in seq_len(nrow(plotMatrix))) {
        for (j in seq_len(ncol(plotMatrix))) {
            if (!is.null(plotMatrix[[i, j]])) {
                totalGraph <- totalGraph + 
                    cowplot::draw_plot(plotMatrix[[i, j]], 
                                       x = xOffset + xIncrement * (j-1), 
                                       y = yOffset + yIncrement * (i-1), 
                                       width = xIncrement, 
                                       height = yIncrement)
            }
        }
    }
    return(totalGraph)
    
}

makeRect <- function(col = "red", size = 2, fill = scales::alpha("black", 0)) {
    
    # this function exists for debugging purposes
    
    dfrect <- data.frame(xmin = 0, xmax = 1, ymin = 0, ymax = 1)
    
    return(invisible(
        ggplot(data = dfrect, aes(xmin = xmin, xmax = xmax, ymin = ymin, ymax = ymax)) + 
            geom_rect(fill = fill, size = size, color = col) + 
            theme_void()
    ))
}

makeLabel <- function(label, angle = 0, size = 1, family = "serif") {
    
    # draws text in center (!) of plot.
    df <- data.frame(x=0, y=0.0)
    parse <- is.call(label)
    if (!parse) {
        df$label <- label
    } else {
        eq <- as.character(as.expression(label))
        df$label <- eq
    }
    
    return(
        ggplot(df, aes(x, y, label = label)) +
            geom_text(angle = angle, size = size, family = family, parse = parse) +
            theme_void()
    )
}


#' @export
ggMatrixPlot <- function(plotList = NULL, nr, nc,
    addRightLabels = FALSE,
    addBottomLabels = FALSE,
    debug = TRUE) {
    
    # todo: add "addLeftLabels" and "addTopLabels"
    
    if (is.null(plotList) && debug) {

        labelsLeftRow <- lapply(seq_len(nr), function(x) makeRect())
        labelsRightRow <- lapply(seq_len(nr), function(x) makeRect("navajowhite4"))
        labelsTopCol <- lapply(seq_len(nc), function(x) makeRect("blue"))
        labelsBottomCol <- lapply(seq_len(nc), function(x) makeRect("orange"))
        plotMatrix <- lapply(seq_len(nc*nr), function(x) makeRect("green", fill = scales::alpha("springgreen", .5)))
        dim(plotMatrix) <- c(nr, nc)

    } else {
    
        # todo
    }

    firstColHeight <- .1
    firstRowWidth <- .1

    firstColWidth <- (1 - firstRowWidth*(addRightLabels+1)) / nc
    firstRowHeight <- (1 - firstRowWidth*(addBottomLabels+1)) / nr
    
    # empty plot
    totalGraph <- cowplot::ggdraw(xlim = c(0, 1), ylim = c(0, 1))
    # labels left of plots
    totalGraph <- addVerticalLabels(totalGraph,
                                    graphs2add = labelsLeftRow,
                                    x = 0, 
                                    yIncrement = firstRowHeight, 
                                    width = firstRowWidth,
                                    height = firstRowHeight,
                                    yOffset = addBottomLabels*firstColHeight)
    # labels above plots
    totalGraph <- addHorizontalLabels(totalGraph, 
                                      graphs2add = labelsTopCol,
                                      y = 1 - firstColHeight, 
                                      xIncrement = firstColWidth, 
                                      width = firstColWidth, 
                                      height = firstColHeight,
                                      xOffset = firstRowWidth)
    
    if (addRightLabels) { # labels right of plots
        totalGraph <- addVerticalLabels(totalGraph, 
                                        graphs2add = labelsRightRow,
                                        x = 1 - firstRowWidth, 
                                        yIncrement = firstRowHeight, 
                                        width = firstRowWidth,
                                        height = firstRowHeight,
                                        yOffset = addBottomLabels*firstColHeight)
    }
    
    if (addBottomLabels) { # labels below plots
        totalGraph <- addHorizontalLabels(totalGraph,
                                          graphs2add = labelsBottomCol,
                                          y = 0, 
                                          xIncrement = firstColWidth, 
                                          width = firstColWidth, 
                                          height = firstColHeight,
                                          xOffset = firstRowWidth)
    }
    
    # actually include plots
    totalGraph <- addCenterPlots(totalGraph, plotMatrix,
                                 xIncrement = firstColWidth, 
                                 yIncrement = firstRowHeight, 
                                 xOffset = firstRowWidth,
                                 yOffset = addBottomLabels*firstColHeight)
    return (totalGraph)
    
}

