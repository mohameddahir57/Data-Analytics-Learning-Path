# LESSON 6: Data Manipulation with dplyr

# 1. Install and Load dplyr
install.packages("dplyr")   # install once
library(dplyr)               # load each session


# 2. Sample Dataset
sales <- data.frame(
  Product = c("Book", "Pen", "Book", "Bag", "Pen", "Bag"),
  City = c("Mogadishu", "Hargeisa", "Mogadishu", "Bosaso", "Hargeisa", "Bosaso"),
  Quantity = c(10, 20, 15, 5, 30, 7),
  Price = c(5, 1, 5, 15, 1, 15)
)

sales     # view the dataset


# 3. select()
sales %>% select(Product, Quantity)   # choose specific columns


# 4. filter()
sales %>% filter(Product == "Book")   # keep only rows where Product is "Book"
sales %>% filter(Quantity > 10)       # keep only rows where Quantity is greater than 10


# 5. mutate()
sales %>% mutate(Total = Quantity * Price)   # create a new column


# 6. arrange()
sales %>% arrange(Quantity)          # sort ascending
sales %>% arrange(desc(Quantity))    # sort descending


# 7. rename()
sales %>% rename(UnitPrice = Price)   # rename a column


# 8. Pipe Operator %>%
sales %>%
  filter(Quantity > 10) %>%          # step 1: keep rows where quantity > 10
  select(Product, City, Quantity)    # step 2: keep only these columns


# 9. group_by() and summarise()

# Total quantity by product
sales %>%
  group_by(Product) %>%
  summarise(TotalQty = sum(Quantity))

# Average price by city
sales %>%
  group_by(City) %>%
  summarise(AvgPrice = mean(Price))

# Multiple summaries at once
sales %>%
  group_by(Product) %>%
  summarise(
    TotalQty = sum(Quantity),
    AvgQty = mean(Quantity),
    MaxQty = max(Quantity)
  )


# 10. Full Example: Combining Everything
sales %>%
  mutate(Total = Quantity * Price) %>%   # add a Total column
  group_by(Product) %>%                   # group rows by Product
  summarise(
    TotalSales = sum(Total),
    TotalQty = sum(Quantity)
  )