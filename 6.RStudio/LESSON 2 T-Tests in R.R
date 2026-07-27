# LESSON 2: t-Tests in R

# 1. One-Sample t-Test
score <- c(68, 72, 76, 80, 90, 92, 84, 84, 92, 86)   # sample scores

mean(score)     # calculates the average of the scores
sd(score)       # calculates the standard deviation (spread of the scores)
length(score)   # counts how many scores are in the sample


# 2. Independent-Samples t-Test (Welch's)
teaching_method <- factor(c(rep("Online", 10),
                            rep("Traditional", 10)))   # group labels: 10 Online, 10 Traditional

exam_score <- c(78, 75, 82, 70, 76, 80, 74, 79, 77, 81,     # Online group scores
                68, 85, 72, 70, 66, 69, 73, 64, 71, 67)      # Traditional group scores

student_data <- data.frame(teaching_method, exam_score)   # combines both variables into one table

# Welch independent-samples t-test (recommended default)
t.test(exam_score ~ teaching_method,
       data = student_data)


# 3. Paired-Samples t-Test
before_score <- c(58, 62, 65, 60, 67, 64, 59, 66, 61, 63)   # scores before training
after_score  <- c(68, 70, 72, 65, 74, 71, 67, 75, 69, 70)   # scores after training

paired_data <- data.frame(before_score, after_score)   # combines before/after into one table

# Create and inspect difference scores
paired_data$difference <- paired_data$after_score - paired_data$before_score   # after minus before

mean(paired_data$difference)   # average change per person
sd(paired_data$difference)     # spread of the change

# Paired-samples t-test
t.test(after_score, before_score,
       paired = TRUE,
       alternative = "two.sided",
       conf.level = 0.95)


