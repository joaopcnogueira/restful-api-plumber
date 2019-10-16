library(rpart)
library(jsonlite)

decision_tree <- readRDS("models/decision_tree_for_german_credit_data.rds")

#* @post /predict
predict_default_rate <- function(status_of_existing_checking_account,
                                 duration_in_month,
                                 credit_history,
                                 savings_account_bonds) {
    
    data <- list(status_of_existing_checking_account = status_of_existing_checking_account, 
                 duration_in_month = duration_in_month, 
                 credit_history = credit_history, 
                 savings_account_bonds = savings_account_bonds)
    
    prediction <- predict(decision_tree, data)
    return(default_probability = unbox(prediction[1,2]))
}
