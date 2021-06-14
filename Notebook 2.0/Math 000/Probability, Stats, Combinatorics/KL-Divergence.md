This is some of the major ideas used to produce the loss function for the variational auto-encoder.

Something is similar to what we have here is the [[Shannon's Entropy]]

Reference resources: 

1. Count Bayesie's article on [KL Divergence](https://www.countbayesie.com/blog/2017/5/9/kullback-leibler-divergence-explained)
2. Towards datascience's post on [KL Divergence](https://towardsdatascience.com/light-on-math-machine-learning-intuitive-guide-to-understanding-kl-divergence-2b382ca2b2a8)

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

Note, usually: $D_{KL}(P||Q)\ne D_{KL}(Q||P)$. This is definitely **not a distance measure**. 

**Key:** 

> If we were to use some other kind of paramaterized distribution to represents a given observed distribution, how much information is lost? And this question is answered by the measure made by KL-Divergence. 

Consider this: 

$$
\begin{aligned}
    D_{KL}(P||Q) &= \sum_{x \in \chi}^{}P(x)\ln \left(
        \frac{P(x)}{Q(x)}
    \right) 
    \\
    &= 
    \sum_{x\in \chi}^{}
    P(x)(\ln(P(x)) - \ln(Q(x))
    \\
    &= 
    \sum_{x \in \chi}^{}
        P(x)
        \left(
            \ln\left(
                \frac{1}{Q(x)}
            \right)
            - \ln \left(
                \frac{1}{P(x)}
            \right)
        \right)
    \\
    &= 
    \mathbb{E}\left[
            \ln\left(
                \frac{1}{Q(x)}
            \right)
            -
            \ln \left(
                \frac{1}{P(x)}
            \right)
        \right]
\end{aligned}
$$

Interesting. Not quiet entropy but it  sure looks funny. 




