[[Bias Variance Tradeoff]]
Here, we will see how to manage cross validation techniques. 

---
### **Intro**

#### **LOO Leave One Out Cross Validations**

Given a set of training set, we leave one sample out to get the error for the model that trains on the rest of the data set. 

Such an estimator for the error of the function is **unbiased** for the true error. 

Then for every data point, we are going to to leave that error and compute the error for all of these leave out. So in total we are training $n$ number of models. And that is a lot. 

Here is the routine for computing the estimated error for the given model using LOO: 

$$
\text{Error}_{\text{Loo}}
- 
\frac{1}{n}
\sum_{j = 1}^{n}
    (y_i - f_{\mathcal{D}\setminus j}(x_j))^2
$$

Where $f_{\mathcal{D}\setminus j}$ denotes the model trained using all the samples except for the $j$ th sample in the training set. 

**Note**: We are taking the average of all of leave out sample error. 

This is going to be pretty slow to train tho.

**The Biases of LOO**

Take note that, the model we are raining is only using $n - 1$ parameter, so the performance is going to be poorer than using $n$ elements, but when we test it, we are taking the average of all $n$ sample for the errors to get the estimate for the system. 

The error is going to be an **Overstimate**. Because: 

$$
\mathbb{E}_{D}\left[(f_\mathcal{D} - Y)^2\right] 
\le \mathbb{E}_{D}\left[
    (f_\mathcal{D\setminus j} - Y)^2
    \right]
$$

**Note**: 

This is the most statistlcally sound thing to do for getting the error for the model, but in truth, we don't use it because it's too slow. And everytime, we are going to t use: 

---
### **K-Fold Cross Validation**

We aer goint to use a larger set that varification, by partitioning the training set into $k$ equal sized partition. 

let's assume that the set is partition into equal sized sample set: $\mathcal{D}_j$ where $1 \le j \le k$. So the notation of $f_{\mathcal{D}\setminus\mathcal{D}_i}$ is a model that is trained using the training set for all the sample, but leave out the $i$ partitions from the k-fold technique. 

$$
\text{Err}_{\mathcal{D}_i} = 
\frac{1}{|\mathcal{D}_i|}\sum_{(x_i, y_i)\in\mathcal{D}_i}^{}
    (y_j - f_{\mathcal{D}\setminus\mathcal{D}_i}(x_j))^2
$$

**Questions**: 

What is the test set? 

The test set is not in the k-fold scheme, it's the set of samples that are left out at the beginning of the routine. 


