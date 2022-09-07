Reference: [Stanford University](http://www.princeton.edu/~yc5/ele522_optimization/lectures/mirror_descent.pdf)
[Gradient Descend 1](Gradient%20Descend/Gradient%20Descend%201.md),[Gradient Descend 2](Gradient%20Descend/Gradient%20Descend%202.md)

---
### **Intro**

> Mirror Descend: Adjust gradient updates to fit problem geometry
> 
>       - Nemiovski & Yudin 1983

There are a lot of involvement for different types of distance metrics. But they all fall under one category of metric called 
**Bregman Divergence** [wiki link](https://en.wikipedia.org/wiki/Bregman_divergence). 

**Note**

The word distance metric will be used with cautions, because it has more axioms to satisfy than the word Divergence, which is much more generalized compare to the word distance metric. 

**Fact**

> Euclidean Distance is one of the Bregman Divergences. 

**Bregman Divergence** 

It's parameterized by a function $F$, and it takes 2 points and measures their divergence with function $F$. Lets denote $D_f(x, y)$ be the Bregman divergence for 2 points $x, y$. Here is a list of things about it: 

* Non-negative if $F$ is convex. 
* Convex in the first argument $p$. 
* Linearity 
$$D_{F1 + \lambda F_2}(p, q) = D_{F1}(p, q) + \lambda D_{F2}(p, q)$$ 
* Duality, the function $F$ is has a convex conjugate function, then: 
$$
D_{F\star}(\nabla F(p), \nabla F(q)) = D_F(p, q)
$$

**Bregman Divergence definition**: 

> $$
> D_\varphi (x, z) = \varphi(x) - \varphi(z) - \langle \nabla \varphi(z), x - z \rangle
> $$

Anchoring it at the point $z$ the distance between the actual value of the function and the value predicted by the gradient will be the Bregman Divergence. 

**Warn**: 

Gregman Divergence is not symmetric. 


---
### **Bregman Divergence, Smooth Gradient**

Smooth Gradient: 


> $$
> \arg\min_y \left\lbrace
>     \langle  \nabla f(x^{(k)}), y - x^{(k)}\rangle + \frac{1}{2\eta}
>     \underbrace{\Vert y - x^{(k)}\Vert_2^2}_{\text{proximity term}}
> \right\rbrace
> $$

Replace the proximity term with desired bregman divergence: 

> $$
> \arg\min_y \left\lbrace
>     \langle  \nabla f(x^{(k)}), y - x^{(k)}\rangle + \frac{1}{2\eta}
>     \underbrace{D_\varphi(y, x^{(k)})}_{\text{Bregman Divergence}}
> \right\rbrace
> $$


**Example**: Rescaled Euclidean

$$
\arg\min_y \left\lbrace
    \langle  \nabla f(x^{(k)}), y - x^{(k)}\rangle + \frac{1}{2\eta}
    Q \Vert  y - x^{(k)}\Vert_2^2
\right\rbrace
$$

Where, $Q$ approximate the Hessian of $f$ at point $x^{(k)}$, the solution will be exact of the function $f(x) = (x - x^+)^TQ(x - x^+)$. 

---
### **Examples of Bregman Divergence**

We can use the prior knowledge and assumptions about the function and choose the right type of divergence of the optimization problem to make things faster. 

**KL Divergence**

> Using Negative entropy as the generating function, and bregman divergence, we can make up the KL divergence. 

More about [KL-Divergence](../MATH%20000%20Math%20Essential/Probability,%20Stats,%20Combinatorics/KL-Divergence.md)

**Observe**
Negative entropy is convex and has a local minimum, and it's smooth. 

Let $x\in \mathbb{S}^n$ where $\mathbb{S}^n$ is used to denote the Probability Simplex. 

$$
\begin{aligned}
    D_\varphi(x, z) &= \varphi(x) - \varphi(z) - \langle 
        \nabla\varphi(z), x - z
    \rangle
    \\
    &= 
    \sum_{i}^{} \left(
        x_i\log(x_i) - z_i\log(z_i)
    \right) - \langle 1 + \log\bullet(z), x - z \rangle
    \\
    &= 
    \sum_{i}^{}x_i \log(x_i) - z_i \log(z_i) - \left(
        \sum_{i}^{}(x_i - z_i) + \log(z_i)(x_i - z_i)
    \right)
    \\
    &= 
    \sum_{i}^{} x_i \log(x_i) - z_i\log(z_i) + \sum_{i}^{} (z_i - x_i) + \log(z_i)(z_i - x_i)
    \\
    \underset{[1]}{\implies}
    &= 
    \sum_{i}^{}x_i\log(x_i) - x_i\log(z_i) 
    \\
    &= 
    \sum_{i}^{}x_i \log\left(\frac{x_i}{z_i}\right)
\end{aligned}
$$

And using this divergence metrics, we an have this minimization problem: 

$$
\arg\min_y \left\lbrace
    \langle \nabla f(x^{(k)}), (y - x^{(k)}) \rangle
    + 
    \sum_{i}^{}x_i \log\left(
        \frac{x_i}{x^{(k)}_i}
    \right)
\right\rbrace
$$

And this one has a closed form solution and we are skipping that. 


**Norm and Euclidean Distance**

> Using the norm function we can generate the Euclidean distance metric which is just a different type of Bregman Divergence. 




