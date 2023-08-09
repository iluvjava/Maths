Sometimes, we need to transform data that are not presented in vector so that some of the the models we developed can use that data. 


---
### **Intro**

People should know how to deal with data when we do machine learning. 

Data type: 
1. Paragraph 
2. Tree with labels
3. Categorical, tags
4. Audio 
5. Time Series

These are not just vectors or matrices. 

**What if there are Uninformative features in data?**

1. Lasso
2. Find new data if it's just not useful


**What if there are correlations in the features?**

1. PCA decorrelation on features. 
2. Feature selection using LASSO. 


---
### **Real Vectors**

Pre-Processing Pipelines: 

1. Standardization 
   1. Standardize across all the features $x_i$, so that they are zero mean and unit variance. If considering row data matrix: 
   2. 
$$
    \frac{(X - \text{mean}(X, \text{axis}=0, \text{keepdim}=\text{True}))}{\text{std}(X, \text{axis}=0, \text{keepdim}=\text{True})}
$$
2. Principal components projection 

Apply this exact transformation on the test set using parameters we got from the training set. **Don't get standardization parameters from the test data!** 

When using PCA, the principal components should be from the training data for embedding features from the test data set. 

! **Warning:** 

> When using PCA for de-correlations, make sure the data is ZERO MEAN

Another more involved version will involve the use of [[Auto Encoder]], a generalized version of the PCA, using non-linear transformation. 

This is often used when there are a lot of redundant feature
in the data set. 

---
### **Categorical Data**

Representing categorical data using Canonical Data. 

Say categorical label `color` has labels: Red, Green, Blue. 

Then red can be encoded as $[1, 0, 0]^T$, green and blue as $[0, 1, 0]^T, [0, 0, 1]^T$. 

This makes all the color complete independent from each other. This is good, sometimes. This is called: **Unstructured Encoding**, this representation won't create the problem of say: red + green = blue, if we use: red = 1, green = 2, blue = 3. 

**Ok, what if we have zip code as categorical data?**

Using Unstructured encoding is not good, because in that case the features vector will be too large. 

Instead, we are going to use some prior knowledge about zip code. 

We have to encode group of zip code into one feature. Say, zip code from one region all get encoded into a unique label, boolean label I think. 

---
### **Structured Data: Tree, Graph**

Say we were given a tree/graph that has a lot of labels in each node. 

Then, the distance between 2 node could be the shortest path between these 2 nodes in the graph. 

And then in that case, we an carry out Clustering on the graph, Base on the distance between all the nodes. 

Distance: The smaller number of edges between any 2 nodes in the graph. 

Using the unsupervised learning to cluster it, then we can assign labels to cluster. And that will be our feature embedding for nodes in the graph. 


---
### **Images**

This is call computer vision, and if we want to extrac features from the images, we will be using Deep Neural Networks. 

Before the age of deep learning, people have hand-crafted filters and algorithm for extracting features. 

Nowadays, we use deep learning to get learned features from the data set. 

**The key is**

> The Conv2d, Maxpool, function that comes right before the VISION Neural Networks are features extractor. 

After all the layers of Convolution and Maxpool, the output right before the dense layer will be an embeddings of features, trained using the trained set. 

we can use: AlexNet, Resnet. 

Steps: 
1. Train the Resnet Model on ImageNet data set. 
2. There is a linear classifier on the Resnset. 
3. Then we can use all other layers as a feature extractor, and then stick a new classifier or model you had on the end and then train it again. 

Note: 

* We can train the feature extractor together with the Custom Layers you made. 


