###### This script generates fictional data of commercial contracts between a retailer and its industry suppliers ######

# Load required packages
library(dplyr) # for data manipulation

# Set seed for reproducibility
set.seed(123)

## Create the data and store it as a data frame
num_suppliers <- 10 # specify the number of suppliers
suppliers <- paste0("Supplier", 1:num_suppliers) 
max_tagets <- 5 # sets max number of targets suppliers may have
num_targets <- sample(
  1:max_tagets, 
  num_suppliers, 
  replace = T
)  

# Create a list to store targets and percentages for each supplier
targets_list <- lapply(num_targets, function(num) {
  # Generate random increasing targets and payback percentages
  targets <- sort(runif(num, min = 0.5, max = 4))  # random targets between 0.5 and 4 million, sorted
  percentages <- (sort(runif(num, min = 1, max = 3)))/100  # random payback percentages, sorted
  data.frame(Purchase_Target = targets, Payback_Percentage = percentages)
})

# Combine the data frames into a single data frame
contract_data <- bind_rows(Map(cbind, Supplier = suppliers, targets_list))

# Display the generated data
print(contract_data)
