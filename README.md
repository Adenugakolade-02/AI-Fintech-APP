# superlender fintech app

The purpose of this project was to build an end to end Data Science project, from data gathering to cleaning, to feature engineering, to feature selection and finally model deployment. 
### Project process
  1. The data used for this project was gotten from a Zindi competition, the link can be found [here](https://zindi.africa/competitions/data-science-nigeria-challenge-1-loan-default-prediction/data)
  2. The next thing was data exploration and cleaning, this involved checking and filling null values, analysing the categorical, numerical, discrete and DateTime variables
  3. After exploration, the next step was engineering features, from my analysis of the dataset, I was able to engineer certain features, which were highly predictive features, for the datetime, I extracted the days, weeks, months. I also used a standard scaler to scale the dataset so as to ensure homogeneity among features and improve model training time
  4. For feature selection, I dropped some of the highly correlative features to prevent data redundancy
  5. After the whole process, I trained  a simple gradient boosting model on the train data and archeieved an accuracy >0.75
  6. For model deployment, I created several pipelines which included, the feature engineering pipeline, encoding pipelines, scaling pipelines. For the purpose of the project, scaling and model prediction pipeline was performed online while the rest were performed offline. With the help of Fast API I created APIs to the model and the instance of Standard Scaler used and deployed them on Heroku server.
  7. After the deployment of the models, I created an Andriod application which was to provide an interface for new loan applications and performs the feature engineering and encoding pipelines offline, and then returns the prediction on the application as either Good or bad.
 
 #### Improvements
 Possible improvements includes engineering more highly predictive features to improve models performance, using more better models such as catboost, XGBoost. 
 
 
