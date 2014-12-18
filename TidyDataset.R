### Below is the R code that was used for building the working dataset

# Loading the libraries and functions that will be used
library(foreign) # For reading STATA data
library(plyr) # for revalue and rename

# Loading the STATA dataset
penis.full <- read.dta("../penile tma 6-11-14 stata 12.dta", convert.underscore = TRUE)

# Selecting clinicopathologic variables from the full dataset
clinicopath <- c("age", "race", "invasive", "site", "subtype", "grade", "level", "thick",
                 "urethra", "lvi", "pni", "hpv.pos", "nodes", "date.lymph.mo",
                 "dissection.type", "tnm.tumor", "tnm.nodes", "stage", "treatment",
                 "chemo", "radio", "recurrence", "date.recurrence.mo", "progression",
                 "date.progression.mo", "mets", "date.met.mo", "outcome", "dead",
                 "died.disease", "fu.last.mo")

# Selecting markers from the full dataset
markers <- c("pten.c.median.h", "pakt.median.h", "mtor.median.h", "ps6.median.h",
             "p4ebp1.median.h", "p27.median.h")

# Creating the dataset using the selected clinicopathologic variables and markers
penis.all <- penis.full[c(clinicopath, markers)]

# Recoding levels
penis.all$grade <- revalue(as.factor(penis.all$grade), c(
        "1" = "Grade 1",
        "2" = "Grade 2",
        "3" = "Grade 3"
))
penis.all$subtype <- gsub(pattern = " SCC", replacement = "", x = penis.all$subtype)
penis.all$subtype <- revalue(penis.all$subtype, c(
        "Other Subtype" = "Others",
        "Warty-Basaloid" = "WB"
))
penis.all$subtype <- as.factor(penis.all$subtype)
penis.all$level <- revalue(penis.all$level, c(
        "Corpus Spongiosum/Dartos" = "CS-Dartos",
        "Corpus Cavernosum/Preputial Skin" = "CC-Skin",
        "Adjacent Structures" = "Other"
))
penis.all$thick <- revalue(penis.all$thick, c(
        "< 5mm" = "Less than 5 mm",
        ">10 mm" = "More than 10 mm"
))
# Renaming variables
penis.all <- rename(penis.all, c(
        "pten.c.median.h" = "PTEN",
        "pakt.median.h" = "AKT", 
        "mtor.median.h" = "mTOR", 
        "ps6.median.h" = "pS6", 
        "p4ebp1.median.h"= "EBP1", 
        "p27.median.h" = "p27"
))

# Selecting only invasive cases and dropping unused levels
penis.data <- subset(penis.all, invasive == "Yes", select = -invasive)
penis.data <- droplevels(penis.data)

# Saving the dataset that is used for analysis
write.csv(penis.data, "PenisDataset.csv")