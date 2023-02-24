No rereqs, assuming basic literacy about math. 

---
### **Intro**

We covers: 

Inner Products and Linear maps. 

List of important things: 

* Euclidean space $\mathbf{E}$, is a vector space defined together with the inner products over the vector space. 
  * Some examples are like $\mathbb{R}^n$, $\mathbb{R}^{m\times n}$. 

* $\mathcal{V}$: denotes some kind of vector space over a given Euclidean space. 

The idea of Inner products, linear maps a special kind of linear maps: **Linear Operator** arises from these. 


---
### **Monotone Operator**

Came out of no where, this operator doesn't have to be linear too, but it's on euclidean spaces and has this properties: 

$$
\left\langle Tx - Ty, x - y \right\rangle \ge 0 \quad \forall x, y \in \mathbf{E}
$$


---
### **Norms**

Make sure to read [[../../AMATH 584 Numerical Linear Algebra/Matrix Theory/Norm, for Beginners]], which contains a lot of examples. 

Norm maps from vector space to $R$. 

$$
\Vert \cdot \Vert : \mathcal{V} \mapsto \mathbb{R} 
$$

Notice that $\mathbf{E}$, has relations with $\mathcal{V}$ , in the way that, Euclidean space is a finite dimentional vector space over $R$. 

**Inner products defines some default norms: Euclidean Norms**

> $$
> \begin{aligned}
>   \Vert x\Vert = \sqrt{\left\langle x, x \right\rangle}
> \end{aligned}
> $$

And one of the property unique to the Euclidean norm with the same inner products that induced the norm is the Cauchy Inequality: 

$$
|\left\langle x, y \right\rangle| \le \Vert x\Vert \Vert  y\Vert \quad \forall 
x, y \in \mathbf{E}
$$

**Non-Euclidean Norm**

Which is the $\Vert x \Vert_p$  with $1\le p \le \infty$ where $p \neq 2$. 

**Dual Norm**

Definition: 

$$
\Vert v\Vert_p = \max\{\left\langle v, x \right\rangle, \Vert x\Vert_p\le 1\}
$$

Take notice that, in the case of $p$ norms over Real vector spaces, and we have 2 norm, $p, q$, if $p^{-1} + q^{-1} = 1$, then they are dual norm of each other. 

Which implies that $\inf, 1$ are dual to each other, and $2$ norms are self-dual. 


**Generalized Cahcy-Schwarz Inequality**

$$
|\left\langle x, y \right\rangle| \le 
\Vert x\Vert  \Vert y\Vert^*
$$

Now the Cauchy inequality can be defined over Non-euclidean norms, using dual norm. 

**Norms are bounded with each other**

Define 2 norms $\rho_1(\cdot)$, $$\rho_2(\cdot)$$, then there exists constant such that: 

$$
\alpha \rho(x) \le \rho_2(x) \le \beta \rho_1(x) \quad \forall x \in \mathbf{E}
$$

And from the Vector Spaces, we have the following inequalities on the norms: 

$$
\begin{aligned}
  & \Vert x\Vert_1 \le \Vert x\Vert_1 \le \sqrt{n}\Vert x\Vert_2
  \\
  & \Vert x\Vert_\infty \le \Vert x\Vert_2 \le \sqrt{n}\Vert x\Vert_\infty
  \\
  & \Vert x\Vert_\infty \le  \Vert x\Vert_1 \le n \Vert x\Vert_\infty 
\end{aligned}
$$

When $n$ is huge, these norms are pretty different from each other. 

