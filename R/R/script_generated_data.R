# this script is only to generate data to test our scripts
# Function to generate synthetic EHR data
generate_synthetic_ehr_data <- function(n_obs = 1000) {
  set.seed(11282023)  # Set seed for reproducibility

  # Generate synthetic EHR data
  ehr_data <- data.frame(
    PatientID = seq(1, n_obs),
    Age = sample(18:80, n_obs, replace = TRUE),
    Gender = sample(c("Male", "Female"), n_obs, replace = TRUE),
    Diagnosis = sample(c("Hypertension", "Diabetes", "Arthritis", "Cancer", "Heart Disease"), n_obs, replace = TRUE)
  )

  return(ehr_data)
}

# Function to save synthetic EHR data to a CSV file
save_synthetic_ehr_data <- function(ehr_data, filename = "synthetic_ehr_data.csv") {
  write.csv(ehr_data, filename, row.names = FALSE)
  message("Synthetic EHR data saved as ", filename)
}

# For the clinical trial script
# Load necessary libraries for clinical trial data analysis
library(dplyr)
library(tidyr)

# Load Clinical Trial Data
load_clinical_trial_data <- function(n_obs = 1000) {
  set.seed(123)  # Set seed for reproducibility

  # Sample clinical trial data
  clinical_trial_data <- data.frame(
    PatientID = seq(1, n_obs),
    Treatment = sample(c("A", "B"), n_obs, replace = TRUE),
    Outcome = sample(c("Success", "Failure"), n_obs, replace = TRUE),
    Visit_Date = as.Date(seq(as.Date("2022-01-01"), by = "days", length.out = n_obs))
  )

  return(clinical_trial_data)
}

# Generate a larger clinical trial dataset with 1000 observations
clinical_trial_data_1000 <- load_clinical_trial_data(n_obs = 1000)

# Save the dataset as a CSV file
write.csv(clinical_trial_data_1000, "clinical_trial_data_1000.csv", row.names = FALSE)

# Check the first few rows of the generated dataset
head(clinical_trial_data_1000)


# imaging data
# Load necessary libraries
library(imager)

# Set seed for reproducibility
set.seed(2023)

# Generate a synthetic X-ray image
image_size <- c(512, 512)  # Image size in pixels
synthetic_xray_image <- imager::as.cimg(matrix(runif(prod(image_size)), nrow = image_size[1], ncol = image_size[2]))

# Display the synthetic X-ray image
plot(synthetic_xray_image, main = "Synthetic X-ray Image")

# Save the synthetic X-ray image as a file
# Save the synthetic X-ray image as a file using base R functions
png("synthetic_xray_image.png")
plot(synthetic_xray_image, main = "Synthetic X-ray Image")
dev.off()


