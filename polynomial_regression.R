# Polynomial Regression

# Importing the dataset
dataset = read.csv("Position_Salaries.csv")
dataset = dataset[2:3]

# Splitting the dataset into the Training set and Test set
# No need to split the dataset since we have few data

# Feature Scaling
# training_set = scale(training_set)
# test_set = scale(test_set)

# Fitting Linear Regression to the dataset
lin_reg = lm(formula = Salary ~ .,
             data = dataset)
summary(lin_reg)

# Fitting Polynomial Regression to the dataset

# ---------- this part is iterative ---------- #
# you always check the summary and the graph to stop adding polynomial features
# add polynomial features
dataset$Level2 = dataset$Level ^ 2
dataset$Level3 = dataset$Level ^ 3
dataset$Level4 = dataset$Level ^ 4
# you can continue with levels of 5 and 6
# dataset$Level5 = dataset$Level ^ 5
# dataset$Level6 = dataset$Level ^ 6

poly_reg = lm(formula = Salary ~ .,
              data = dataset)
summary(poly_reg)

# Visualizing the Linear Regression results
install.packages('ggplot2')
library(ggplot2)

ggplot() +
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             colour = "red") +
  geom_line(aes(x = dataset$Level, y = predict(lin_reg, newdata = dataset)),
            colour = "blue") +
  ggtitle(label = "Truth or Bluff (Linear Regression)") +
  xlab("Level") +
  ylab("Salary") +
  theme(plot.title = element_text(hjust = 0.5, vjust = 0.5))

# Visualizing the Polynomial Regression results
install.packages('ggplot2')
library(ggplot2)

ggplot() +
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             colour = "red") +
  geom_line(aes(x = dataset$Level, y = predict(poly_reg, newdata = dataset)),
            colour = "blue") +
  ggtitle("Truth or Bluff (Polynomial Regression)") +
  xlab("Level") +
  ylab("Salary") +
  theme(plot.title = element_text(hjust = 0.5, vjust = 0.5))

# Visualizing the Regression Model results (for higher resolution and smoother curve)
install.packages('ggplot2')
library(ggplot2)

x_grid = seq(min(dataset$Level), max(dataset$Level), 0.1)

ggplot() +
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             colour = "red") +
  geom_line(aes(x = x_grid, y = predict(
    poly_reg,
    newdata = data.frame(
      Level = x_grid,
      Level2 = x_grid ^ 2,
      Level3 = x_grid ^ 3,
      Level4 = x_grid ^ 4
      #,Level5 = x_grid ^ 5,
      #Level6 = x_grid ^ 6
      ))),
  colour = "blue") +
  ggtitle("Truth or Bluff (Polynomial Regression)") +
  xlab("Level") +
  ylab("Salary")

# ----------- iterative part end --------------- #

# Predicting a new result with Linear Regression
y_pred = predict(lin_reg, data.frame(Level = 7.5))

# Predicting a new result with Polynomial Regression
y_pred_poly = predict(poly_reg,
                 data.frame(
                   Level = 7.5,
                   Level2 = 7.5 ^ 2,
                   Level3 = 7.5 ^ 3,
                   Level4 = 7.5 ^ 4
                   #,Level5 = x_grid ^ 5,
      			   #Level6 = x_grid ^ 6
                 ))
