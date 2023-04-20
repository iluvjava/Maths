This is some of the major ideas used to produce the loss function for the variational auto-encoder.

Something is similar to what we have here is the [Shannon's Entropy](Shannon's%20Entropy.md), [Cross Entropy](Cross%20Entropy.md)

Reference resources: 

1. Count Bayesie's article on [KL Divergence](https://www.countbayesie.com/blog/2017/5/9/kullback-leibler-divergence-explained)
2. Towards datascience's post on [KL Divergence](https://towardsdatascience.com/light-on-math-machine-learning-intuitive-guide-to-understanding-kl-divergence-2b382ca2b2a8)

---
### **Intro**

KL divergence is "Kullback-Leibler Divergence", it has the other name: "Relative Entropy". 

Given a probability distribution space $\chi$ and 2 probability distribution denoted as $P, Q$. 

The KL divergence from $Q$ to $P$ is: 

$$
D_{KL}(P||Q) = \sum_{x\in \chi}^{}P(x) \log_2 \left(
    \frac{P(x)}{Q(x)}
\right)
$$

And in the continuous case we have the expression: 

$$
D_{KL}(P||Q) = \int_{-\infty}^{\infty} 
p(x)\log_2 \left(
    \frac{p(x)}{q(x)}
\right)
dx
$$

Note, usually: $D_{KL}(P||Q)\ne D_{KL}(Q||P)$. This is definitely **not a distance measure**. 

**Key:** 

> If we were to use some other kind of paramaterized distribution to represents a given observed distribution, how much information is lost? And this question is answered by the measure made by KL-Divergence. 

Consider this: 

$$
\begin{aligned}
    D_{KL}(P||Q) &= \sum_{x \in P}^{}P(x)\log_2 \left(
        \frac{P(x)}{Q(x)}
    \right) 
    \\
    &= 
    \sum_{x\in P}^{}
    P(x)(\log_2(P(x)) - \log_2(Q(x))
    \\
    &= 
    \sum_{x \in P}^{}
        P(x)
        \left(
            \log_2\left(
                \frac{1}{Q(x)}
            \right)
            - \log_2 \left(
                \frac{1}{P(x)}
            \right)
        \right)
    \\
    &= 
    \mathbb{E}_{x\in P}\left[
            \log_2\left(
                \frac{1}{Q(x)}
            \right)
            -
            \log_2 \left(
                \frac{1}{P(x)}
            \right)
        \right]
    \\
    &= 
    H(P, Q) - H(P)
\end{aligned}
$$

Interesting. It's cross entropy. 

### **A Generalized Bregman Divergence**

> KL divergence is a case of Bregman Divergence where the generating function is the negative cross entropy function. 



