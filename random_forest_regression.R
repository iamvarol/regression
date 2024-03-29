# Random Forest Regression

# Importing the dataset
dataset = read.csv('Position_Salaries.csv')
dataset = dataset[2:3]

# Splitting the dataset into the Training set and Test set
# No need to split the dataset since we have few data

# Fitting Random Forest Regression to the dataset
install.packages('randomForest')
library(randomForest)
set.seed(35) # at python random_state
regressor = randomForest(x = dataset[1],
                         y = dataset$Salary,
                         ntree = 500)

summary(regressor)

# Predicting a new result with Random Forest Regression
y_pred = predict(regressor, data.frame(Level = 7.5))

# Visualising the Random Forest Regression results (higher resolution)
install.packages('ggplot2')
library(ggplot2)
x_grid = seq(min(dataset$Level), max(dataset$Level), 0.01)
ggplot() +
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             colour = 'red') +
  geom_line(aes(x = x_grid, y = predict(regressor, newdata = data.frame(Level = x_grid))),
            colour = 'blue') +
  ggtitle('Truth or Bluff (Random Forest Regression)') +
  xlab('Level') +
  ylab('Salary')
