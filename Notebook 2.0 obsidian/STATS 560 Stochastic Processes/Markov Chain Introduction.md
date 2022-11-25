[[Conditional Probability]]

---
### **Intro**

We introduce the discrete case of the Markov Property. 

**Definition: Markov Chain**

> $X_n$ is a sequence of random variables indexed by $n$, it's a markov chain when we have: 
> 
> $$
> \begin{aligned}
>     \mathbb P(X_n = x| σ(\{X_i\}_{i = 1}^n)) = \mathbb P(X_n = x |X_{n -1})
>     \quad \forall x \in S, 
> \end{aligned}
> $$
> 
> Where $S$ is refers to the state space of $X$. The sequence of random variable can be from a finite set, infinite set, or an uncountable set. 
 
When $|S|$ is countable, we use a matrix to determine the probability of $\mathbb P(X_{n + 1} = x_{n + 1}| X_n = x_n)$, in other cases, we will consider the transition Kernel. To apply the transition kernel is to convolve the probability mass function on the probability space, which is applied functional analysis. In this file, we will avoid discussion of the topic. 

**Transition Matrix**

Define the transition matrix to be a matrix whose columns are probability assignment, given as: 

$$
\begin{aligned}
    P(i, j) = \mathbb P(X_{n + 1} = j| X_n = i) \quad \forall (i, j)\in S \times S, 
\end{aligned}
$$

and to apply a transition to a probability density function $f: S \mapsto \mathbb R_+$, we treat it as a vector of discrete probability assignment and it's stated as: 

$$
\begin{aligned}
    (f^TP)_i = \sum_{j\in S}^{} \mathbb P(X_{n + 1}= i| X_n = j)f_j = \sum_{j \in S}^{}P(j, i)f_i,  
\end{aligned}
$$

it's unintuitive, but remember the conditional probability is swapped in the expression, and there is this convention of left multiplications of transition matrix. 

**Remarks**:

The matrix's row sum is equal to one because left multiplying $e_i$  gives the $i$ th row of the matrix and it's a discrete distribution on $S$ by definitions of probability. 

---
### **Strong Markov Property**

Strong Markov property is similar to the memoryless property of the exponential distributions. 
