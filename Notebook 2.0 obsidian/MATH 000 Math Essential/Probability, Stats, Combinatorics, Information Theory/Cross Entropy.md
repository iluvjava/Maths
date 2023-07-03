Cross entropy relates to [[KL-Divergence]] and [[Shannon's Entropy]]
 
---
### **Intro**

Cross entropy concerns with using the message encoding of one probability distribution to represent the probability distribution of the other set. This is the definition of cross entropy: 

$$
H(P, Q) = \mathbb{E}_{x\sim P}
\left[
    -\log(Q(x))
    \right]
$$

The expected value of $\log(Q(x))$ where $x\sim P$ is the cross entropy of $P, Q$. **This is not a distance metric**, because it's not symmetric. 

**Observations**

1. The message length of a random outcome from distribution $Q$ is $\log(Q(x))$. 
2. The cross entropy is measure the average message length if we use the optimal message encoding for the distribution $Q(x)$ where the random variable is drawn from the distribution $P(x)$. 

---
### **Application | Loss Function Design**

> Using cross entropy for designing the loss function is equivalent to Maximal Likelihood, and this is just a different interpretation of the same formula that does that same thing. 

The binary category cross entropy loss is computed as: 

$$
\begin{aligned}
    \frac{1}{N}\sum_{i = 1}^{N}-\left(
        y_n \log(x_n) 
        + 
        (1 - y_n)\log(x_n)
        \right) 
    &= 
    H(P, Q)
\end{aligned}
$$

With the assumption that, $y_n\sim P$ and $x_n\sim Q$. The more similar the 2 distribution, the less the expression is. The term $\frac{1}{N}$ is optional. 
