Here we will talk in details about the decision tree machine learning model. 

Major Reference Materials: 
1. sklearn 
2. Medium article [link](https://towardsdatascience.com/entropy-how-decision-trees-make-decisions-2946b9c18c8)
3. Elements of Statistical Learning

Require: [[Basic Machine Learning]]

---
#### **Intro**

It's a tree that split the samples by one feature at a time according to some kind of objective measure that serves as heuristic for classifying that data. In general, getting the optimal tree that partition the features space to best locate each of the data point is NP-Hard, usually it's done differently by not going for the absolute optimal. This models it's powerful because it assumes very little about the underlying structure of the data, resulting it tends to over-fit, and very likely to create a lot of variances because of noise. 

---
### **Partitioning Heuristics**

The measure of **Entropy**:

$$
E(S) = \sum_{i = 1}^{c}\left(
        -p_i \log_2(p_i)
    \right)
$$

Where $p_i$ denotes the frequencies (should be a fraction between 1 and 0) of a class $i$, $S$ is the random variable denoting the samples. Higher the entropy, more uniform is the distribution. For a binary classification, the label are divided into $p$ and $1 - p$, then the above formula will be simplified to [Cross Entropy](../STATS%20501%20Statistics%20for%20Mathematicians/Cross%20Entropy.md): 

$$
E(S) = -p\log_2(p) - (1 - p)\log(1 - p) \quad \text{Where } p \in (0, 1)
$$

A plot of the above function: 

![[entropy-function.png]]

Here is the measure of information gain: 

$$
IG(Y, X) = E(Y) - E(Y|X)
$$

Subtracts the entropy of Y given X from the Entropy that is just Y. The term $E(Y|X)$ is in fact: $E(\text{Label}|\text{Feature})$. Given on observed features, among out data set, Take out all the sample with the same observation on the feature, and then we measure the entropy of that group. This is asking the questions that, what is the entropy among all the data point that has this particular Observed Feature. 

One of the extreme cases is when, all the Entropy is due to one feature, meaning that: $E(Y) = E(Y|X)$, and under this case, the information gain will be $0$. If, it's the case that among all the data with this feature, they have exactly the same label $Y$, then it will be the case that $IG = E(Y)$. 

---
### **Decision Tree Basics**: 

Here we will summarize the brain-dead algorithm for splitting the decision tree using one feature

Assuming that we are splitting the population with Label $L_1,L_2$, and the feature that we are focusing by is $F_1$. 

Compute the Entropy of the Parent Node: $P(\text{Parent})$, which is just the entire population, then, choose this feature $F_1$ and select criteria $k$[^1], compute the quantities: 

$$
E(F_{1} < k) \quad E(F_1 \ge k)
$$

Compute the weighted average on 2 of the information gain using: 

$$
\text{Ave} = 
\frac{N_{<k}}{N} E(F_1 < k) + \frac{N_{\ge k}}{N}E(F_1 \ge k)
$$

Where, the weights are determined by the number of sample splited by the criteria over the total number of samples in the parent node. 

Now, we will be able to compute the information gain[^2] for the system via 

$$
IG(\text{Parent}, \text{Balance}) = E(\text{Parent}) - \text{Ave}
$$

Note that, the general heuristic will aim for maximal information gain, meaning minimal entropy on the children nodes, ensuring increasing purity as we split more and more times.

---
### **Decision Tree Parameters, and Practicality**

The decision tree model has large variance and complexity, it makes no assumption about the type of data, hence, if something is expected for the problem, or we need to exploit potential structure for the data, then we will need to look at its parameters. 

**Model Weakness**: 
1. High Variance, some algorithms choose the feature to split at random, or in a greedy manner.
2. Predictions are none smooth, decision boundary are none smooth. 
3. **Cannot extrapolate**.
4. The model cannot learn logical relations between the predictors, XOR, parity, or multiplexoer. 
5. Tree are biased if some classes dominate. It's recommend to have **balanced** training data for the decision tree. 

The theme here is that, the model seeks to optimize the quantity that: 

$$
\mathbb{E}(\text{Label}|\text{Feature})
$$

And no extrapolation is involved. 

**Tips**[^3]: 

1. Due to the weakness and the nature of the model, it's recommended to perform PCA and LDA Dimensionality Reduction for the Tree Model. 
2. Balance your data set for training, Consider adjusting the weights to adjust the bias as well. 


**Model is Good for**: 

* The model is very good for categorical attributes. 

---
### **Decision Tree Algorithms** 

1. ID3
2. C4.5 
3. C5.0
4. CART 


[^1]: How to choose this criteria efficiently? 
[^2]: What if we choose another feature to split the data instead? 
[^3]: Tips are from sklearn: [link](https://scikit-learn.org/stable/modules/tree.html#tree-algorithms-id3-c4-5-c5-0-and-cart)