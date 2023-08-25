[Maximal Likelihood Estimator](Maximal%20Likelihood%20Estimator.md)


---
### **Intro**

Sufficient statistics is useful in separating the parts of the likelihood function that is relevant to the parameters, and parts of the likelihood function that is not relevant to the parameters. For this section we follow 6.7 of the textbook \[1\] "Probability and Statistical Inferences", edition 9, and chapter 2 of \[2\] "Statistics for Mathematician, A Rigorous First Course". 

Suppose that $\{x_i\}_{i = 1}^n$ observations were made from some distributions, i.i.d random variable, with parameter $\theta$. Then, $T(X_1, \cdots, X_n)$ as a function of random variable are called a statistics. They summarized the sequence of realizations. They usually do not contain full information about the distribution. 

#### **Def | Sufficient Statistics**
> Let $\{X_i\}_{i = 1}^n$ be a sequence of i.i.d realizations from some distribution. A statistics $T:\mathcal X^n\mapsto \mathbb R$ is called sufficient for the parameter $\theta$, if $\mathbb P(X_1 \le x_1, \cdots, X_n \le x_n | T = t)$ doesn't depend on $\theta$ for all $(x_1, \cdots, x_n) \in \mathbb R^n$ and all $t\in \mathbb R$. 

**Observations**

No dependence meaning that given the value of $\theta$, the probability about random variable $T$, won't change, for every possible realizations from the distribution, and the value of $T$. 

#### **Thm | Sufficient Characterizations, Fisher Neymen Factorizations**
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

The full proof for the continuous case requires some measure theory. However, the proof of sufficiency is more demonstrative. 


---
### **Examples | The Exponential Family Distributions**

The sufficient statistics for the exponential family of distribution is the same. A lot of the common distribution that has a name to it is from the exponentia family distribution. 

#### **Def | Template for the Exponential Family**
> The exponential family are pdf/pmf that admitted the form 
> $$
> \begin{aligned}
>     f(x | \theta) = \exp(\eta(\theta)T(x) - d(\theta) + S(x)) = \frac{\exp(\eta(\theta)T(x))}{\exp(d(\theta))}\exp(s(x)), 
> \end{aligned}
> $$
> which looks legit since it looks non-negative. It has $\sum_{i = 1}^{n}T(X_i)$ being its sufficient statistics.

**Demonstration for Sufficient Statistics**

Suppose that $\vec X$ denotes $n$ i.i.d realizations r.vs from the distribution then the logged likelihood function for the parameter $\theta$

$$
\begin{aligned}
    -\ln\mathcal L(\vec X |\theta) &= 
    \ln\exp
    \left(
        \eta(\theta) \sum_{i = 1}^{n}T(X_i) - 
        nd(\theta) + \sum_{ i =1}^{n}S(x_i)
    \right)
    \\
    &= 
    \eta(\theta) \sum_{i = 1}^{n}T(X_i) - 
        nd(\theta) + \sum_{ i =1}^{n}S(x_i)
    \\
    &= 
    \underbrace{\left (\eta(\theta) \sum_{i = 1}^{n}T(X_i)\right)}_{\ln\varphi(\vec X| \theta)}
    - 
    \underbrace{\left(nd(\theta) + \sum_{ i =1}^{n}S(X_i)\right)}_{\ln h(\vec X)}, 
\end{aligned}
$$

and hence we had performed a separations between the parameters, the sufficient statistics is the sum $\sum_{i = 1}^n T(X_i)$. 



