#' @importFrom ggplot2 waiver is.waive


is.waive <- function (x) inherits(x, "waiver")
waiver <- ggplot2::waiver
