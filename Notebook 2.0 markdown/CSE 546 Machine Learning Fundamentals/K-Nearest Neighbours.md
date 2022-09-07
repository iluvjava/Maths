K Nearest Neighbours method

This is like, machine learning 101. 

I think I also talked bout it here: [Basic Machine Learning](../AMATH%20582%20Data%20Science/Basic%20Machine%20Learning.md), which is AMATH department's approach at addressing machine learning method.

---
### **Intro**

Let's consider the case of 1D, we want to maximizes the probability: 

$$
\mathbb{P}\left(Y|X = x_i\right)
$$

We want to make sure that the sample that are closest to the given data is having most of the labels the same. 

Therefore, we test the ratio of the type of labels that is present near the given sample in the training data set. 

And it's kinda trivial to be honest. Not much to be said about it. Think of it like this: 

$$
\frac{\mathbb{P}\left(Y = +1|X = x\right)}{
    \mathbb{P}\left(Y = -1|X = x\right)
}
$$

So, given any point in the distribution, I go to that point, and I compute the ratio between the probability of the positive labels, and the negative labels. This resembles the 1-Nearest Neighbour of the problem. 

And in this case, we can see that, if this is approaching infinite, then it's highly likely to be a positive label, which also informs that the neighbours of the given sample is going to be all positive. Else, it's highly likely to be a negative.

**Theorem without proof**

The Ratio of the positive labels near a certain radius, will approach a limit as we sample more and more sample from the same distribution. 

$$
\int_{\Vert x\Vert_p < R}
\frac{\mathbb{P}\left(Y = +1|X = x\right)}{
    \mathbb{P}\left(Y = -1|X = x\right)
}
dx
$$

Yeah, something like that, but that is just my guess tho, where we are taking the ratio on the positive ratio of occurence over the negative, over a closed region. 

---
### **Bias Variance Trade Off**

K increase, we are reducing the variance, but adding the bias. At the case of the $k = n$, this is just a dump algorithm that returns the most frequent type of labels as a prediction. 

As K decreases, this algorithm will vary a lot depending on what type of dataset we had for this algorithm. 


---
### **Distance Metric**

For distance metric, any norm functions will do. It can be L1, L2, or the inf norm. And these norms are easier to compute hence we are using it. 

In the next case, we can also use matrix induced norm, where the distance metric is produced by $x^TAx$. 

**The Curse of Euclidean Distance**

Let's say that the algorithm is working with the Euclidean distances, and let's consider the following function: 

$$
x^d \quad x\in [0,1]
$$

$$
\lim_{d\rightarrow \infty} x^d  = \begin{cases}
    0 & x \in [0, 1] 
    \\
    \pm\infty & \text{else}
\end{cases}
$$

Where $d$ is the number of the dimension. As we add more and more dimension, the volume of a sub-cube in the high dimension is getting smaller and smaller. And this is the curse. 

Basically, as dimension goes higher and higher, it's harder and harder to fill it with samples, especially when measured under the Euclidean Distance. 

