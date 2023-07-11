---
alias: Random variables basics with measure theory

---
[[Probability Spaces]]


---
### **Intro**

We note that random variable exists in abstract measurable space, here we defined the usual type of random variable that maps from some type of Sigma-algebra for the event space to the real line. 

#### **Def | A Real Random Variables**
> A Real Random Variable $X$ is a function that maps from the $\Omega$ to $\mathbb{R}$. Assume that random variable $X$ is associated with probability spaces $(\Omega, \mathcal{F}, P)$ then $X:\Omega \mapsto \mathbb{R}$ is a real Random Variable (R.V.) when: 
> $$
> \forall B\in \text{Borel}(\mathbb{R}): X^{-1}(B) \in \mathcal{F}.
> $$
> 
> To test whether a function $\Omega \mapsto \mathbb R$ is a real random variable when its pre-image for all $B\in \text{Borel}(\mathbb R)$, 
> 
> $$
> X^{-1}(B) = \{\omega \in \Omega: X(w) \in B\},
> $$
> is a measurable set, by the probability measure $P$. 


**Remarks**

I am unaware of a simple counter example of a random variable whose pre-image is not a measurable set. 


**References**

Rick Durrett's, Probability, theory and applications. 

---
### **Example-1 | Indicator Function**

The indicator function is defined on $A\in \mathcal{F}$: 

$$
\mathbb{I}_{A}(\omega) = \begin{cases}
    1 &\omega \in A
    \\
    0 & \text{else}
\end{cases}
$$

It indicates whenever a given outcome is in the event $A$ or not. And it outputs binary value $1, 0$ to distinguish it. 


---
### **Cumulative Distribution Function**

For any R.D, a distribution function can be defined for the random variable. The Cumulative Distribution function for random variable $X$ is defined as: 

> $$
> F_{X}(y) := P(X \le y) = P(X^{-1}((-\infty, y]))
> $$

The function $F_X(y)$ outputs the measure of the pre-image on random variable $X$ on the interval $(-\infty, y]$. The CDF must satisfies these properties for it to work: 

1. $F_X$ is  is non-decreasing.
2. $\lim_{x\rightarrow + \infty} F_X(x) = 1 \wedge \lim_{x\rightarrow -\infty}F_X(x) = 0$. 
3. $\lim_{x\searrow y}F_X(x) = F_X(y)$, right continuity. 

And notice that, the right limit of the function to the point equals to $F_X(y)$, the left limit of any point turns out to be: 

$$
\lim_{x\nearrow y}F(y) = P(X < y)
$$

The left limit of the point is the probability of observing $X < y$, where equality is gone. 

**Property 1**: 

of CDF is directly derived using the fact that Pre-Images: 

$$
y_1 < y_2< \cdots y_n \implies \{X\le y_1\}\subseteq \{X\le y_2\} \subseteq\{X\le y_3\}\cdots
$$

And using the property of probability measure, the measure on all those pre-images have: 

$$
P(\{X\le y_1\})\le P(\{X\le y_2\}) \le P(\{X \le y_3\}) \cdots
$$

Therefore, the CDF is strictly non-decreasing. 


---
### **Discrete Random Variable (Distribution, Probability Measure)**

A probability measure(And any random variable on it, and the distribution on the random variable) is said to be discrete if there is a countable set $S$ such that $P(S^C) = 0$. Basically, the probability assigned to a countable set is somehow, $1$, and it placed a measure of $1$ to the countable set. 


---
### **Reconstruction of Random Variable from CDF**

Given any CDF, then a random variable function mapping from $\Omega$ to $\mathbb{R}$ will be: 

$$
X(\omega) = \sup\{y : F_X(y) < \omega\} = \sup\{
        F^{-1}_X\left((-\infty, y]\right)
    \}
$$

Given any $\omega$ outcome, the random variable map to the upper bound on the pre-image of $F_X$ for input $y$. Thinking in terms of pre-images of functions will help us a lot with some of the analysis part. 


