This is a Non-linear generalization of the PCA method. 
Check [Independent Component Analysis](../AMATH%20582%20Data%20Science/Independent%20Component%20Analysis.md) for information on how PCA is used to find the best orthogonal basis to de-correlate input features. 

---
### **Intro**

Auto Encoder is a data transformation technique. 

it's a generalization of the PCA method, it's non-linear. 

We want to find a lower dimensional embedding to represent the data in the higher dimension. 

The optimization problem can be phrased as: 

$$
\min_{f, g} \sum_{i = 1}^{n}
\Vert x_i - g(f(x_i))\Vert_2^2
$$

Where, $x\in \mathbb{R}^d$, it's higher dimensional and has a lot of redundant features. 

And the latent space, the output of $f$, it's $\mathbb{R}^{r}$. 

In the modern day, the function $f, g$ are deep Neural Network.

The new features, the lower dimensional embeddings will be $f(x_i)$. 

So, we are using a neural network, that shrinks the inputs using $f$, and then it's latent space will be some kind of representation of abstract features in the data set. 

This will also get rid of the non-informative features. 


