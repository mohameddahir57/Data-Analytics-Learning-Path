# LESSON 1: RStudio Basics, Variables, Data Types, Vectors, Factors, Basic Functions

# 1. Running Code
2 + 3      # runs a simple calculation directly in the console
5 * 10     # another direct calculation

x <- 5     # stores 5 in x
y <- 10    # stores 10 in y
x + y      # adds the two stored variables


# --- 2. Variables
name <- "Ali"     # stores text in the variable name
age <- 25         # stores a number in the variable age
salary <- 500     # stores a number in the variable salary


# 3. Data Types
price <- 100        # numeric
weight <- 65.5       # numeric (decimal)

city <- "Mogadishu"   # character (text, always in quotes)
course <- "RStudio"    # character

passed <- TRUE        # logical
married <- FALSE      # logical


# 4. Checking Data Type
x <- 10
class(x)         # checks the type of x -> "numeric"

name <- "Asha"
class(name)      # checks the type of name -> "character"


5. Vectors
scores <- c(70, 80, 90, 85)                       # numeric vector
cities <- c("Mogadishu", "Hargeisa", "Bosaso")     # character vector


# --- 6. Factors ---
gender <- factor(c("Male", "Female", "Male", "Female"))   # categorical variable
gender     # displays the factor


# 7. Basic Functions
numbers <- c(10, 20, 30)   # numeric vector to test functions on

sum(numbers)      # adds all values
mean(numbers)     # finds the average
min(numbers)      # smallest value
max(numbers)      # largest value
length(numbers)   # counts how many items
class(numbers)    # checks the type


# 8. Full Example
student_name <- "Ahmed"    # text variable
student_age <- 22          # numeric variable
student_pass <- TRUE       # logical variable

marks <- c(65, 70, 80, 90, 75)                                  # numeric vector
department <- factor(c("IT", "IT", "Business", "Business", "IT"))  # factor variable

class(student_name)   # checks type of student_name
class(student_age)    # checks type of student_age
class(student_pass)   # checks type of student_pass

sum(marks)      # total of marks
mean(marks)     # average of marks
min(marks)      # lowest mark
max(marks)      # highest mark
length(marks)   # number of marks


# 9. Day 1 Practice
name <- "Mohamed"       # text variable
age <- 30                # numeric variable
is_student <- FALSE      # logical variable

income <- c(200, 300, 250, 400, 350)   # numeric vector
city <- factor(c("Mogadishu", "Hargeisa", "Bosaso", "Mogadishu", "Kismayo"))  # factor variable

class(name)          # checks type of name
class(age)           # checks type of age
class(is_student)    # checks type of is_student

sum(income)      # total income
mean(income)     # average income
min(income)      # lowest income
max(income)      # highest income
length(income)   # number of income values


# 10. Challenge Exercise
product <- "Laptop"        # text variable
prices <- c(500, 550, 530, 600, 620)   # numeric vector
instock <- TRUE             # logical variable
category <- factor(c("Electronics", "Electronics", "Electronics", "Electronics", "Electronics"))  # factor variable

class(product)     # class of product
class(prices)      # class of prices
mean(prices)       # average of prices
max(prices)        # highest price
length(prices)     # how many prices