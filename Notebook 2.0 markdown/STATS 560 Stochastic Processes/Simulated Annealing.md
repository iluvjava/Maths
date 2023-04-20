[Metropolis Hasting](Metropolis%20Hasting.md)

---
### **Intro**

Simulated Annealing is an optimization algorithm whose design is based on the Metropolis Hasting algorithm with the idea of "temperature", which is simply a scale placed on the targeted distribution. 

**Setting up Quantities for the Algorithm**

Assuming that we want to minimize the function $g$ using the Simulated Annealing algorithm. 

* $g: S \mapsto \mathbb{\bar R}$ is the objective functions on the augmented reals. 
* $T(k): \mathbb N \mapsto \mathbb R_+$ is the temperature. 
* The distribution function is a exponential transform of the values of $g$, in cause of minimizing $g(x)$, we have: $f_k(x) = \exp(-g(x)/T(k))$. It flip the function and then transform it to positive number using the exponential function. 


**Matching Quantities from Metropolis Hasting**
* $q(x|y): S \mapsto \mathbb R_+$ is just a function that is a doubly stochastic, nonegative chain. 
* $T_i$: A strictly positive constant!
* $f(x)$ is the same as what is in the Metropolis Hasting algorithm.


---
### **Limit of Temperature**

The only difference between the Simulated Annealing and the Metropolis Hasting algorithm is the temperature function. The temperature function $T(i)$ rescale the distribution function, the smaller $T$ is, the larger extreme value will be relatively for the normalized function $f(x)$. 


**Convergence to Indicator Function of Optimality**

We assume that $S$ is a finite set and we want to maximizes the function $g$ which is bounded above. We assume that $T_i\rightarrow 0$ as $i\rightarrow \mathbb N$. Denote $X^+:= \arg\min_x(f(x))$ where $f(x):=\exp(g(x)/T_i)$ is the distribution function adapted from $f$. Then: 

$$
\begin{aligned}
    \lim_{i\rightarrow \infty}f(x) 
    &= 
    \lim_{i\rightarrow \infty} \frac{\exp(g(x)/T_i)}
    {
        \sum_{y\in S}^{}
        \exp(g(y)/T_i)
    }
    \\
    &= 
    \lim_{i\rightarrow \infty}
    \frac{1}{\sum_{y\in S}^{}\exp(g(y) - g(x)/T_i)}
    \\
    &= 
    \lim_{i\rightarrow \infty}
    \frac{1}{\exp(0) + \sum_{y\in S\setminus\{x\}}^{}\exp(g(y) - g(x)/T_i)}
    \\
    &= 
    \lim_{T\rightarrow 0}
    \frac{1}{1 + \sum_{y\in S\setminus\{x\}}^{}\exp(g(y) - g(x)/T_i)}
    \\
    &= \mathbf 1\{X^+\}. 
\end{aligned}
$$

As the temperature approaches zero for the discrete chain, the distribution function approaches the indicator function of the optimal set.


References: 'Markov Chain and Mixing time', chapter 3. 