Reference Lecture [this](https://www.youtube.com/watch?v=_e4SN4TWlgY&feature=youtu.be&ab_channel=NathanKutz)

Cocktail party conversations. 
[[PCA (Principal Components Analysis)]]

---
### Intro

A group of people are in a room. 

We place 2 microphone in the room. 

Let $S_1(t)$, $S_2(t)$ be the signal that is being omitted in the room.

But can we separate all the talkings from people in the room? 

And this is the idea that we want to do here. 

And, let's assume that the microphones are recording these signal, then, we can confidently say that, the observed signal: $x_1(t)$, $x_2(t)$ can be: 

$$
x_1(t) = a_{11} S_1(t) + a_{12} S_2(t) \quad 
x_2(t) = a_{21} S_1(t) + a_{22} S_2(t)
$$

And, we have the linear combinations of the $s$ signal received in multiple channels. Notice that, it's a constant, so the objects that are emitting the signals are not moving in a sense, nor is the microphone. 

However, we don't know the constants that is associated with the mixed signal. 

So the idea is to **Approximate** it. And if we know that coefficients, then we can use the inverse linear transform to split the signal, such that each channels corresponds to one unique signal. 

#### Notes: 

The very important assumption here is that, the signal send from different sources are statistically independent. And it should ring the bell that, PCA might be applicable here. 

#### **Applications**? 

1. Radar Detection: What happens if there are multiple signal bouncing back? In that case, we would love to have multiple signals receivers in this case. 
2. EEG: Brain activity measurements. Where we have a lot of sensors around the brain, and we are interested in separating out the different signals that got sent out from the brain. 

---
### The Math and Theory

Given N distinct linear combinations of N signals, determine that original N images. 

$$
x = As
$$

Where $x$ is measured, and $s$ is the signals, where we assumed its existence. 

PCA ---> ICA ?

The principal component chooses the vector that, minimizes the residual on all the data set, under the 2 norm. For a given high dimensional gaussian distribution. 

However, for multiple clusters, this doesn't work. 

**ICA is broken** when the signal is giving gaussian distribution, eg: **White Noise**. 

**Objective**: find another linear transformation on $x$ such that the off diagonal of the covariance matrix on the transformed data is minimized. 
* There are other ways to do it, but SVD is one of them. 

$$
\begin{bmatrix}
x_1 \\ x_2
\end{bmatrix} = 
A
\begin{bmatrix}
s_1 \\ s_2
\end{bmatrix}
$$

Assumption: 

1. $s_1, s_2$ are not giving gaussian distribution. Because Gaussian row matrix is going to produce diagonal matrix. So, regardless of how you change your basis, they are always going to be pretty independent on different channels. 
2. $p(s_1, s_2) = p(s_1)p(s_2)$: The joint distributions of these 2 signal are the products of the signal. 

Let's say that: $A = U\Sigma V^T$

$$
x = (U\Sigma V^T)s
$$

---

### Theory

The theory part of the ICA is highlighted in the textbook, Chapter 16.2, but here we will prepare for it. Because it's really that trivial compare to how we used Fourier Transform for time series and image processing. 

The basic idea is to leverage the change of statistical feature under a linear transform of the signal (If we model is as random variable) together with the assumption that $A = U\Sigma V^T$, to help us undoing the effect of matrix transform by purely looking at the mixed signal. 

