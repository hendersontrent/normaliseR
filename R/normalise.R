#' Scale each feature vector into a user-specified range for visualisation and modelling
#'
#' `normalise()` and `normalize()` are synonyms.
#'
#' @importFrom rlang .data
#' @importFrom scales rescale
#' @importFrom dplyr %>% group_by mutate ungroup
#' @param data either a \code{feature_calculations} object containing the raw feature matrix produced by \code{theft::calculate_features} or a \code{vector} of class \code{numeric} containing values to be rescaled
#' @param norm_method \code{character} denoting the rescaling/normalising method to apply. Can be one of \code{"zScore"}, \code{"Sigmoid"}, \code{"RobustSigmoid"}, \code{"MinMax"}, or \code{"MaxAbs"}. Defaults to \code{"zScore"}
#' @param unit_int \code{Boolean} whether to rescale into unit interval \code{[0,1]} after applying normalisation method. Defaults to \code{FALSE}
#' @return either an object of class \code{feature_calculations} object or a \code{numeric} vector depending on the data type supplied to \code{data}
#' @author Trent Henderson
#' @export
#'

normalise <- function(data, norm_method = c("zScore", "Sigmoid", "RobustSigmoid", "MinMax", "MaxAbs"), unit_int = FALSE){

  norm_method <- match.arg(norm_method)

  if(norm_method == "zScore"){
    norm_method <- "zScore" # Old version from {theft}
  }

  if(inherits(data, "feature_calculations")){

    normed <- data %>%
      dplyr::group_by(.data$names)

    if(norm_method == "zScore"){
      normed <- normed %>%
        dplyr::mutate(values = zscore_scaler(.data$values))
    }

    if(norm_method == "Sigmoid"){
      normed <- normed %>%
        dplyr::mutate(values = sigmoid_scaler(.data$values))
    }

    if(norm_method == "RobustSigmoid"){
      normed <- normed %>%
        dplyr::mutate(values = robustsigmoid_scaler(.data$values))
    }

    if(norm_method == "MinMax"){
      normed <- normed %>%
        dplyr::mutate(values = minmax_scaler(.data$values))
    }

    if(norm_method == "MaxAbs"){
      normed <- normed %>%
        dplyr::mutate(values = maxabs_scaler(.data$values))
    }

    if(unit_int){
      normed <- normed %>%
        dplyr::mutate(values = scales::rescale(.data$values, to = c(0, 1)))
    }

    normed <- normed %>%
      dplyr::ungroup()

  } else{

    stopifnot(class(data) == "numeric")

    if(norm_method == "zScore"){
      normed <- zscore_scaler(data)
    }

    if(norm_method == "Sigmoid"){
      normed <- sigmoid_scaler(data)
    }

    if(norm_method == "RobustSigmoid"){
      normed <- robustsigmoid_scaler(data)
    }

    if(norm_method == "MinMax"){
      normed <- minmax_scaler(data)
    }

    if(norm_method == "MaxAbs"){
      normed <- maxabs_scaler(data)
    }

    if(unit_int){
      normed <- scales::rescale(normed, to = c(0, 1))
    }
  }

  return(normed)
}

# Alternate spelling version

#' @rdname normalise
#' @export
normalize <- normalise
