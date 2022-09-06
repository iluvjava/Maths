Make sure you already understand [[Decision Tree]] from a mathematical perspective. 

Here is some more notes about [boosting algorithm](https://towardsdatascience.com/boosting-algorithms-explained-d38f56ef3f30) in general. 

---
### **Intro**

The random tree model itself is a Low Bias, High Variance Model. 

Therefore, Ensemble method makes sense and it's possible for it to improve the this particular model. This is also called Bagging. 

Random Forest

**Tree Bagging Algorithm:** 

1. for b = 1 to B

    (a) Draw Bootstrap sample $Z^*$ from the training data. 

    (b) Grow a random tree $T_b$ from the bootstrap data (Use whatever cool algorithm there is to do this). 

2. Output ensemble trees $\{T_b\}_{i = 1}^{B}$. 


To make the prediction, we use the following algorithm: 

For regression tree we have: 

$$
\hat{y}_i = \frac{1}{B}\sum_{i = 1}^{N}T_b(x_i)
$$

It's just the average of all the prediction from the forest. 

For classification tree, we are going to use the majority vote. 

**Fact** 

Do you know there is a best root node size that people use by default for the tree? 

For regression model, the optimal size leaf node is $p/3$, and for classification tree, it's $\sqrt{p}$, where $p$ is the total number of attributes. Default parameters are good enough for most of the stuff. 


**Hyper Parameters for the Tree/Forest Model**

1. The size of the leaf node. 
2. The decision criterion for branching on a certain attribute. 
3. The size of the forest.


**Forest Comes with Confidence Interval**

We can use the tree to get a non-parametric confidence level for the prediction when using the random forest model. We just need to get the bag of trees. 


---
### **Boosting and Additive Model**

Let's talk about the ideas of additive models. 

Boosting is one of the way of merging a lot of weak learners (Classifier models, not emsemble methods) so that they combine and forms a strong learner. 

**This is the over all idea of Additive Model:**

1. Given training set $(x_i, y_i)$, $1 \le i \le n$, let feature $x \in \mathbb{R}^d$, and let label be $y_i \in \{1, -1\}$. 

2. Let $\phi_i: \mathbb{R}^d \rightarrow \mathbb{R}, 1 \le i < p$. Where $\phi_i$ is a function belongs to different classes of function, like, regression, tree, logistic, or Neural Net, let's say there are $p$ of them in total. 
3. Now, we are going to learn some weights using the rule that: $
\hat{w} = \arg\min_w \sum_{i = 1}^{n}L(y_i, \sum_{t = 1}^{p} w_t \phi_t(x_i))$, We are looking for a set of weights among all these learners, such that the prediction made by all of them is minimizing the Loss of something. This problem in particular, is hard to solve (NP-Hard). 

**This is the algorithm greedy algorithm for doing the model weighting:**

Usually, we use a greedy approach for constructing an set of additive model and here is the algorithm: 

1. Initialize $f_0(x) = 0$
2. for m = 1 to M: 
   1. Compute 

$$
(\beta_m, \gamma_m) = \arg\min_{\beta, \gamma} \sum_{i = 1}^{N}
L(y_i, f_{m - 1} + \beta b(x_i; \gamma))
$$
 
   2. set $f_m(x) = f_{m - 1}(x) + \beta_m b(x; \gamma_m)$

**Explanation:**

The function $b$ here, is a weak learner with a given parameter $\gamma$. Greedily, we want to find the weight for each new added model such that it minimizes the total loss over a loss function. In this case, are only minimizing one parameter each time. $\gamma$ can also be a set of parameters when each individual models are complex. 

The function $L$ here is the "appropriate" loss function for the model. 

**Interpretation**

Under the regression loss case, each new added model, $b(x_i; \gamma)$ during the iteration, is trying to fit a model for the residual of the data. The weight scale the model, and the parameters "shapes" the model. 

**Practicality**

It's a very general idea, and consider the **XGBoost** package when doing this in real life.

Bagging is faster because a learners can be trained in parallel, boosting on the other hand, needs the results from the previous learners. 


**What if we compare the Bagging idea and Boosting Idea?**

Boosting is learning linear dependent classifier, changing one of the weak learning is going to make drastic difference on the output, the bagging on the other hand, is using bootstrap, in theory all the weak learners from bagging should be independent learners, and changing one of them from the same training set is not going to change the output by much.


