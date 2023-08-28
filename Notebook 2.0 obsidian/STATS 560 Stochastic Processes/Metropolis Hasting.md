[[Discrete Ergotic Markov Chain]]

---
### **Intro**

The Metropolis chain is a special type of chain that can be used to draw samples from distributions functions up to a constant without computing the  integrals and taking the inverse of these functions. We go over the following things: 
1. What is the Metropolis Hasting Chain?
2. What type of regularity conditions can assert the convergence to the targeted distributions. 
3. How does the regularity conditions play a role for the convergence theory of the chain under the discrete case? 
4. We briefly introduces what happens in the non-discrete case. 

**References**
1. Monte Carlo Statistical Method by Christian P. Robert, George Casella. 

**Algorithm Statement**

Firstly we define a state space $S$ for all the Markov chains. Suppose that at iteration $t$, $X^{(t)}$ is given as the output of the Metropolis Hasting Chain (MHC), then we draw the next $X^{(t + 1)}$ using the below procedures. 
$$
\begin{aligned}
    & Y^{(t)} \sim q (\cdot | x^{(t)})
    \\
    & X^{(t + 1)} := 
    \begin{cases}
        Y^{(t)} & \text{w.p}:  \rho(X^{(t)}, Y^{(t)})
        \\
        X^{(t)} &  \text{else}
    \end{cases}
    \\
    & \rho(x, y) := 
    \min\left\lbrace
        \frac{f(y)}{f(x)}\frac{q(x|y)}{q(y|x)}, 1
    \right\rbrace, 
\end{aligned}
$$

which is an aperiodic chain and here are the properties expected for some of these quantities defined for the MHC: 

1. $q(x|y)$ is the *instrumental distribution*, it is defined on $S$ and it's a doubly stochastic chain. 
2. $f(x): S \mapsto \mathbb R_+$ is a probability mass function on the state space $S$. 
3. $\rho$ is an acceptance function, given $X^{(t)}$, it decides whether to accept $Y^{(t + 1)}$ from $q$ given $X^{(t)}$. 


---
### **Transition Kernel of MHC**

The transition kernel (it's a matrix in the discrete case) for the MHC process is defined as: 

$$
\begin{aligned}
    K(x, y) = \rho(x, y)q(y|x) + \left(1 - \underbrace{\sum_{y \in S}^{}\rho(x, y)q(y|x)}_{=:r(x)}\right) \mathbf 1\{y = x\}. 
\end{aligned}
$$


**Theorem | f is a stationary distribution for the Kernel**
> The discrete probability assignment function $f$ is a stationary distribution for the MHC because it satisfies detailed balance. 

**Proof**

we consider some states with $x\neq y, x, y\in S$, then
$$
\begin{aligned}
    \rho(x, y) &= \min\left\lbrace
        \frac{f(y)}{f(x)}\frac{q(x|y)}{q(y|x)}, 1
    \right\rbrace
    \\
    \implies
    \rho(x, y)f(x) &= \min\left\lbrace
        f(y), f(x)
    \right\rbrace, \rho(y, x) f(y) = 
    \min\left\lbrace
        f(x), f(y)
    \right\rbrace
    \\
    \implies
    \rho(x, y)f(x) &= \rho(y, x)f(y)
    \\
    \implies
    \rho(x, y)q(y|x)f(x) &= 
    \rho(y, x)q(x|y)f(y)
    \\
    \implies
    K(x, y)f(x) &= K(y, x)f(y), 
\end{aligned}
$$

therefore, $f$ is a stationary distributions for transition kernel $K$ because it satisfies detailed balance. In the case when $x = y$, it's obvious. 


---
### **Regularity Conditions and Irreducibility**

To invoke the discrete ergotic theorem for discrete Markov chain, we need to prove that the MHC chain is also irreducible for the support of the distribution function $f$. 

**Definition | f-irreducible**
> Given a Markov chain $X$ with state space $S$ and a probability assignment function $f:S\mapsto \mathbb R_+$, it's f-irreducible means that for all $x, y\in \text{supp}(f)$, $x\rightarrow y$. The support set is $\text{supp}(f):= \{x: f(x) > 0\}$. 

**Theorem | Conditions for MHC Kernel being Irreducible**: 

> Denote $S_f = \text{supp}(f)$ as the support set of $f$, then MHC chain is f-irreducible when: 
> $$
> \begin{aligned}
>     \forall x, y \in S_f, \rho_{x, y} > 0
> \end{aligned}
> $$

Immediately observe that when $q(x|y)> 0\; \forall x, y\in S$, then the MHC is irreducible on $S_f$. 

**Remark**

Intuitive we want the instrumental chain $q$ to have the ability to diffuse out to every corner of the support sets of $f$. It's possible to have $q(x|y)$ that is not completely positive and yet still make the MHC irreducible. 

The convergence to stationary distributions depends on the initial distribution, and for our case, with non-negativity assumptions for $q(x|y)$, the convergence is assured for any type of initial distributions on $S$. 


**References**:

pg 271 of the \<Monte Carlo Statistical Method\> book. 


---
### **The Convergence of MHC**

The conditions that: 

* MHC is an irreducible chain on the supports sets of $f$, and MHC is a finite chain. 
  * There is a unique stationary distribution, and that stationary distribution is shown to be $f$. 
* MHC has $f$ satisfying the detailed balance property showed that $f$ is a stationary distribution of the kernel. 
* MHC is aperiodic this is true by the definition of $\rho(x, y)$. 

By [[Discrete Ergotic Markov Chain]], we know that HMC converges to the targeted stationary distribution $f$ in distribution. 


