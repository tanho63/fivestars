#' Add a star
#' 
#' This function creates an HTML tag with the appropriate number of stars, as well as an accessibility label.
#'
#' @param rating rating out of five
#' @param label text to display in tag, defaults to the rating rounded to one decimal place
#' @param aria_label accessibility label for text
#' @param label_pos "left" or "right" - position of label relative to stars
#' @param star_size CSS font-size for star background, default is to inherit from `use_fivestars()`
#' @param star_color CSS colour for stars, default is to inherit from `use_fivestars()`
#' @param star_background CSS colour for star background, default is to inherit from `use_fivestars()`
#' 
#' @examples 
#' use_fivestars()
#' fivestars(3.5)
#' 
#' @return an html tag that renders a star rating out of five 
#' @export
fivestars <- function(rating,
                     label = round(rating,1),
                     aria_label = paste("The rating is", round(rating,1), "out of five stars"),
                     label_pos = "left",
                     star_size = NULL,
                     star_color = NULL,
                     star_background = NULL){
  stopifnot(
    is.numeric(rating),
    !is.na(rating))
  
  label_pos <- match.arg(label_pos, c("left","right"))
  
  left_label <- NULL
  right_label <- NULL
  
  switch(label_pos,
         "left" = left_label <- label,
         "right" = right_label <- label)
  
  style_args <- list(`--rating` = rating, 
                     `--star-size` = star_size, 
                     `--star-color` = star_color, 
                     `--star-background` = star_background)
  
  style_args <- drop_nulls(style_args)
  
  style <- paste0(paste(names(style_args),style_args,sep = ": ",collapse = "; "),";")
  
  htmltools::div(
    left_label,
    htmltools::tags$span(
      class = "fivestars",
      style = style,
      `aria-label` = aria_label
    ),
    right_label)
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