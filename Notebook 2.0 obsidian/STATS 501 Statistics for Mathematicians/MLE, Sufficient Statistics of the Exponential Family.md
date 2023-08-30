
- [The Exponential Family](The%20Exponential%20Family.md)


---
### **Intro**

Recall single parameter exponential family $f(x| \phi) = \exp(\phi T(x)  - \gamma(\phi) - S(x))$, with $x \in \mathcal X$, then $\mathcal T = \sum_{i = 1}^{n}T(X_i)$ made from i.i.d realizations $X_1, \cdots, X_n$ is a sufficient statistics for the distribution. For discussion in this file, we take reference from: "Statistics for Mathematician, a Rigorous First Course". We state Proposition 2.11 from the text book:


#### **Thm | Sufficient Statistics of Exponential Family**
> Let $X_1, \cdots, X_n$ be i.i.d realizations from the distribution $f$, the exponential family with single parameter $\phi$ and $x\in \mathcal X$. If Characterize parameter space $\phi \in \Phi$, then if $\Phi$ is open and $\gamma$ is infinitely differentiable, we have $\mathbb E[\mathcal T] = n \gamma'(\phi) < \infty, \text{Var}\left[\mathcal T\right] = n \gamma ''(\phi) < \infty$. 

**Context**

The theorem states that the sufficient statistics for the exponential function is tracable and has nice properties. 

**Proof**

The proof is involved, we skip for now. 



#### **Thm | The MLE of the Exponential Family**
> Let $X_1, \cdots, X_n$ be i.i.d realizations from the distribution $f$, the exponential family with single parameter $\phi$ and $x\in \mathcal X$. Let parameter space be $\phi \in \Phi$, if $\Phi$ is open, $\gamma$ is infinitely differentiable, $T$ is not a constant function, and provided that the minimizer for the likelihood function $\hat \phi$ exists, then it is unique, given by the solution to the equation $\gamma'(\hat \phi) = \mathcal T/n$. 

**Context**

We applied the theorem regarding the nice properties of the sufficient statistics for exponential family to assist with computing the MLE of the exponential family. This is proposition 3.21 in the textbook. 


**Proof**

Directly see that the join likelihood function for i.i.d realization is 

$$
\begin{aligned}
    \mathcal L(\phi | \vec X) &= 
    \prod_{i = 1}^{n} 
    \exp \left(
        \phi T(X_i) - \gamma (\phi) - S(X_i)
    \right)
    \\
    \underbrace{\ln \mathcal L(\phi | \vec X)}_{l(\phi):=}
    &= \sum_{i = 1}^{n}
        \phi T(X_i)
    - \sum_{i = 1}^{n}
        \gamma (\phi)
    + \sum_{i = 1}^{n}
        S(X_i)
    \\
    & = \varphi \mathcal T - n \gamma(\phi) + 
    \sum_{i = 1}^{n}S(X_i). 
\end{aligned}
$$

From the assumption that $\gamma$ is infinitely differentiable, it's twice differentiable hence 

$$
\begin{aligned}
    l''(\phi) &= - n \gamma''(\phi) = - \text{Var}\left[
        \mathcal T
    \right] \le 0, 
\end{aligned}
$$

where the last inequality comes from the previous theorem. Therefore, the log-likelihood function is concave. By the assumption that a minimizer exists, and differentiable $\gamma$, then it must be the case that the minimizer is unique. Therefore,

$$
\begin{aligned}
    l(\hat \phi) &= 0 
    \\
    0 &= \mathcal T - n \gamma'(\hat \phi), 
\end{aligned}
$$

which is what we have. The sufficient statistics per sample gives the derivative of $\gamma$ function at the MLE. And under the general representation, assuming that the function between the natural parameter $\phi$ and distribution parameter $\theta$ being bijective, then the distribution parameter has $\hat \theta = \eta^{-1}\circ \gamma^{-1}(\mathcal T/n)$. 


**Remarks**

The fact that $\gamma(\phi)$ is not a constant function is an implicit assumption. Because if it is, then the pdf/pmf is not paramaterized! This part assists with the uniqueness of the minimizer. The non-constant assumption for $\mathcal T$ assists with the fact that $l''$ is not always zero, enhancing it $l$  to be strictly concave.


**Exercises**

The reader should verify some of these theorem in the context of the Gaussian Distribution parameterized by the variance, or the mean. 




