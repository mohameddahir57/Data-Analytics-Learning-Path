# LESSON 5: Importing Files, Inspecting Data & Cleaning

# 1. Install and Load readxl 
install.packages("readxl")   # install once
library(readxl)               # load each session


# 2. Import the File 
employees <- read_excel("D:/Banadir Data Analysis 04/6.RStudio/lesson5_uncleaned_employees.xlsx")   # reads the Excel file into a data frame


# 3. Inspect the Data
head(employees)      # first 6 rows
tail(employees)      # last 6 rows
str(employees)        # structure: column types and dimensions
summary(employees)   # quick stats summary
names(employees)      # column names
dim(employees)         # rows x columns


# 4. Check for Missing Values
is.na(employees)          # TRUE/FALSE map of missing values
sum(is.na(employees))     # total count of missing values
colSums(is.na(employees)) # missing values per column


# 5. Clean Extra Spaces in Text Columns
employees$Name <- trimws(employees$Name)   # removes leading/trailing spaces from Name


# --- 6. Standardize Inconsistent Text Case ---
employees$Gender <- tolower(employees$Gender)          # standardizes "Male"/"FEMALE"/"male" -> "male"/"female"
employees$Department <- tolower(employees$Department)  # standardizes "IT"/"business"/"Business" -> lowercase


# 7. Remove Duplicate Rows
employees <- unique(employees)   # removes exact duplicate rows (e.g. the repeated Ali Warsame row)


# 8. Fix Salary Stored as Text
employees$Salary <- gsub("\\$", "", employees$Salary)   # removes "$" symbol from values like "$680"
employees$Salary <- as.numeric(employees$Salary)          # converts the column from character to numeric


# 9. Handle Missing Values
sum(is.na(employees$Salary))    # count missing salaries after conversion
sum(is.na(employees$Age))       # count missing ages

# Option A: remove rows with any missing value
employees_complete <- na.omit(employees)

# Option B: replace missing Salary with the column average instead of deleting rows
employees$Salary[is.na(employees$Salary)] <- mean(employees$Salary, na.rm = TRUE)


# 10. Handle Empty Strings (blank City)
employees$City[employees$City == ""] <- NA   # converts blank text to a proper NA
sum(is.na(employees$City))                    # count how many are now missing


# 11. Final Check
str(employees) # confirm data types are correct
summary(employees)   # confirm cleaning worked
sum(is.na(employees)) # confirm remaining missing values