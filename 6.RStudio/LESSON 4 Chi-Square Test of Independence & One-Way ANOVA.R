# LESSON 4: Chi-Square Test of Independence & One-Way ANOVA

# 1. Chi-Square Test of Independence

# Create the observed contingency table
outcome_table <- matrix(c(32, 8,
                          20, 20),
                        nrow = 2, byrow = TRUE)
rownames(outcome_table) <- c("Online", "Traditional")
colnames(outcome_table) <- c("Pass", "Fail")
outcome_table   # view the table

# Pearson chi-square test without Yates correction
chi_result <- chisq.test(outcome_table, correct = FALSE)
chi_result

# Check expected counts and standardised residuals
chi_result$expected   # counts expected if variables were independent
chi_result$stdres     # standardised residuals

# Row percentages
prop.table(outcome_table, margin = 1) * 100   # pass/fail rate per row

# Effect size: Cramer's V
cramers_v <- sqrt(unname(chi_result$statistic) /
                    sum(outcome_table))
cramers_v   # strength of association


# 2. One-Way Analysis of Variance (ANOVA)

# Create group and score variables
teaching_method <- factor(c(rep("Online", 10),
                            rep("Traditional", 10),
                            rep("Blended", 10)))
exam_score <- c(72, 74, 75, 76, 77, 78, 79, 80, 81, 82,     # Online
                64, 66, 68, 69, 70, 71, 72, 73, 74, 75,     # Traditional
                82, 83, 84, 85, 86, 87, 88, 89, 90, 91)     # Blended

anova_data <- data.frame(teaching_method, exam_score)

# Descriptive statistics and visual inspection
aggregate(exam_score ~ teaching_method, anova_data, mean)   # group means
aggregate(exam_score ~ teaching_method, anova_data, sd)     # group SDs
boxplot(exam_score ~ teaching_method, data = anova_data,
        xlab = "Teaching Method", ylab = "Exam Score")      # visual comparison

# Fit the one-way ANOVA model
anova_model <- aov(exam_score ~ teaching_method,
                   data = anova_data)
summary(anova_model)   # F-test result

# Check assumptions
shapiro.test(residuals(anova_model))                # normality of residuals
bartlett.test(exam_score ~ teaching_method,
              data = anova_data)                    # equal variances check

# Post-hoc comparisons and effect size
TukeyHSD(anova_model)   # which specific groups differ
anova_table <- summary(anova_model)[[1]]
eta_squared <- anova_table["teaching_method", "Sum Sq"] /
  sum(anova_table[, "Sum Sq"])
eta_squared   # proportion of variance explained