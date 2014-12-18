# NICE PLOTS :-)
# by Alcides Chaux, M.D.
# This work is licensed under a Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License

# NiceColors
nice.colors <- function(n) {
        hues <- seq(15, 375, length = n+1)
        hcl(h = hues, l = 65, c = 100)[1:n]
}

# To Show the NiceColors names
nice.colors.names <- function(n){
        scales:::show_col(nice.colors(n))
}

# VARIABLE: Numerical, Single group
# PLOT: Histogram + Boxplot
plot.numerical <- function(x, label){
        # Assigning descriptive statistics to variable
        Q1.x <- round(quantile(x, 0.25, na.rm = TRUE), 1)
        Q2.x <- round(median(x, na.rm = TRUE), 1)
        Q3.x <- round(quantile(x, 0.75, na.rm = TRUE), 1)
        max.x <- round(max(x, na.rm = TRUE), 1)
        min.x <- round(min(x, na.rm = TRUE), 1)
        # Plotting the data
        par(cex.lab = 1.5)
        hist(x, ylab = "Frequency", xlab = label, main = "",
             col = nice.colors(2)[1])
        boxplot(x, col = nice.colors(2)[2], ylab = label)
        # Adding the descriptive statistics to plot
        if (max.x > 0){text(x = 1.35, y = max.x, labels = paste("Max =", max.x))}
        if (Q1.x > 0){text(x = 0.65, y = Q1.x, labels = paste("Q1 =", Q1.x))}
        if (Q2.x > 0){text(x = 1.35, y = Q2.x, labels = paste("Q2 =", Q2.x))}
        if (Q3.x > 0){text(x = 0.65, y = Q3.x, labels = paste("Q3 =", Q3.x))}
        text(x = 1.35, y = min.x, labels = paste("Min =", min.x))
}

# VARIABLE: Categorical, single group
# PLOT: Barplot (v, h)
plot.categorical <- function(x, align, left = 4, ...){
        x.table <- table(x)
        max.value <- x.table[which.max(x.table)] + 5
        range <- c(0, max.value)
        nl <- nlevels(x)
        if (align == "v") {
                Plot <- barplot(x.table, col = nice.colors(nl),
                                ylab = "No. Patients", cex.lab = 1.25, ylim = range,
                                ...)
                text(Plot, paste("N =", x.table), y = x.table, pos = 3)
        }
        if (align == "h"){
                par(mar = c(5, left, 4, 2) + 0.1, las = 1)
                Plot <- barplot(x.table, col = nice.colors(nl),
                                horiz = TRUE,
                                xlab = "No. Patients", cex.lab = 1.25, xlim = range,
                                ...)
                text(Plot, paste("N =", x.table), x = x.table, pos = 4)
                par(mar = c(5, 4, 4, 2) + 0.1)
        }
        
}
# Defining a function to describe categorical variables using juxtaposed bars
# VARIABLE: Categorical, n-by-n table
# PLOT: Barplot (v, h)
plot.categorical.group <- function(x, y, align, left = 4, ...){
        par(mar = c(5, 4, 1, 2) + 0.1)
        xy.table <- table(x, y)
        max.value <- xy.table[which.max(xy.table)] + 0.33*xy.table[which.max(xy.table)]
        range <- c(0, max.value)
        nl <- nlevels(x)
        compare.fisher <- fisher.test(x, y)
        P <- format(compare.fisher$p.value, digits = 2, width = 6)
        if (align == "v"){
                plot <- barplot(xy.table, beside = TRUE, col = nice.colors(nl),
                                ylab = "No. Patients", cex.lab = 1.25, ylim = range,
                                legend.text = TRUE,
                                args.legend = list(x = "topright", bty = "n"),
                                ...)
                text(plot, paste(xy.table), y = xy.table, pos = 3)
                legend("topleft", bty = "n", paste("Fisher's exact test P value =", P))
        }
        if (align == "h"){
                par(mar = c(5, left, 4, 2) + 0.1, las = 1)
                plot <- barplot(xy.table, beside = TRUE, col = nice.colors(nl),
                                xlab = "No. Patients", cex.lab = 1.25, xlim = range,
                                horiz = TRUE,
                                legend.text = TRUE,
                                args.legend = list(x = "topright", bty = "n"),
                                ...)
                text(plot, paste(xy.table), x = xy.table, pos = 4)
                legend("right", bty = "n", paste("Fisher's exact test P value =", P))
        }
        par(mar = c(5, 4, 4, 2) + 0.1)
}

# Defining a function for boxplots and Kruskal-Wallis test
boxplot.kruskal <- function(x, y, ...){
        par(mar = c(5, 4, 1, 2))
        KW <- kruskal.test(x ~ y)
        max.value <- x[which.max(x)] + 0.1*x[which.max(x)]
        min.value <- x[which.min(x)]
        range <- c(min.value, max.value)
        nl <- nlevels(y)
        KW.plot <- boxplot(x ~ y,
                           cex.lab = 1.25, col = nice.colors(nl), 
                           ylim = range,
                           ...)
        legend("topleft", bty = "n",
               paste("Kruskal-Wallis test P value =", format(KW$p.value, digits = 2, width = 6)))
}
# Defining a function for mosaic plots with row proportions
mosaic.plot <- function(x, y, ...){
        xy <- table(x, y)
        xy.row <- 100*prop.table(xy, 1)
        xy.round <- round(xy.row, 1)
        mosaic(xy, shade = TRUE, pop = FALSE, ...)
        labeling_cells(text = xy.round, margin = 0)(xy)
}
# Defining a function for mosaic plots
compare.mosaic <- function(x, y, ...){
        par(mar = c(1, 1, 2, 1) + 0.1)
        mosaicplot(table(x, y), color = nice.colors,
                   xlab = "", ylab = "", cex.axis = 1, ...)
        par(mar = c(5, 4, 4, 2) + 0.1)
}

# Defining the survival.plot function for plotting survival curves
require(survival)
survival.plot <- function(x, fu, outcome, title, position = "topright", logrank = "bottomleft", ...){
        par(mar = c(5, 6, 4, 2) + 0.1)
        outcome <- as.numeric(outcome)
        survival.obj <- Surv(fu, outcome)
        survival.lr <- survdiff(survival.obj ~ x)
        survival.p <- pchisq(survival.lr$chisq, df = 1, lower = FALSE)
        survival.x <- survfit(survival.obj ~ x)
        plot(survival.x, cex = 2, main = title, cex.main = 1.75,
             xlab = "Follow-Up (Months)", ylab = "Survival Function", cex.lab = 1.5,
             col =c(1,2,4), mark = c(2,0,5), lty = c(2,1,3), ...)
        legend(x = position, legend = levels(x), pch = c(2,0,5), lty = c(2,1,3),
               col = c(1,2,4), bty = "n", cex = 1.25)
        legend(x = logrank, bty = "n", 
               paste("P value (log-rank test) =", format(survival.p, digits = 2, width = 6)),
               cex = 1.25)
        par(mar = c(5, 4, 4, 2) + 0.1)
        # For table
        survival.table <- summary(survival.x)$table[, c(1, 4, 5)]
        survival.table.matrix <- matrix(survival.table, ncol = 3,
                                        dimnames = list(c(levels(x)),
                                                        c("No. Observations",
                                                          "No. Events",
                                                          "Median Survival"))
               )
        kable(survival.table.matrix, align = c("c"))
}
# Forest plots of a logistic.table
# outcome should be binary factor
# predictors should be a list of independent variables
# varlables should be a vector of labels
logistic.plot <- function(outcome, predictors, varlabels){
        require(ggplot2)
        # Creating empty lists
        model <- list()
        OR.center <- list()
        OR.low <- list()
        OR.high <- list()
        # Filling up the empty lists
        for(i in 1:length(predictors)){
                model[[i]] <- glm(outcome ~ predictors[[i]], family = binomial)
                OR.center[[i]] <-format(exp(coef(model[[i]]))[2], digits = 1, nsmall = 1)
                OR.low[[i]] <- format(exp(confint(model[[i]]))[2, 1], digits = 1, nsmall = 1)
                OR.high[[i]] <- format(exp(confint(model[[i]]))[2, 2], digits = 1, nsmall = 1)
        }
        # Transforming lists into vectors
        OR.center <- unlist(OR.center)
        OR.low <- unlist(OR.low)
        OR.high <- unlist(OR.high)
        # Creating and printing the table
        OR.table <- cbind(OR.center, OR.low, OR.high)
        # Plotting the ORs
        ggplot(data = data.frame(OR.table),
               aes(x = varlabels, y = OR.center, ymin = OR.low, ymax = OR.high)) +
                geom_errorbar(width = 0.25, size = 0.75) + 
                geom_hline(y = 1, linetype = "longdash") +
                geom_point(size = 2, shape = 15) + 
                coord_flip() +
                xlab("") + ylab("Odds ratios") + 
                theme_classic(base_size = 15, base_family = "")
}