Here, we will be taking a basic look at Variational Encoder. 
Resource: [link](https://arxiv.org/pdf/1606.05908.pdf)

---
### **Intro**

This is a model that tries to capture patterns (Colliniearity, abstract patterns) from the data set. 

It will then try to make artificial samples that looks like it's from the data set.

Given a random variable $z$, a data set ddenoted by $X$, we want to maximaize the probability of each random variable $X$ being in the training set. 

Basically we put noise into the model and then we get back samples from the data set. For each sample in the data set, there should exist at least on random noise, or a class of them that produces the given sample. 

We are maximizing: 

$$
\mathbb{P}\left(X = x\right) = \int_{z\in\mathcal{Z}} f(z;\theta)\mathbb{P}\left(Z = z\right)dz
$$

The probability of producing something in the sample by giving is some kind of noise.  

Why is this a machematical sound thing to do? 

Ok, say want to produce a Guassian Distribution using uniform distribution, then it's not hard to just integrate use the inverse of the CDF of Guassian to get the mapping for such a function. However, in this case, **we are training** that mapping. 

Let $X\sim \mathcal{N}(0, 1)$ we want to train a mapping $G(x)$ such that $G(X)$ best approximate the PDF of any given function $f(x)$. Nice and easy. 

The variable that is drawn from the noise is called the "**Latent Variable**". 

**Questions**

How to define the latent variable? What is the best latent varible? 

How do we train such a network and how to maximizes the probability that something is in the sample?

**Auto Encoder**

For background, we need to know about Auto encoder first. 

Auto encoder is a Neuro network that takes in features in the higher dimension and then maps it to a layer that is on a much smaller dimension, and then it tries to reconstruct the original sample by expanding the features hiding in the latent space. 

This allows us to essentially construct higher dimensional features using lower dimensional featurese. No labels are used to train this. 


---
### **Some to Take for Granted**: 

> Given any distribution function in $\mathbb{R}^n$ there exists a function $f$ such that for random variable $X\sim \mathcal{N}(0, 1)^n$, the function $f$ has $f(x)$ approximating the distribution. 

**Questions**: 

What is the probability of generating something that is from the data set? 

Very small. Especially when it's an image, there are simply too many pixels. 

**Key Idea**

Let's sample a distribution of variable $Z$ such that it's most likely to produce the random variable $X$. 

Let's define $Q(z|X)$ be the probability of given some observed random variable from $X$, the probability such that $z$ can produce that data using the VAE(variational Auto Encoder). 

The relationship between these 2 expressions: 

$$
\mathbb{E}_{z\sim Q}\left[
        \mathbb{P}\left(X|z\right)
    \right]
\quad
\mathbb{P}\left(X\right)
$$

Is the key to the understanding of Auto-Encoder: 

---
### **Kullback–Leibler Divergence**

Kullback-Leibler Divergence is a measure on how similar 2 different probability distribution is. 

Suppose that $X\in\Omega$ is a random variable drawn from some random variable space. And there are 2 distribution $P, Q$ over the space. Then the entropy between them will be: 

$$
\mathcal{D}_{KL}(P||Q):=
\sum_{x\in\Omega}^{}
    P(x)\log
    \left(
        \frac{P(x)}{Q(x)}
    \right)
$$

Take note that if $P(x) = Q(x)$, then we are summing up zeros, because we had 1 inside of the log, which will be giving us zero for each term in the sum. 

For continuous distribution, we just change the sun into a integral and that is. 

**Important Observation**: $\mathcal{D}_{KL}(P||Q)\ne \mathcal{D}_{KL}(P||Q)_{KL}$

**Bayes Interpretation**: 

This is the amount of information lost if $Q$ is used to approximate $P$. 

[Wiki Link](https://www.wikiwand.com/en/Kullback%E2%80%93Leibler_divergence)



