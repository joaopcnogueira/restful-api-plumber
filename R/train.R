url <- "https://archive.ics.uci.edu/ml/machine-learning-databases/statlog/german/german.data"
col_names <- c(
    'Status of existing checking account', 'Duration in month', 'Credit history'
    , 'Purpose', 'Credit amount', 'Savings account/bonds'
    , 'Employment years', 'Installment rate in percentage of disposable income'
    , 'Personal status and sex', 'Other debtors / guarantors', 'Present residence since'
    , 'Property', 'Age in years', 'Other installment plans', 'Housing', 'Number of existing credits at this bank'
    , 'Job', 'Number of people being liable to provide maintenance for', 'Telephone', 'Foreign worker', 'Status'
)

# Get the data
library(tidyverse)
library(janitor)

data <- read.csv(url, header = FALSE, sep = ' ', col.names = col_names) %>% 
    as_tibble() %>% 
    clean_names()

# Build the model
library(rpart)
decision_tree <- rpart(status ~ status_of_existing_checking_account + duration_in_month + credit_history + savings_account_bonds,
                       method = "class",
                       data = data)

library(rpart.plot)
prp(decision_tree,
    extra = 1,
    varlen = 0,
    faclen = 0,
    main = "Decision Tree for German Credit Data")


# Make predictions on new data
new_data <- list(status_of_existing_checking_account = 'A11', 
                 duration_in_month = 20, 
                 credit_history = 'A32', 
                 savings_account_bonds = 'A65')

predict(decision_tree, new_data)

# Persist the model
saveRDS(decision_tree, file="models/decision_tree_for_german_credit_data.rds")
