In [[Basic Machine Learning]], we have some basic introduction to clustering algorithm, like the Gaussian Mixtures. 

Here, we will be interested in more details about K-means clustering. 

---
### **Intro**

This is the Kmean Algorithm: 

Specifies $k$ points to be the initial center. They were usually chosen to be the center of cluster. 

1. Now, partition the set by assigning the sample to the closest to the centers. 

2. Then, recompute the new cluster center using the labels given to the center. 

3. Repeat the process until the algorithm converges. 

The idea that, when we have the correct assignemnt for the samples, their centroids should be closest to that label. 

$$
\min_{\forall C_k}
\sum_k\sum_{x_i\in C_k}^{} \Vert x_i - c_k\Vert_2^2
$$


For each cluster, the sum of all the samples to it's assigned classes's center, it's as small as possible 

Note: 

**This is not CONVEX optimizaiton**, meaning that, there will be some assignment of the samples that is a local minima, instead of a global minima. Having a Convex Objective Function doesn't mean that it's a **CONVEX Optimization**. 

**Cool fact:**

> The partition boundaries for the K-mean algorithm is always going to be a line, this is the case becaues we are using L2-norm. And there is no way we can define 2 centriods, and then the set of points taht have equal distance between these 2 centroids are not a line!

It's never done in practice, but it's still possible to cluster the points using different distance metric. 

**Intuition:** 

It's using gradient descent, alternating between the optimization on the centroids and then on the classes assignemnt. It's the same idea as **Coordinate Descend**. 

1. Move Centoids in such a way it minimizes the distances within the classes. 
2. Change the assignemnt and so that all the samples are close to their centroid. 



