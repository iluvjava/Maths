Here, we will go over some of the basic machine learning stuff introduced in this class. 

This will be focusing on MATLAB implementations some of the ML related methods. 

Here will also contain a lot of links to other places, so we can get more background for each of the machine learning method, intuitions, and implementations in different languages. 

---
### List of Algorithms and Techniques (Matlab)

1. PCA Principal Components projections using SVD
	1. In MATLAB: `pca`, `svd`
2. K-Means algorithm for minimizing Average Euclidean distance between clusters of points. 
	1. In MATLAB: `kmeans`
3. KNN Search, searching for the labels of the K-Nearest Neighbors. 
	1. In MATLAB: `knnsearch`
4. Gaussian Mixture Models (GMM): 
	1. Using Guassian Models to fit different clusters, maximizing the Likelihood of observing each data points as being in the right clusters. 
	2. In MATLAB: `fitgmdist`, `cluster`
5. Naive Bayes: 
	1. Using the idea of Naive Bayes for binary classification.
	2. MATLAB Command: `fitNaiveBayes(xtrain, ylabel)` gets you a model. 
	3. `.predict(xtest)` on the handle returned by `fitNaiveBayes()`
6. Linear Discriminant Analysis (LDA)
	1. We projecting the data into a sub-space such that it maximizes the variance in between, then the orthogonal separator will be the decision boundary. 
	2. We can also project data into different subspace such as a parabola, such that the variance between clusters are maximized. 
	3. MATLAB Command: `fitdiscr` 
7. Support Vector Machine (SVM)
	1. It tries to find the best line that gives the maximal separations between the data data points with different labels. This is only applicable for **separable data points**. 
	2. The only data points that matters are the data points near the decision boundary. 
	3. MATLAB command: `fitcsvm`. Returns a handle which can be queried. 
	4. `svmclassify(svmhandle, xtest)`, runs the classification with a SVM models with a test set.
8. Decision Tree
	1. For each attributes of the data, we ask the problem ($x_i > a$ Y/N), and we want want to maximizes the separations between the data. 
	2. MATLAB: see [Classification Tree](https://www.mathworks.com/help/stats/classification-trees.html) by mathworks. 
	3. You can query dense points spanning the whole space with the tree models to how the partitions look like for the trained model. 
	4. **Extremely Successful** for High Dimensional Data. 

#### Good Plotting Commands 
`gscatter`: Plotting categorical data in Euclidean space with group labels. 
`treedisp`: For showing the decision tree. 

#### Extra Methods
1. Page Ranks Machine Learning Method, this is based on graph and linear algebra. 
2. ADA Boosting Algorithm. 
	1. Boosting the weight of the decision tree, giving non-linear separations spaces, instead of linear. 
3. A Priori
	1. This exploits different frequencies for the data points. The idea behind it is called: "Associated Rule Mining", and it's good for answer questions such as: "What might the users also like?"
	2. See more about this here: [Medium Link](https://towardsdatascience.com/underrated-machine-learning-algorithms-apriori-1b1d7a8b7bc)


---
### PCA and SVD

Ideas behind it is discussed in [[PCA (Principal Components Analysis)]]. It can be used for dimension reduction, and unsupervised clustering. 

---
### K-Means

---
### KNN

---
### LDA

**Idea**: Project the labeled data onto a linear sub-space, maximizing the separations of the center of the cluster. The mean. 

$$
w^+ = \arg\max_w 
\left\lbrace
\frac{w^TS_B w}{w^TS_ww}
\right\rbrace
$$

Where the matrix $S_B$ helps with measuring the variance in between the clusters onto the projected hyper plane

And the matrix $S_w$ helps with the variance within the clusters with labels. 

**What is method good for**? 

This method is good for supervised dimensionality reduction on data-set. 

More in [[LDA (Linear Discriminant Analysis)]]

---
### GMM

---
### Naive Bayes

---
### SVM

Supervised Machine Learning. 

This is a quadratic programming problem. For a subset of data points such that it's separable, it will look for the hyper plane that gives the best separations between data with 2 kind of labels. 

**What is best separations? **

The first closest points from both clusters are as big as possible, measured by the vertical distance from the hyper plane. 

**What if the data points are not really separable?**

Then points that crosses the boundary will be adding to the penalization term. 

---
### **Decision Tree**

The decision picks one features from the features set, and then set one value to partition the samples according to some kind of objective measure on: how well data are separated, how much new information we have gained via splitting it in this way. 
