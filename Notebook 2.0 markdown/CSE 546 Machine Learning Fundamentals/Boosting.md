[Decision Forest and Committee](Decision%20Forest%20and%20Committee.md)

[NCSU Lectures on Boosting](https://www4.stat.ncsu.edu/~lu/ST7901/lecture%20notes/2019Lect23-Boosting.pdf)

[Towards data Science on Boosting](https://towardsdatascience.com/boosting-algorithms-explained-d38f56ef3f30)

---
### **Intro**

Boosting is a generic algorithm other than a specific model. 

Key Idea: 
1. Models are trained sequentially 
2. The next model will have to focus more on the weakness of the previous model. 


---
### **AdaBoost (SAMME)** 

let $C$ be a weak classifier: 

The error is defined via: 

$$
E = \frac{\sum_{j = 1}^{n}w_j\mathbf{1}\{C_j(x_j)\ne y_j\}}
{
    \sum_{j = 1}^{n}w_j
}
\tag{1}
$$

And this is a measure on the weakness of $C$

Variables: 
* $W$ is $n\times 1$, representing the weights of each sample. 
* $E$ is the performance of the model. 
* $Y$ is $n\times k$, where $n$ is the number of samples and $k$ is the number of labels. This is a multiclass classification[^1] problem. 
* $X$ is the row data matrix, which is $n\times d$. 

Observations: 
* The error rate is close to one if the weight of correctly classified sample are very high. 
* If the heavily weighted samples are not correctly answered, the value of $E$ is small. 

**Algorithm**: 

SAMME: [Paper Link](https://web.stanford.edu/~hastie/Papers/samme.pdf), it's implemented in SkLearn, which is for multiclass classification.

1. Initial weights such that: $w_j = \frac{1}{n}$. 
2. For all weak classifier $C_i$: 
   1. Compute Error for this model $E_i$ using expression (1).
   2. compute $\alpha_i = \log\left(\frac{1 - E}{E}\right) + \log(k - 1)$
   3. update using $w_j = w_j\exp(\alpha_i\mathbf{1}\{C_i(x_j)\ne y_j\})$
   4. $W: = W - \bar{W}$
3. $\hat{y}_j = \max_k\{\sum_{i = 1}^{n}\alpha_i \mathbf{1}\{C_i(x_j) = k\} \}$

**Observations**: 
1. To make $\alpha_i$ non-negative, the model has to score slightly higher than $\frac{1}{k}$. 
2. The weak learning can't make $E = 1$, that will break the algorithm. See step 2.2 of the algorithm.
3. This is what the fraction means:   
    $$
    \begin{aligned}
        \frac{1 - E}{E} &= 
        \frac{\sum_{j = 1}^{n}w_j \mathbf{1}\{
            C(x_j)=y_j\}}
            {\sum_{j = 1}^{n}w_j\mathbf{1}\{
                C(x_j)\ne y_j\}}
    \end{aligned}
    $$



The ratio between correct label and the incorrect label. 




[^1]: Multi-class is multiple class, but choosing one, not to be confused with multi-label, right after the first iteration. 