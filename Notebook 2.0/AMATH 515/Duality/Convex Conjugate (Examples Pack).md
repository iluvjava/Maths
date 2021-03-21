Here, I will summarized some of the examples we had for convex conjugates of different functions. 
[[Convex Conjugate Function]]

---
### **Intro**

Here we will be packing a bunch of good examples with proofs, so it can serves as a good references for when looking for Fenchel Conjugates for functions. 

Most of them will be coming straight from the HW problems for the class. 

Fenchel transform is possible for non-convex function, but in that case, we don't generate identity after double conjugacy of the function (Failing the strong duality), hence here we only consider the case where all the functions are convex. 

---
### **The Natural Log: $-\ln(x)$**

This function is going to be treated as a single variable function, simply a $\mathbb{R}\mapsto \mathbb{R}$ function. By considering the definition of a convex conjugate we have: 

$$
\sup_{x} \left\lbrace
    zx + \ln(x)
\right\rbrace
$$

Take note that the function is concave down, and the primal variable is only defined as $x\ge 0$, it's not defined otherwise. 

Here we can consider taking the derivative on the thing and figure out the extrema. 

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
\end{cases}
$$


---
### **Summation of Functions**


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
### **Conjugate of $f(\lambda x)$**
