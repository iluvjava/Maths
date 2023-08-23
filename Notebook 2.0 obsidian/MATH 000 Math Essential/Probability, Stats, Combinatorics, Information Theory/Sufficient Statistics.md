[Maximal Likelihood Estimator](Maximal%20Likelihood%20Estimator.md)


---
### **Intro**

Sufficient statistics is useful in separating the parts of the likelihood function that is relevant to the parameters, and parts of the likelihood function that is not relevant to the parameters. For this section we follow 6.7 of the textbook \[1\] "Probability and Statistical Inferences", edition 9, and chapter 2 of \[2\] "Statistics for Mathematician, A Rigorous First Course". 

Suppose that $\{x_i\}_{i = 1}^n$ observations were made from some distributions, i.i.d random variable, with parameter $\theta$. Then, $T(X_1, \cdots, X_n)$ as a function of random variable are called a statistics. They summarized the sequence of realizations. They usually do not contain full information about the distribution. 

#### **Def | Sufficient Statistics**
> Let $\{X_i\}_{i = 1}^n$ be a sequence of i.i.d realizations from some distribution. A statistics $T:\mathcal X^n\mapsto \mathbb R$ is called sufficient for the parameter $\theta$, if $\mathbb P(X_1 \le x_1, \cdots, X_n \le x_n | T = t)$ doesn't depend on $\theta$ for all $(x_1, \cdots, x_n) \in \mathbb R^n$ and all $t\in \mathbb R$. 

**Observations**

No dependence meaning that given the value of $\theta$, the probability about random variable $T$, won't change, for every possible realizations from the distribution, and the value of $T$. 

#### **Thm | Sufficient Characterizations, Fisher Neyman Factorizations**
> Suppose that i.i.d realizations $(x_1, \cdots, x_n)$ has a join pmf/pdf $f(x_, \cdots, x_n | \theta)$, for some parameter $\theta \in \Theta$. A statistics $T$ is sufficient for $\theta$ if and only if there exists $g: \mathbb R\times \Theta \mapsto \mathbb R$, and $h: \mathcal X\mapsto \mathbb R$  such that 
>
> $$
> \begin{aligned}
>   f(x_1, \cdots, x_n | \theta) &= 
>   g(T(x_1, \cdots, x_n) | \theta) h(x_1, \cdots, x_n). 
> \end{aligned}
> $$

**Context**

This is an equivalent condition for the definition of a sufficient statistics stated early. The existence of factorization of the form above is equivalent to having a statistics that is able to fully describe the parameter $\theta$. 

**Proof in the Discrete Case**

The full proof for the continuous case requires some measure theory. 


---
### **Examples | The Exponential Family Distributions**



