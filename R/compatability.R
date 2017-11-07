# this file exists because ggplot has a habit of changing standard over time

getMajorSource <- function(gb) {

    # gb: output from ggplot2::ggbuild(ggplot)
     return(
        switch (graphOptions("ggVersion"),
            "2.2.1.9000" = list(
                x = gb$layout$panel_params[[1]]$x.major_source,
                y = gb$layout$panel_params[[1]]$y.major_source
            ),
            list(
                x = gb$layout$panel_ranges[[1]]$x.major_source,
                y = gb$layout$panel_ranges[[1]]$y.major_source
            )
        )
    )

}

getRanges <- function(gb) {

    return(
        switch (graphOptions("ggVersion"),
            "2.2.1.9000" = list(
                x = gb$layout$panel_params[[1]]$x.range,
                y = gb$layout$panel_params[[1]]$y.range
            ),
            list(
                x = gb$layout$panel_ranges[[1]]$x.range,
                y = gb$layout$panel_ranges[[1]]$y.range
            )
        )
    )


}
