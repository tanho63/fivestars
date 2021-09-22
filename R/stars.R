#' Add a star
#' 
#' This function creates an HTML tag with the appropriate number of stars, as well as an accessibility label.
#'
#' @param rating rating out of five
#' @param text text to display in tag, defaults to the rating rounded to one decimal place
#' @param aria_label accessibility label for text, defaults to "rating 
#' @param star_size CSS font-size for star background, default is to inherit from `use_fivestars()`
#' @param star_color CSS colour for stars, default is to inherit from `use_fivestars()`
#' @param star_background CSS colour for star background, default is to inherit from `use_fivestars()`
#' 
#' @examples 
#' fivestar(3.5)
#' 
#' @return an html tag that renders a star rating out of five 
#' @export
fivestar <- function(rating,
                     text = round(rating,1),
                     aria_label = paste("The rating out of five stars is", text),
                     star_size = NULL,
                     star_color = NULL,
                     star_background = NULL){
  
  stopifnot(
    is.numeric(rating),
    !is.na(rating))
  
  style_args <- list(`--rating` = rating, 
                     `--star_size` = star_size, 
                     `--star_color` = star_color, 
                     `--star_background` = star_background)
  
  style_args <- drop_nulls(style_args)
  
  style <- paste0(paste(names(style_args),style_args,sep = ": ",collapse = "; "),";")
  
  htmltools::tags$span(
    text,
    class = "fivestars",
    style = style,
    `aria-label` = aria_label
  )
}

#' Add stars CSS
#'
#' This function adds the appropriate CSS to your page for star ratings.
#' 
#' @param star_size CSS font size for your stars, default is `"larger"`
#' @param star_color CSS colour for star, default is `#fc0`
#' @param star_background CSS colour for star background, default is `#999`
#' 
#' @examples 
#' use_fivestars()
#' 
#' @return HTML that inserts CSS into the page head
#' @export
use_fivestars <- function(star_size = "larger", star_color = "#fc0", star_background = "#999"){
  
  stopifnot(
    !is.na(star_size),
    !is.na(star_color),
    !is.na(star_background),
    is.character(star_size),
    is.character(star_color),
    is.character(star_background)
  )
  
    htmltools::tags$style(
      htmltools::HTML(
        glue::glue("
          :root {
            --star-size: {{star_size}};
            --star-background: {{star_background}};
            --star-color: {{star_color}};
          }
        
          .fivestars {
            --percent: calc(var(--rating)/5 * 100%);
            /* display: inline-block; */
            font-size: var(--star-size);
            line-height: 1;
          }
          
          .fivestars::before {
            content: '\\2605\\2605\\2605\\2605\\2605';
            background: linear-gradient(90deg, var(--star-color) var(--percent), 
                                        var(--star-background) var(--percent));
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
          }
          ",
          .open = "{{",
          .close = "}}"
        )
      )
    )
  
}