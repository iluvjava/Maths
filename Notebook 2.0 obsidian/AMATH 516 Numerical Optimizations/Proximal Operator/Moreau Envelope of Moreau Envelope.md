[[Moreau Envelope and Proximal Mapping]]


---
### **Intro**

> The Moreau Envelope of the Moreau Envelope is still a Moreau Envelope just with a different parameter. This is the claim that we are going to prove: 
> 
> $$
> \begin{aligned}
>     \text{env}_{\text{env}_f^\mu}(x) = 
>     \text{env}_f^{1 + \mu}(x).
> \end{aligned}
> $$
> We assume that $f$ is closed convex and proper, and we are in Euclidean space. 


---
### **Proof**

To show we directly consider the definition of the above function which is given as: 

$$
\begin{aligned}
    \text{env}_{\text{env}_f^\mu}(x)
    &= 
    \min_{v}\min_{y}
    \left\lbrace
       \underbrace{f(y) + \frac{1}{2\mu}\Vert v - y\Vert^2}
       _{\text{from }\text{env}_f^\mu(u)} + \frac{1}{2}\Vert v - x\Vert^2
    \right\rbrace
    \\
    &= 
    \min_{y}\min_{v}
    \left\lbrace
       f(y) + \frac{1}{2\mu}\Vert v - y\Vert^2
        + \frac{1}{2}\Vert v - x\Vert^2
    \right\rbrace
    \\
    &= \min_{y}
    \left\lbrace
       f(y) + \frac{1}{2\mu}\Vert v^+ - y\Vert^2
        + \frac{1}{2}\Vert v^+ - x\Vert^2
    \right\rbrace \quad \text{where} \quad v^+ = \frac{\mu^{-1}y+ x}{1 + \mu^{-1}} = 
    \frac{y + \mu x}{\mu + 1}
    \\
    &= 
    \min_y
    \left\lbrace
       f(y) + 
       \frac{1}{2\mu}\left\Vert \frac{y + \mu x}{1 + \mu} - y\right\Vert^2
       + 
       \frac{1}{2}\left\Vert 
        \frac{y + \mu x}{1 + \mu} - x
       \right\Vert^2
    \right\rbrace
    \\
    &= 
    \min_{y}
    \left\lbrace
       f(y) + 
       \frac{1}{2\mu}
       \left\Vert \frac{\mu x - \mu y}{1 + \mu}\right\Vert^2
       + 
       \frac{1}{2}\left\Vert 
        \frac{y - x}{1 + \mu}
       \right\Vert^2
    \right\rbrace
    \\
    &= 
    \min_{y}
    \left\lbrace
       f(y) + 
       \frac{\mu}{2}
       \left\Vert \frac{x - y}{1 + \mu}\right\Vert^2
       + 
       \frac{1}{2}\left\Vert 
        \frac{y - x}{1 + \mu}
       \right\Vert^2
    \right\rbrace
    \\
    &= 
    \min_y
    \left\lbrace
        f(y) + 
        \frac{\mu + 1}{2}
        \left\Vert
            \frac{x - y}{1 + \mu}
        \right\Vert^2
    \right\rbrace
    \\
    &= 
    \min_y\left\lbrace
       f(y) + \frac{1}{2(1 + \mu)}\Vert x - y\Vert^2
    \right\rbrace = \text{env}_f^{1 + \mu}(x), 
\end{aligned}
$$

and that conclude the proof. 


**References:**

Chapter's 6 of Amir's Beck's book on first order methods, Theorem 6.63. Take note that we make use of [[Minimizer of Quadratic Sum, Weighted Average]] for figuring out the value of $u^+$, with a different approach compare to what Amir Beck had done in his book. 

