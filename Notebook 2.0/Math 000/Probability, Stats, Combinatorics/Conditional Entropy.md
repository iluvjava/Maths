This is just continuing on the discussion on [[Shannon's Entropy]], [[Conditional Probability]]


---
### **Intro**

Conditional Entropy is analogous to conditional expectation for random variable. 

$$
\begin{aligned}
    H(Y|X) &= \mathbb{E}\left[
            \log\left(
                \frac{1}{\mathbb{P}\left(Y|X\right)}
            \right)
        \right]
    \\
    &= 
    \sum_{x\in \Omega_X}^{}
    \mathbb{P}\left(X = x\right)
    \mathbb{E}\left[
            \left.
                \log\left(
                    \frac{1}{\mathbb{P}\left(Y|X = x\right)}
                \right)
            \right|
            X = x
        \right]
    \\
    &=
    \sum_{x\in \Omega_X}^{}
    \mathbb{P}\left(X = x\right)
    \sum_{y\in \Omega_Y}^{}
        \mathbb{P}\left(Y = y| X = x\right)
        \log\left(
            \frac{1}{\mathbb{P}\left(Y = y| X = x\right)}
        \right)
    \\
    &= 
    \sum_{x\in\Omega_X, y\in \Omega_Y}^{}
    \mathbb{P}\left(
            X = x \wedge Y = y
        \right)
    \log\left(
        \frac{\mathbb{P}\left(X = x \wedge Y = y\right)}
        {
            \mathbb{P}\left(X = x\right)
        }
    \right)
    \\
    &= 
    \sum_{x, y}^{}
        p(x, y)\log\left(
            \frac{p(x, y)}{p(x)}
        \right)
\end{aligned}
$$

This is anlogous to conditional expectation. 






---
### **Properties**


$$
H(Y|X) = H(X, Y) - H(X)
$$

The proof is kinda obvious using the definition listed above. 

