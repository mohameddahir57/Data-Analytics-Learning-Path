# LESSON 3: Pearson Correlation & Simple Linear Regression

# Practice Dataset: Study Hours and Exam Score (12 students)
study_hours <- c(2, 3, 4, 5, 6, 7, 8, 3, 5, 6, 7, 9)
exam_score  <- c(55, 60, 64, 69, 74, 78, 83, 58, 68, 73, 79, 88)

cor_data <- data.frame(study_hours, exam_score)   # combine into one data frame

# 1. Pearson Correlation

# Visualise the relationship first
plot(cor_data$study_hours, cor_data$exam_score,
     xlab = "Study Hours", ylab = "Exam Score",
     main = "Study Hours and Exam Score")   # scatterplot to check linearity

# Correlation coefficient only
cor(cor_data$study_hours, cor_data$exam_score,
    method = "pearson")   # gives just the r value

# Correlation significance test and confidence interval
cor.test(cor_data$study_hours, cor_data$exam_score,
         method = "pearson")   # gives r, p-value, and confidence interval


# 2. Simple Linear Regression

# Use the same study-hours dataset
regression_model <- lm(exam_score ~ study_hours,
                       data = cor_data)   # fits the regression line

# Full model output
summary(regression_model)   # shows coefficients, R-squared, p-values

# Regression coefficients and confidence intervals
coef(regression_model)      # b0 (intercept) and b1 (slope)
confint(regression_model)   # confidence intervals for the coefficients