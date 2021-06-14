This is some of the major ideas used to produce the loss function for the variational auto-encoder.



---
### **Intro**

KL divergence is "Kullback-Leibler Divergence", it has the other name: "Relative Entropy". 

Given a probability distribution space $\chi$ and 2 probability distribution denoted as $P, Q$. 

The KL divergence from $Q$ to $P$ is: 

$$
D_{KL}(P||Q) = \sum_{x\in \chi}^{}P(x) \ln \left(
    \frac{P(x)}{Q(x)}
\right)
$$

And in the continuous case we have the expression: 

$$
D_{KL}(P||Q) = \int_{-\infty}^{\infty} 
p(x)\ln \left(
    \frac{p(x)}{q(x)}
\right)
dx
$$

Note, usually: $D_{KL}(P||Q)\ne D_{KL}(Q||P)$


