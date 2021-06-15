Cross entropy relates to [[KL-Divergence]] and [[Shannon's Entropy]]
 
---
### **Intro**

Cross entropy concerns with using the message encoding of one probabilty distribution to represent the probability distribution of the other set. 

This is the definition of cross entropy: 

$$
H(P, Q) = \mathbb{E}_{x\sim P}
\left[
    -\log(Q(x))
    \right]
$$

The expected value of $log(Q(x))$ where $x\sim P$ is the cross entropy of $P, Q$. 

**This is not a distance metric** 

**Observations**

1. The message length of a random outcome from distribution $Q$ is $\log(Q(x))$. 
2. The cross entropy is measure the average message length if we use the optimal message encoding for the distribution $Q(x)$ where the random variable is drawn from the distribution $P(x)$. 
