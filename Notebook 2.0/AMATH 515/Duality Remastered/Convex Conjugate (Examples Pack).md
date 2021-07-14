Here, I will summarize some of the examples we had for convex conjugates of different functions.
They will be from HW, some of the notes for the courses, the goal is to make it more organized, and everything in place so we have references for the future. 

[[Convex Conjugate Function]]

Major References: The HW for AMATH 515. 

---
### **Intro**

Here we will be packing a bunch of good examples with proofs, so it can serve as a good references for when looking for Fenchel Conjugates for functions. 

Most of them will be coming straight from the HW problems for the class. 

Fenchel transform is possible for non-convex function, but in that case, we don't generate identity after double conjugacy of the function (Failing the strong duality), hence here we only consider the case where all the functions are convex. 

**Definition of Fenchel Conjugate Transform** 

> Given scalar function $f(x)$, preferably convex, the fenchel conjugate is denoted as $f^*(x)$, sometimes $f^{\star}(x)$, and it's given by: 
> $$
> f^{\star} (z) = \sup_x \left\lbrace
>     z^Tx + f(x)
> \right\rbrace
> $$

---
### **The Natural Log: $-\ln(x)$**

This function is going to be treated as a single variable function, simply a $\mathbb{R}\mapsto \mathbb{R}$ function. By considering the definition of a convex conjugate we have: 

$$
\sup_{x} \left\lbrace
    zx + \ln(x)
\right\rbrace
$$

Take note that the function is concave down, and the primal variable is only defined as $x > 0$, it's not defined otherwise. 

Here we can consider taking the derivative on the thing and figure out the extrema. 

$$
\partial_x[zx + \ln(x)] = z + \frac{1}{x} = 0 \implies x = \frac{-1}{z} > 0
$$

Positivity constrain on $x$ means that dual variable $z<0$ all the time. 

Substituting it back to the original expression we have: 

$$
\sup_{x} \left\lbrace
    zx + \ln(x)
\right\rbrace = 
-1 + \ln \left(
    \frac{-1}{z}
\right) =
-1 + \ln(1) -\ln(-z) = -1 - \ln(-z)
$$


---
### **Infinity Norm Indicator Function**

This is the infinity Norm function: 

$$
\delta_{\mathbb{B}_\infty}(x) := \begin{cases}
    0 & \Vert x\Vert_\infty \le 1
    \\
    \infty & \text{else}
\end{cases}
$$

Note that this is a multi-variable scalar function, let's assume that function happens in $\mathbb{R}^n$

Using the definition of the Convex Conjugate, we consider evaluating the expression: 

$$
\sup_{x}\left\lbrace
    z^Tx - \delta_{\mathbb{B}_\infty}(x)
\right\rbrace
$$

And the indicator function is basically putting implicit constraint, hence it's equivalent to the expression that: 

$$
\sup_{\Vert x\Vert_\infty \le 1}\left\lbrace
    z^Tx
\right\rbrace = \sum_{i = 1}^{n}\text{sign}(z_i)z_i = \sum_{i = 1}^{n}|z_i| = \Vert z\Vert_1
$$

To maximize, choose $x_i = -\text{sign}(z_i)$, then the maximal absolute value of all $x_i$ is still less than one, but it's swapping the sign of $z_i$, forcing it to positively accumulates the sum. 


---
### **2-Norm Indicator Function**

The 2-norm indicator function is a multi-variable function in $\mathbb{R}^n$, and it's defined as: 

$$
\delta_{\mathbb{B}_2} := \begin{cases}
    0 & \Vert x\Vert_2 \le 1
    \\
    \infty & \text{else}
\end{cases}
$$

By definition we have: 

$$
\delta_{\mathbb{B}^2}^*(z) = \sup_{x}\left\lbrace
    z^Tx - \delta_{\mathbb{B}^2}(x)
\right\rbrace
$$

Which is just another implicit constraint, giving us: 

$$
\sup_{\Vert x\Vert_2 \le 1} \left\lbrace
    z^Tx
\right\rbrace = \Vert z\Vert
$$

Best vector to choose is $\hat{z}$, a unit vector that points to the same direction as the vector $z$. 

---
### **The Equality Indicator Function: $\delta_0$**

$$
\delta_0(x) = \begin{cases}
    \infty & x \neq \mathbf{0}
    \\
    0 & x = 0
\end{cases}
$$

Conjugation: 

$$
\begin{aligned}
    \delta_0^*(z) &= \sup_x\{z^Tx - \delta_0(x)\} 
    \\
    &= 0
\end{aligned}
$$

To minimize, adhere to $x = 0$, so that $-\delta(x)$ is zero, else, the whole expression goes to $-\infty$  


---
### **Summation of a Vectorized Functions**


Objective: look for convex conjugate of the function: 

$$
\left(
    \sum_{i = 1}^{n}g(x_i)
\right)^* = f^*(z)
$$

Note that this is a function that is multi-variable scalar function for the sum, and $g(x)$ is simply a $\mathbb{R}\mapsto \mathbb{R}$ function, then by definition of the Fenchel Conjugate we have: 

$$
f^*(z) = \sup_{x}\left\lbrace
    z^Tx - \sum_{i = 1}^{n}g(x_i)
\right\rbrace
$$

Focusing on the second term we have that: 

$$
\sup_{x}\left\lbrace
   \sum_{i = 1}^{n}\left(
       z_ix_i - g(x_i)
   \right) 
\right\rbrace 
$$

$$
\sup_{x_1, x_2, \cdots, x_n}\left\lbrace
   \sum_{i = 1}^{n}\left(
       z_ix_i - g(x_i)
   \right) 
\right\rbrace 
$$

$$
\sum_{i = 1}^{n}\left(
    \sup_{x_i}\left\lbrace
       z_ix_i - g(x_i)
\right\rbrace\right) 
$$

$$
\implies f^*(z) = 
\sum_{i = 1}^{n}
    g^*(z_i)
$$

---
### **The Positivity Indicator** $\delta_+(x)$

Let $\delta_+(x)$ be a mapping from $\mathbb{R}^n$ to $\mathbb{R}$, and let $\le, \ge$ be vectorized opertor on all elements of a vector. 

The function basically forces all of its input to be in $\mathbb{R}_+$, else the function will just be undefined. 

$$
\delta_+(x) = \begin{cases}
    0 & x \le \mathbf{0}
    \\
    \infty & \text{else}
\end{cases}
$$

Then the convex conjugate is: $\delta_-(z)$, where it's just the negative conjugate function. 


$$
\begin{aligned}
    \left(
        \delta_+(x)
    \right)^\star(z)
    &= 
    \sup_x \left\lbrace
        z^Tx - \delta_+(x)
    \right\rbrace
    \\
    &= \sup_{x \ge \mathbf{0}} \left\lbrace
        z^Tx
    \right\rbrace
\end{aligned}
$$

* Consider $\exist z_i: z_i > 0$, then choose $x_i > 0$, then consider $\lim_{x_i\rightarrow \infty} z^Tx = \infty$
* Else, $\forall z_i, z_i \le 0$, which means that $x = \mathbf{0}$ maximizes $z^Tx$. 

Therefore: 

$$
\begin{aligned}
    \left(
        \delta_+(x)
    \right)^\star(z)
    &= 
    \begin{cases}
        0 & z \le 0
        \\
        \infty & \text{else}
    \end{cases}
    \\
    &= \delta_-(x)
\end{aligned}
$$


---
### **Conjugate of $f(\lambda x)$**

Assume that $f^\star(x)$ is known already, we want to express $(f(\lambda x)^\star)$ using $f^\star(x)$

$$
\begin{aligned}
    \left(
        f(\lambda x)
    \right)^\star
    &= 
    f^\star \left(
        \frac{z}{\lambda}
    \right)
\end{aligned}
$$

**Justification:**

$$
\begin{aligned}
    \left(
        f(\lambda x)
    \right)^\star
    &= 
    \sup_x\left\lbrace
        z^Tx - f(\lambda x)
    \right\rbrace
    \\
    &= 
    \sup_y \left\lbrace
        z^T\left(
            \frac{y}{\lambda}
        \right) - f(y)
    \right\rbrace
    \\
    &= 
    \sup_y \left\lbrace
        \left(
            \frac{z^T}{\lambda}
        \right)y  - f(y)
    \right\rbrace
    &= 
    f^\star\left(
        \frac{z}{\lambda}
    \right)
\end{aligned}

$$

---
### **The Identity Function For Convex Conjugate $\frac{1}{2}\Vert x\Vert_2^2$**

$$
\left(
    \frac{1}{2}\Vert x\Vert_2^2
\right)^\star = 
    \frac{1}{2}\Vert x\Vert_2^2
$$

Proof is trivial, skipped. 
