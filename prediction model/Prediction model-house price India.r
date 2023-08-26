library(tidyverse)
library(caret)
library(janitor)
library(readxl)

# Preparation data
df <- read_xlsx("house_price_india.xlsx") 
df <- clean_names(df) 
colnames(df)
count_df <- df %>% 
         complete.cases() %>% 
         mean()

# Split data
set.seed(42)
n <- nrow(df)
sample_df <- sample(1:n, size = 0.8*n)
train_df <- df[sample_df, ]
test_df <- df[-sample_df, ]

# Train data
lm_model <- train(log(price) ~ . ,
                 data = train_df,
                 method = "lm")

test_df$logpr <- log(test_df$price)

# Prediction
p <- predict(lm_model, newdata = test_df)


# Evaluate
mae <- mean(abs(p - test_df$logpr))
mrse <- sqrt(mean(p - test_df$logpr)**2)

varImp(lm_model)
