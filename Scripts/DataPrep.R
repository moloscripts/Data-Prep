# Examining the contents of the Data Frame ####

library(tidyverse)
library(inspectdf)
library(naniar)

# Data understanding ####
dim(data)
str(data)
head(data)
tail(data)

# Handling of missing values ####

## View count of missing values per dataframe
colSums(is.na(data))

# functions for checking missing values using naniar package
miss_var_summary(data)
gg_miss_var(data)




# Load the tidyverse package and run the glimpse function
library(tidyverse)
glimpse(data)

# Load the library skim
library(skimr)
skim(data)

# Subsetting ####
NewDF <- data[1:10,]
dim(NewDF)

DemographicsDF <- data[, 29:57]
names <- c(4, 6)
DemographicsDF[, names] <- lapply(DemographicsDF[, names], factor)
str(DemographicsDF)

# Code to remove the pattern 
pattern_to_remove <- paste0("a14_", collapse = "|")
names(DemographicsDF) <- gsub(pattern_to_remove, "", names(DemographicsDF))
View(DemographicsDF)

Languages.Read.table <-  DemographicsDF %>%
  select(14:28) %>%
  summarise_all(sum, na.rm=TRUE)%>%
  gather(language, count) %>%
  arrange(desc(count))

View(Languages.Read.table)