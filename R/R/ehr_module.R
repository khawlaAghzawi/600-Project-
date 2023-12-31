# Function to analyze EHR data
#' Analyze EHR Data
#'
#' This function performs basic analysis on EHR data, such as summary statistics and distribution plots.
#'
#' @param ehr_data A dataframe containing preprocessed EHR data.
#' @export
#'
library(ggplot2)

analyze_ehr_data <- function(path) {
  # Check if the required columns are present in the preprocessed dataset
  #required_columns <- c("PatientID", "Age", "Gender", "Diagnosis")
  #missing_columns <- setdiff(required_columns, colnames(ehr_data))
  ehr_data <- read.csv(path)
  #if (length(missing_columns) > 0) {
  #  stop(paste("Missing required columns in the preprocessed EHR dataset:", paste(missing_columns, collapse = ", ")))
  #}
  paste("We have ", dim(ehr_data)[1], " observations.")
  head(ehr_data)
  # Summary statistics
  summary_stats <- summary(ehr_data)
  print("Summary Statistics:")
  print(summary_stats)

  # Distribution plot of Age
  hist(ehr_data$Age, main = "Distribution of Age", xlab = "Age", col = "lightblue", border = "black")

  # Pie chart of Gender Distribution
  gender_counts <- table(ehr_data$Gender)
  pie(gender_counts, labels = names(gender_counts), main = "Gender Distribution", col = rainbow(length(gender_counts)))

  # Box plot of Age by Diagnosis
  boxplot(Age ~ Diagnosis, data = ehr_data, main = "Age Distribution by Diagnosis", xlab = "Diagnosis", ylab = "Age", col = "skyblue")

  # Additional analysis steps as needed
  #ehr_data$Health_Camp_ID <- as.factor(ehr_data$Health_Camp_ID)
  # Plot the counts
  #barplot(table(ehr_data$Health_Camp_ID), main = "Health Camp Counts", xlab = "Health Camp ID", ylab = "Count", col = "skyblue"
  # Return the analysis results or visualizations
}


# Function to create visualizations for EHR data
#' Visualize EHR Data
#'
#' This function creates visualizations for EHR data, such as histograms, bar charts, etc.
#'
#' @param ehr_data A dataframe containing preprocessed EHR data.
#' @export
#'
visualize_ehr_data <- function(ehr_data) {
  # Check if the required columns are present in the preprocessed dataset
  required_columns <- c("PatientID", "Age", "Gender", "Diagnosis")
  missing_columns <- setdiff(required_columns, colnames(ehr_data))

  if (length(missing_columns) < 0) {
    stop(paste("Missing required columns in the preprocessed EHR dataset:", paste(missing_columns, collapse = ", ")))
  }

  # Check for missing or infinite values in Age and Diagnosis columns
  if (any(is.na(ehr_data$Age)) || any(is.infinite(ehr_data$Age)) ||
      any(is.na(ehr_data$Diagnosis))) {
    stop("Missing or infinite values detected in the Age or Diagnosis columns. Please handle these issues before visualizing the data.")
  }

  # Check if there are enough unique values in the Diagnosis column for meaningful visualization
  if (length(unique(ehr_data$Diagnosis)) < 2) {
    stop("Not enough unique values in the Diagnosis column for meaningful visualization.")
  }

  # Histogram of Age
  #hist(ehr_data$Age, main = "Distribution of Age", xlab = "Age", col = "lightgreen", border = "black")
  ggplot(ehr_data, aes(x = Age)) +
         geom_histogram(aes(y = ..density..), bins = 30, fill = "lightblue", color = "black") +
         geom_density(alpha = 0.5, fill = "red") +
         labs(title = "Distribution of Age with Density Line", x = "Age", y = "Density") +
         theme_minimal()
  # Bar chart of Gender
  barplot(table(ehr_data$Gender), main = "Gender Distribution", xlab = "Gender", ylab = "Count", col = "skyblue")

  # Bar chart of Diagnosis
  barplot(table(ehr_data$Diagnosis), main = "Diagnosis Distribution", xlab = "Diagnosis", ylab = "Count", col = "pink")

  # Scatter plot of Age vs. Diagnosis
  ggplot(ehr_data, aes(x = Diagnosis, y = Age)) +
         geom_boxplot(fill = "lightblue", color = "purple") +
         geom_jitter(position = position_jitter(width = 0.2), color = "purple", alpha = 0.5) +
         labs(title = "Box Plot with Jitter: Age by Diagnosis",
                         x = "Diagnosis",
                         y = "Age") +
         theme_minimal()
  # Additional visualizations as needed

  # Return or display the visualizations
}

