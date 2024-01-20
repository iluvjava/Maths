
### **Intro**

KL divergence is "Kullback-Leibler Divergence", it has the other name: "Relative Entropy". 
Given a probability distribution space $\chi$ and 2 probability density function denoted as $P, Q : \chi \mapsto \mathbb R$. 
The KL divergence for discrete distribution and continuous distribution are defined as

$$
\begin{aligned}
    D_{KL}(P||Q) &= \sum_{x\in \chi}^{}P(x) \log_2 \left(
        \frac{P(x)}{Q(x)}
    \right)
    \\
    D_{KL}(P||Q) &= \int_{-\infty}^{\infty} 
    P(x)\log_2 \left(
        \frac{P(x)}{Q(x)}
    \right)
    dx
\end{aligned}
$$


It measures the similarity between 2 pdf/pmf function. 
Note, usually: $D_{KL}(P||Q)\ne D_{KL}(Q||P)$. 
This is definitely **not a distance measure** as in real analysis because it's not symmetric. 

#### **Interpretations of KL-Divergence** 

> If we were to use some other kind of parameterized distribution to represents a given observed distribution, how much information is lost? And this question is answered by the measure made by KL-Divergence. 

**Demonstrations**

For simplicity we consider discrete distribution with variable state space $\chi$. 
Then by the definition of KL-Divergence we have the following equivalent representations: 

$$
\begin{aligned}
    D_{KL}(P||Q) &= \sum_{x \in \chi}^{}P(x)\log_2 \left(
        \frac{P(x)}{Q(x)}
    \right) 
    \\
    &= 
    \sum_{x\in \chi}^{}
    P(x)(\log_2(P(x)) - \log_2(Q(x))
    \\
    &= 
    \sum_{x \in \chi}^{}
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
    \mathbb{E}_{x\sim P}\left[
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
    H(P, Q) - H(P). 
\end{aligned}
$$

Compare above to [Cross Entropy](Cross%20Entropy.md), and [Shannon's Entropy](Shannon's%20Entropy.md). 
The integral representations are analogous. 

**Reference resources:**

1. Count Bayesie's article on [KL Divergence](https://www.countbayesie.com/blog/2017/5/9/kullback-leibler-divergence-explained)
2. Towards datascience's post on [KL Divergence](https://towardsdatascience.com/light-on-math-machine-learning-intuitive-guide-to-understanding-kl-divergence-2b382ca2b2a8)


---
### **A Specific Case of the Bregman Divergence**

> KL divergence is a case of Bregman Divergence where the generating function is the negative cross entropy function. 

See the example in [Bregman Divergence](Bregman%20Divergence.md). 

