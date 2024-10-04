options(repos = "http://cran.us.r-project.org")
#    install.packages("remotes")
#    remotes::install_version("rlang", "1.1.2")
#after installing docker container was 0.4.6 / 1.0.0 -> after  install.packages("dplyr",dependencies=TRUE) -> 1.1.2/1.1.4
    install.packages("dplyr",dependencies=TRUE)
    install.packages("remotes")
    remotes::install_version("dplyr", "1.1.4")
#after installing docker container was 0.4.6 / 1.0.0 -> after  install.packages("dplyr",dependencies=TRUE) -> 1.1.2/1.1.4
#    install.packages("dplyr",dependencies=TRUE)
  install.packages("aws.s3")
  install.packages("openxlsx")
  install.packages("ggplot2")
  install.packages("nnls")
