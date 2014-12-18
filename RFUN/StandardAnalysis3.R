# USEFUL FUNCTIONS FOR DATA ANALYSIS
# by Alcides Chaux, M.D.
# This work is licensed under a Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License

# Defining the function "descriptive" for estimating mean, sd, median, and iqr
        # The function requires x in dfrm$var format
        # x must be numerical or integer
descriptive <- function(x, ...){ 
        a <- mean(x, na.rm = TRUE)
        b <- sd(x, na.rm = TRUE)
        c <- quantile(x, .5, na.rm = TRUE)
        d <- IQR(x, na.rm = TRUE)
        e <- min(x, na.rm = TRUE)
        f <- max(x, na.rm = TRUE)
        g <- round(rbind(a, b, c, d, e, f), digits = 1)
        final <- matrix(data = g, dimnames = list(c("Mean", "SD", "Median", "IQR", "Min", "Max"),
                                                  c("Values")))
        print(final)
}
# Defining the function "table.prop" which provides counts and percentages of
        # a single variable factor
        # The function requires x in dfrm$var format
table.prop <- function(x){
        a <- table(x, useNA = "ifany")
        b <- 100*round(prop.table(a), digits = 3)
        c <- cbind(Count = a, Percentages = b)
        print(c)
}

# Defining the function "compare.mw" which shows the median and IQR of
        # x by y and provides the P value from the Mann-Whitney test
        # x corresponds to the numerical/integer variable
        # y corresponds to the factor (grouping) variable
        # The function requires x and y in dfrm$var format
compare.mw <- function(x, y){
        a <- tapply(x, INDEX = y, FUN = median, na.rm = TRUE)
        b <- tapply(x, INDEX = y, FUN = IQR, na.rm = TRUE)
        c <- wilcox.test(x ~ y)
        d <- round(cbind(Median = a, IQR = b), digits = 1)
        print(d)
        cat("\nMann-Whitney's P value =", c$p.value)
}

# Defining the function "compare.mw2" which shows the median and IQR of
# x by y and provides the P value from the Mann-Whitney test
# x and y correspond to numerical/integer variables
# The function requires x and y in dfrm$var format
compare.mw2 <- function(x, y){
        xa <- median(x, na.rm = TRUE)
        xb <- IQR(x, na.rm = TRUE)
        ya <- median(y, na.rm = TRUE)
        yb <- IQR(y, na.rm = TRUE)
        c <- wilcox.test(x, y)
        d <- matrix(c(xa, ya, xb, yb), nrow = 2, ncol = 2,
                    dimnames = list(c("Var #1", "Var #2"), c("Median", "IQR")))
        print(d)
        cat("\nMann-Whitney's P value =", c$p.value)
}

# Defining the function "compare.kw" which shows the median, IQR, mean, SD, min/max of
# x by y and provides the P value from the Kruskal-Wallis test
# x corresponds to the numerical/integer variable
# y corresponds to the factor (grouping) variable
# The function requires x and y in dfrm$var format
compare.kw <- function(x, y){
        a <- tapply(x, INDEX = y, FUN = median, na.rm = TRUE)
        b <- tapply(x, INDEX = y, FUN = IQR, na.rm = TRUE)
        c <- tapply(x, INDEX = y, FUN = mean, na.rm = TRUE)
        d <- tapply(x, INDEX = y, FUN = sd, na.rm = TRUE)
        e <- tapply(x, INDEX = y, FUN = min, na.rm = TRUE)
        f <- tapply(x, INDEX = y, FUN = max, na.rm = TRUE)
        g <- kruskal.test(x ~ y)
        h <- round(cbind(Median = a, IQR = b, Mean = c, SD = d, Min = e, Max = f), digits = 1)
        print(h)
        cat("\nKruskal-Wallis's P value =", g$p.value)
}

# Defining the function "compare.fisher" which shows the table of contingency of
        # x by y and provides de P value from the Fisher's exact test
        # x and y must be factor variables
compare.fisher <- function(x, y){
        cat("**Table of Frequencies**\n")
                a <- table(Row = x, Column = y)
                print(a)
        cat("\n**Row Percentages**\n")
                b <- round(100*(prop.table(a, 1)))
                print(b)
        cat("\n**Column Percentages**\n")
                c <- round(100*(prop.table(a, 2)))
                print(c)
        
                d <- fisher.test(x, y)
                cat("\nFisher's P value =", d$p.value)
}

# Defining the function "logistic" which provides the OR, 95% CI and P values of a
        # logistic regression model
        # x must be a formula type
        # The function requires the specification of the data.frame
logistic <- function(x, data){
        model <- glm(x, data = data, family = binomial)
        a <- exp(cbind("Odds Ratio" = coef(model), confint(model))) # OR & 95% CI
        b <- summary(model)$coeff[,4] # P values
        print(cbind(a, "P value" = b))
}

# Defining the function "logistic2" which provides the OR, 95% CI and P values of a
# logistic regression model, showing only the main variable
# x must be a formula type
# The function requires the specification of the data.frame
logistic2 <- function(x, data){
        model <- glm(x, data = data, family = binomial)
        a <- exp(cbind("Odds Ratio" = coef(model), confint(model))) # OR & 95% CI
        b <- summary(model)$coeff[,4] # P values
        c <- cbind(a, "P value" = b)
        d <- c[2,] # The main variable should be inmediately after the ~ sign
        print(d)
}

# Defining the function "hazard" which provides the HR, 95% CI and P values of a
        # proportional hazards Cox regression model
        # x must be a a formula object, with the response on the left of a ~ operator
        # The response must be a survival object as returned by the Surv function
        # The function requires the specification of the data.frame
hazard <- function(x, data){
        require(survival)
        model <- coxph(x, data = data)
        a <- summary(model)$coefficients[, 2] # HR
        b <- summary(model)$conf.int[, 3] # Lower 95% CI
        c <- summary(model)$conf.int[, 4] # Upper 95% CI
        d <- summary(model)$coefficients[, 5] # P values
        print(cbind("Hazard Ratio" = a, "Lower 95% CI" = b,
                    "Upper 95% CI" = c, "P value" = d))
}

# Defining the function "hazard2" which provides the HR, 95% CI and P values of a
# proportional hazards Cox regression model, showing only the main variable
# x must be a a formula object, with the response on the left of a ~ operator
# The response must be a survival object as returned by the Surv function
# The function requires the specification of the data.frame
hazard2 <- function(x, data){
        require(survival)
        model <- coxph(x, data = data)
        a <- summary(model)$coefficients[, 2] # HR
        b <- summary(model)$conf.int[, 3] # Lower 95% CI
        c <- summary(model)$conf.int[, 4] # Upper 95% CI
        d <- summary(model)$coefficients[, 5] # P values
        e <- cbind("Hazard Ratio" = a, "Lower 95% CI" = b,
                    "Upper 95% CI" = c, "P value" = d)
        f <- e[1, ] # The main variable should be inmediately after the ~ sign
        print(f)
}