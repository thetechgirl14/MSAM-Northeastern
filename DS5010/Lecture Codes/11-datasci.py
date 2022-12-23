
### Pandas

import numpy as np

import pandas as pd

## Series are one-dimensional arrays (vectors)

x = pd.Series([100, 200, 300, 400])

print(x)

## Series contain 'values' and 'index' attributes

x.values # values of the Series

type(x.values) # numpy.ndarray (!)

x.dtype # data type of the Series (dtype of x.values)

x.index # indices of the Series

type(x.index) # a specialized pandas index type

## Series can have non-integer indices

y = pd.Series([1.11, 2.22, np.nan, 4.44], index=['a', 'b', 'c', 'd'])

print(y)

z = pd.Series({'a': 1.11, 'b': 2.22, 'c': np.nan, 'd': 4.44})

print(z)

y['b'] # access via index label

z[['b', 'c', 'd']]

z[1:4] # access via offset

## Series can perform vectorized arithmetic operations

y + z # elementwise addition

x + y # elements added based on 'index'

u = pd.Series({'a': 1.11, 'b': 2.22, 'c': 3.33})

u + z  # missing indices assumed to be NaN

y * z # elementwise multiplication

y / z # elementwise division

y == z # elementwise comparison -- NaN comparisons return False

y[y > 2] # index by boolean Series

## DataFrames represent tabular data (tables of data w/ rows and cols)

A = pd.DataFrame(
	{'x': [100, 200, 300, 400],
	'y': [1.11, 2.22, 3.33, 4.44],
	'z': ['foo', 'bar', 'baz', 'qux']},
	index=['a', 'b', 'c', 'd'])

print(A)

A['y'] # access column 'y'

A.y # access column 'y'

A[['x', 'y']] # subset DataFrame with columns 'x' and 'y'

A[['y']] # subset DataFrame with column 'y' only

## Series in a DataFrame share a common index

A.index

A.loc['a'] # access row by index label

A.iloc[0] # access row by offset

A.loc['a':'c'] # slice rows by index label (includes endpoint)

A.loc['a':'c', 'x':'y'] # slice by BOTH row and col label

A.iloc[0:3] # slice rows by offset (doesn't include endpoint)

A.iloc[0:3, 0:2] # slice by BOTH row and col offset

## Importing a DataFrame from a text file

cars = pd.read_csv("mtcars.csv")

print(cars)

cars.index

cars.columns

cars = cars.set_index('model') # return DF with 'model' col as index

## Operations on DataFrames

cars > 20 # comparison of all values

cars[cars > 20] # subset by boolean DF

100 * cars # scalar multiplication

cars * cars # elementwise multiplication

cars / cars # elementwise division

cars.apply(np.mean, axis=0) # apply OVER rows (BY col)

cars.apply(np.mean, axis=1) # apply OVER cols (BY row)

cars.apply(lambda x: np.max(x) - np.min(x)) # col ranges

cars.mean() # mean of all cols

cars.mean(axis=1) # mean of all rows

cars.describe() # summary of all cols

cars.corr() # correlation matrix (DF)


### Matplotlib

# note: start python as ipython --pylab

import matplotlib.pyplot as plt

## A simple scatterplot

cars = pd.read_csv("mtcars.csv", index_col=0) # import w/ 'model'

xs = cars['disp']
ys = cars['mpg']

plt.scatter(xs, ys)
plt.title("Larger car engines are less efficient")
plt.xlabel("Engine size (liters)")
plt.ylabel("Fuel economy (miles per gallon)")
plt.show() # call only once per script (if non-interactive)

## Plot relationships in data

fig, ((ax1, ax2), (ax3, ax4)) = plt.subplots(2, 2)

ax1.scatter('disp', 'mpg', data=cars, color='tab:blue')
ax1.set_title("Mileage vs. engine size")
ax1.set_xlabel("Engine size (liters)")
ax1.set_ylabel("Fuel economy (mpg)")

ax2.scatter('hp', 'mpg', data=cars, color='tab:orange')
ax2.set_title("Mileage vs. horsepower")
ax2.set_xlabel("Horsepower")
ax2.set_ylabel("Fuel economy (mpg)")

ax3.scatter('wt', 'mpg', data=cars, color='tab:green')
ax3.set_title("Mileage vs. weight")
ax3.set_xlabel("Weight (1000 lbs)")
ax3.set_ylabel("Fuel economy (mpg)")

ax4.scatter('qsec', 'mpg', data=cars, color='tab:red')
ax4.set_title("Mileage vs. acceleration")
ax4.set_xlabel("Time to 1/4 mile (sec)")
ax4.set_ylabel("Fuel economy (mpg)")

fig.show()

## Plot distributions in data (histograms)

fig, (ax1, ax2) = plt.subplots(1, 2)

ax1.hist('disp', bins=20, data=cars, color='tab:blue')
ax1.set_title("Engine size")
ax1.set_xlabel("Liters")

ax2.hist('mpg', bins=20, data=cars, color='tab:orange')
ax2.set_title("Fuel economy")
ax2.set_xlabel("Miles per gallon")

fig.show()

## Plot distributions in data (boxplots)

mpg_a = cars['mpg'][cars['am'] == 0]
mpg_m = cars['mpg'][cars['am'] == 1]

plt.boxplot([mpg_a, mpg_m])
plt.title("Cars with manual transmissions are more efficient")
plt.xticks(ticks=[1, 2], labels=["Automatic", "Manual"])
plt.xlabel("Transmission")
plt.ylabel("Fuel economy (miles per gallon)")
plt.show()

## Plot directly from DataFrame

cars.boxplot('mpg', by='am')
plt.show()

cars.boxplot('mpg', by='gear')
plt.show()


### Modeling with statsmodels and sklearn

## Linear regression with statsmodels

import statsmodels.api as sm

import statsmodels.formula.api as smf

cars = cars.sort_values('disp')

model1 = smf.ols('mpg ~ disp', data=cars).fit()

model1.summary()

model1.params # regression coefficients
model1.rsquared # rsquared

pred = model1.get_prediction()

xs = cars['disp']
ys = cars['mpg']
ys_pred = pred.predicted_mean
ys_lo, ys_hi = zip(*pred.conf_int())

plt.plot(xs, ys, 'o', label="Observed")
plt.plot(xs, ys_pred, 'b-', label="Regression line")
plt.plot(xs, ys_pred, 'r.', label="Fitted values")
plt.plot(xs, ys_lo, 'r--', label="95% CI")
plt.plot(xs, ys_hi, 'r--')
plt.title("Modeling fuel economy from engine size")
plt.xlabel("Engine size (liters)")
plt.ylabel("Fuel economy (miles per gallon)")
plt.legend()
plt.show()

## SVM classification with sklearn

from sklearn.model_selection import train_test_split

sonar = pd.read_csv("sonar.csv")

sonar_X = sonar.iloc[:,0:60]

sonar_y = sonar["Class"]

part = train_test_split(sonar_X, sonar_y, test_size=0.2, random_state=2021)

X_train, X_test, y_train, y_test = part

from sklearn import svm

model2 = svm.SVC(probability=True)

model2.fit(X_train, y_train)

model2.predict(X_test)
model2.predict_proba(X_test)

model2.score(X_train, y_train)  # accuracy (training)
model2.score(X_test, y_test)  # accuracy (testing)

from sklearn.metrics import classification_report

ypred_test = model2.predict(X_test)
print(classification_report(y_test, ypred_test))

