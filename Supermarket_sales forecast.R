## Import data and library
library(readr)
library(tidyverse)
library(dplyr)
library(janitor)
supermarket <- read_csv("supermarket_sales.csv")

## Preview and cleaning data
View(supermarket)
head(supermarket)
df <- data.frame(supermarket)
df <- clean_names(supermarket)
colnames(df)

## Predict total sales on Apr 2019
# Monthly total sales
df2 <- df %>%
  separate(date, into = c("month", "day", "year"), sep = "/")
df2 %>%
  group_by(month) %>%
  summarise(total_sales = sum(total))

# Create model and prediction
sales_data <- data.frame(
  months <- as.Date(c("2019-01-01", "2019-02-01", "2019-03-01")),
  sales <- c(116292, 97219, 109456)
)
model <- lm(sales ~ months, data = sales_data)
predict_month <- data.frame(months = as.Date("2019-04-01"))
predict_month$month <- as.Date(predict_month$month)
predict <- predict(model, newdata = predict_month)
print(predict)

# Evaluate the model performance
# Estimated sales value for Apr 2019
actual_sales <- c(100000)
squar_error <- (actual_sales - predict)^2
(rmse <- sqrt(mean(squar_error)))


## Correlation between gender and rating
cus_type <- if_else(df$customer_type == "Member", 1, 0)
(correlation <- cor(cus_type, df$rating, method = "spearman"))

# Evaluate correlation
cor_avg <- df %>%
  group_by(customer_type) %>%
  summarise(avg_rating = mean(rating))

df %>%
  group_by(customer_type) %>%
  summarise(avg_rating = mean(rating))
