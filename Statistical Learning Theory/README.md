# Math 7243 - Machine Learning and Statistical Learning Theory, Northeastern University Department of Mathematics

This course introduces both the mathematical theory of learning and the implementation of modern machine-learning algorithms appropriate for data science. Modeling everything from social organization to financial predictions, machine-learning algorithms allow us to discover information about complex systems, even when the underlying probability distributions are unknown. Algorithms discussed include regression, decision trees, clustering, neural networks and dimensionality reduction techniques. The course offers students an opportunity to learn the implications of the mathematical choices underpinning the use of each algorithm, how the results can be interpreted in actionable ways, and how to apply their knowledge through the analysis of a variety of data sets and models. 

This course consists of 20 Lectures and 6 inclass-takehome Labs, covering a wide range of topics in machine learning. The course is split into four peices:

* Linear Methods, Basis Methods, and Decition Trees (Lectures 1-7, 13, 18, Lab 1-3)
* Neural Networks (Lecture 8-11, Labs 4-7)
* Introduction to Unspervised Learning: PCA and Clustering (Lectures 12, 14-16)
* Mathematical Framework of Statistical Learning (Lectures 18-20)

This course is designed to be both a practical introduction to the hands on aspects of machine learning as well as to the theory. As part of the course students will produce a novel end-to-end machine learning project. While I will help you with this project you will need to struggle with all aspects of the pipeline, from data acquisition to model selection and training to the presentation of your results. It is hard to understand the purpose of the mathematical pieces of machine learning without struggle with the practicalities. Similarly, the theory allows us to perform careful model selection and construct new models in an ever widening space of algorithms. The great results in machine learning come from the synergy of practical verification and theoretical robustness. This course strives to serve as a strong introduction to both. 

## Lectures

Lectures are hosted on Google Drive to size constraints. If you find a mis-attributed image/dataset discussed in these lectures please do not hesitate to reach out. These lectures follow closely 

* Statistical Considerations and Best Practices: [_Elements of Statistical Learning_](https://web.stanford.edu/~hastie/ElemStatLearn/) by Hastie, Tibshirani, Friedman.
* Implementation and Neural Networks: [_Hands-On Machine Learning with Scikit-earn, Keras, and Tensorflow_](https://www.oreilly.com/library/view/hands-on-machine-learning/9781492032632/), by Géron, [Git Hub](https://github.com/ageron).
* Axiomatic Mathematical Framework and Theory: [_Understanding Machine Learning_](https://www.cse.huji.ac.il/~shais/UnderstandingMachineLearning/), by Shalev-Shwartz, Ben-David. 
* How-to guides for every Neural Network: [_Machine Learning Masterty_](https://machinelearningmastery.com/) by Jason Brownlee.
* Inspiration and Visualization: [_Distill Online Journal_](https://distill.pub/).

| Lecture Number    | Title          | Topics |
| :---         |     :---:      |          ---: |
| [Lecture 1](https://drive.google.com/file/d/1_rZ-bPs22E-WaCYkMqSKSBkGPXPuVGn0/view?usp=sharing)    | Introduction to Machine Learning | What is machine learning, terminology and notation, first examples: linear regression and binary classification with k-nearest neighbors |
| [Lecture 2](https://drive.google.com/file/d/1aPtUh7dQrup-dUYDxHvRTz0Kz2Bin-9B/view?usp=sharing)    | Matrix Differentiation and Optimization    | Brief introduction to the bias-variance trade off and the curse of dimensionality, matrix differentiation   |
| [Lecture 3](https://drive.google.com/file/d/17jJe9V4ZyUIzgs0BmhZyNnmCMVyhgkM_/view?usp=sharing)    | Linear Regression    | Variance of linear parameters, confidence intervals and z-scores for linear parameters, feature selection via statistical significance, subset selection   |
| [Lecture 4](https://drive.google.com/file/d/1njf56HJQV1AeplvcbAuCiAC9m8Q04lYS/view?usp=sharing)    | Parameter Shrinkage Methods | Gauss-Markov Theorem, Ridge Regression, Lasso Regression, Degrees of Freedom |
| [Lecture 5](https://drive.google.com/file/d/13NnBP3FjBQNYmjuxt6tI6uAohLFs7rUq/view?usp=sharing)    | Linear Methods in Classification | Multilabel Classification, Regression on Categorical Variables,	Linear Discriminant Analysis, Logistic Regression, Fitting Logistic Regression with Newtons Method, Extra: Bayes Classifier |
| [Lecture 6](https://drive.google.com/file/d/11D6e1-Ecit8mYwHOEnCsKJCk3U0XeCQc/view?usp=sharing)    | Iterative Methods | Gradient Decent, Stochastic Gradient Decent, Newtons Method, Example: Polynomial Fitting, Example: Fitting Nonpolynomial Functions|
| [Lecture 7](https://drive.google.com/file/d/1CtdTh_fg84G183R7GNPfHy2QOcPlVqNf/view?usp=sharing)    | Smoothing Methods | Piecewise Polynomials and Splines, Endpoint Selection and Smoothing Splines, Multidimensional Splines, Kernel Smoothing, Other Bases|
| [Lecture 8](https://drive.google.com/file/d/1AGRU3fl9wwFj8XR5tXVlA9HC1Oag568a/view?usp=sharing)    | Artificial Neural Networks | Artificial Neural Networks, Linear Classifier, Neural Networks and the Perceptron, Multilabel Perceptrons, Gradient Decent and Back Propagation, Back Propagation|
| [Lecture 9](https://drive.google.com/file/d/1vGknYucamOCo7dx-yllMcupQ9o0oynIF/view?usp=sharing)    | Convolutional Neural Networks | Types of Artificial Neural Networks, Convolutional Neural Networks, History of CNNs, Using Pretrained CNN’s|
| [Lecture 10](https://drive.google.com/file/d/1HYvTs1p_ip7Dh7Ne59WjH96JIgqvkWkk/view?usp=sharing)   | Recurrent Neural Networks | Types of Artificial Neural Networks, Recurrent Networks, Recurrence Nodes, Applying RNN’s to Natural Language Processing, Extra: Symmetrically Connected Networks|
| [Lecture 11](https://drive.google.com/file/d/1lG_K_Uy7dCyGPz8_MCa63uIJOHafUYdN/view?usp=sharing)   | Training Deep Networks | Vanishing Gradients and Activation Functions, Batch Normalization and Gradient Clipping, Faster Optimizers, Regularization |
| [Lecture 12](https://drive.google.com/file/d/1aS81JPYestYibXcGKp9FV5GeJvHQxF7E/view?usp=sharing)   | Factor Analysis and PCA | Feature Construction and Dimensional Reduction, Exploratory Factor Analysis, Principle Component Analysis, Nonlinear PCA|
| [Lecture 13](https://drive.google.com/file/d/1J0q9kwjjeJxqtWDdGdFoyOCRehslNjc1/view?usp=sharing)   | Decision Trees and Support Vector Machines | Decision Trees, Support Vector Machines, SVM’s and the Kernel Trick|
| [Lecture 14](https://drive.google.com/file/d/1jOlut-Rb7U-ZjlJzh46lyTg-I1ArICzd/view?usp=sharing)   | Cluster Analysis Part 1 | Overview of Clustering, K-Means Clusters, Example: Gene Expression Clustering, Density Based Clustering, Dissimilarity |
| [Lecture 15](https://drive.google.com/file/d/1vueQ1rcYOjCt9GCbIhP8Wn_7AmvVOHkL/view?usp=sharing)   | Cluster Anaylsis Part 2 | Dissimilarity, Agglomerative Clustering, Divisive Clustering, Spectral Clustering |
| [Lecture 16](https://drive.google.com/file/d/1lJ-Jekt1fkPDQU9vBKP8Kx2BSlk8L_JL/view?usp=sharing)   | Cluster Analysis Part 3 | Spectral Clustering, Gaussian Mixture Models, Evaluating Clustering: Internal and External Measures, The Theoretical Problem of Clustering |
| [Lecture 17](https://drive.google.com/file/d/1RG_VRoMXzvGeMZAagR4MAP-g8ScxfbEa/view?usp=sharing)   | Boosting, Bagging and Bootstrapping | Boosting and Adaboost, Adaboost in the Loss Minimization Framework, Boosting Trees, Bootstraping Confidence Intervals, Bagging and Bumping|
| [Lecture 18](https://drive.google.com/file/d/1taJigPyzH4zQAoZi3YbzQ9llkIPamwIz/view?usp=sharing)   | Mathematical Foundations of Machine Learning | Formal Model for Statistical Learning, PAC and APAC Learning, Uniform Convergence, Hoeffding’s Inequality, Finite Hypothesis Classes are APAC Learnable |
| [Lecture 19](https://drive.google.com/file/d/1jtbOefxxTX8iunEVaMDIvDTXUW-iDsL0/view?usp=sharing)   | No Free Lunch | Proving Bounds in APAC, Finite Hypothesis Classes are APAC Learnable, No Free Lunch Theorem, The Bias-Variance Tradeoff for RSS, Examples: k nearest neighbors and Linear Predictor|
| [Lecture 20](https://drive.google.com/file/d/1yGDpXlmgvjApBLeLrMASCw2-I4DngEpg/view) | The Vapnik-Chervonenkis Dimension | The class of all functions is unlearnable, VC Dimension with Examples, The Fundamental Theorem of PAC Learning, Sauers Lemma, Examples: Boosting and PAC learning, VC-Dimension of Neural Networks|
| [Fin](https://drive.google.com/file/d/1zPPdOJbNXTzl8InccuN7ih-AleH6RNzF/view?usp=sharing) | Survey Of Further Directions | What We Have Done, Topics We Missed, Where To Go From Here |

### Additional Lectures

| Lecture Number    | Title          | Topics |
| :---         |     :---:      |          ---: |
| [Guest Lecture 12 Part 2 (Jorio Cocola) ](https://drive.google.com/open?id=1Zl-S1CMFN9Gneqy8YkytLgx7KmaoRGWp)    | PCA and Random Matricies |The theory of random matricies and the resulting statistical guarentee for PCA on high dimensional spaces |
| [Lecture 21](https://drive.google.com/open?id=1pdKS1kAy3OuYUazTosRzbuC66kgFYhLh)    | Validation and Model Selection | Hyperparameter Tuning Algorithms, Managing Accuracy For Large Numbers of Models, Comparing Model Performance Using Statistical Tests, Bayesian Optimization|


## Labs

| Lab Number    | Title          | Topics |
| :---         |     :---:      |          ---: |
| [Lab 1](https://github.com/tipthederiver/Math-7243-2020/tree/master/Labs/Lab%201)    | Exploratory Analysis | Loading CSV files, data frames,  graphing, exploratory analysis, linear regression. |
| [Lab 2](https://github.com/tipthederiver/Math-7243-2020/tree/master/Labs/Lab%202)    | Linear Regression | Linear regression with linear algebra, sklearn and statsmodel.api; ridge and lasso regression; subset selection methods. |
| [Lab 3](https://github.com/tipthederiver/Math-7243-2020/tree/master/Labs/Lab%203)    | Linear Methods in Classification | Visualization of categorically labeled data, categorical linear regression, logistic regression, linear and quadratic discriminant analysis. |
| [Lab 4](https://github.com/tipthederiver/Math-7243-2020/tree/master/Labs/Lab%204) | Artificial Neural Networks with Tensorflow and Keras | Building, training, using and saving ANN's using Keras with a Tensorflow backend. |
| [Lab 4.5](https://github.com/tipthederiver/Math-7243-2020/tree/master/Labs/Lab%204.5) | Optimizing Deep Nerual Networks |  Selecting Activation Functions, Choosing Weight Initializations, Batch Normalization, Gradient Clipping, Choosing Optimizers and Regularization|
| [Lab 5](https://github.com/tipthederiver/Math-7243-2020/tree/master/Labs/Lab%205) | Convolutional Neural Networks with Keras | Building and training CNN's, using pretrained CNN's, using Keras. |
| [Lab 6](https://github.com/tipthederiver/Math-7243-2020/tree/master/Labs/Lab%206) | Recurrent Neural Networks with Keras | Building and training RNN's for sequence generation and text generation. |
| [Lab 7](https://github.com/tipthederiver/Math-7243-2020/tree/master/Labs/Lab%207) | Introduction to Tensorflow | Introduction to using Tensorflow 2.1 and subclassing to properly implament loss functions, layers and models. |

## Homework

* [Homework 1](https://github.com/tipthederiver/Math-7243-2020/raw/master/Homework/Homework%201.pdf): Matrix Calculus, Loss Functions, and Linear Regression
* [Homework 2](https://github.com/tipthederiver/Math-7243-2020/raw/master/Homework/Homework%202.pdf): LDA, Cubic Splines, and Gradiant Decent.

# Datasets
## Hosted External Datasets

| Dataset   | Title          | Lab |
| :---         |     :---:      |          ---: |
| Ames Housing Prices  | Ames | Lab 1 |
| NYC AirBnB Prices | NYCAirBnB | Lab 1 |
| Gendered Voice | GenderedVoice | Lab 3 |

## Covid Datasets

| Dataset   | Description          |
| :---         |     :---:      |
| [Boston 311 Covid](https://data.boston.gov/dataset/311-service-requests) | Boston 311 has been collecting data on reported COVID cases. This is included in the standard Boston 311 dataset (This seems to no longer be true, info?). |
| [COVID Lung Damage CT Semgentation](https://github.com/DengPingFan/Inf-Net#4-covid-semiseg-dataset) | A semgentation dataset containing CT scans of the lungs of COVID patients. Open questions include automatic segmentation, classifying damage by location and extent, subtyping damage using clustering, and charting disease progreassion| 
| [New York Times By County Data](https://github.com/nytimes/covid-19-data) | New York Times data on infection rate and deaths due to COVID by county in the US|
| [Johns Hopkins Data Aggragator](https://github.com/CSSEGISandData/COVID-19) | This is the data repository for the 2019 Novel Coronavirus Visual Dashboard operated by the Johns Hopkins University Center for Systems Science and Engineering (JHU CSSE). Also, Supported by ESRI Living Atlas Team and the Johns Hopkins University Applied Physics Lab (JHU APL).|
