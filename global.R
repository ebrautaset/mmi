library(dplyr)
library(ggplot2)
library(scales)
library(readr)
library(haven)

mmi <- read_delim("mmi.csv", ";", escape_double = FALSE, 
                  trim_ws = TRUE)

mmi$date <- as.Date(mmi$Dato,"%m/%d/%y")

mmi$Ap <- mmi$Ap/100
mmi$Høyre <- mmi$Høyre/100
mmi$Frp <- mmi$Frp/100
mmi$KrF <- mmi$KrF/100
mmi$Venstre <- mmi$Venstre/100
mmi$MDG <- mmi$MDG/100
mmi$Rødt <- mmi$Rødt/100
mmi$SV <- mmi$SV/100
mmi$Sp <- mmi$Sp/100