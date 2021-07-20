Attacking Optimality conditions
[[Duality (Dualitzation More Examples)]], [[Duality (Lagrangian and Algorithms)]]

This is a build up on the duality, and how to use the Lagrangian to get the optimal solutions, and use it to design the algorithm in general. 

* More interior Points Method
	* The Lagrangian optimality conditions 
	* The log Barrier function 
	* The algorithm implementations
* Splitting Methods: Chambolle Pock
	* The monotone operator. 
	* The non-expansive operator.
---
### **Intro**

**DEPRECATED WARNING: A lot of stuff in this page might not be correct.**

Previously we have seemed the slack relaxation and the interior points method. And converting non-linear equations into root finding, and then we use newton's method the continuation to get the optimal solution. 

Now, we are going to investigate the idea of interior points. 

There are a lot of clever exploits, but the main idea here is: 

> Using the optimality conditions of the primal and the dual problem, and then use the Newton's method to solve for the optimality points (The saddle points of the Lagrangian)

Slipping methods: 

This applies to the entire class of problem that works with the strong duality, let's take a look of the general format for the primal and dual: 

$$
\min_x \left\lbrace
    g(x) + h(Ax - b) + c^Tx
\right\rbrace
$$

$$
\max_z \left\lbrace
    -z^Tb - h^*(z) - g^*(-A^Tz - c)
\right\rbrace
$$

The splitting method only uses these components: 

1. $A^TA$
2. Prox Gradient Method (General, might not be smooth + convex func)

And the solution frameworks is called: **Chambolle-Pock**

---
### **Interior Points**

The objective is: 

> $$
> \min_{x, s} \left\lbrace
>     \frac{1}{2}\left\Vert
>          Ax - b
>     \right\Vert^2 + \delta_{+}(s)
> \right\rbrace
> \quad \text{Where:}
> s = d - Cx
> $$

And the slack variable meant to represent a sense of distance from the boundary of the simplex, and the inequality constraints will basically say that: 

$$
Cx \le d \implies s = d - Cx \in \mathbb{R}^n
$$

And notice that, the slack variable here is for the constraints, and the primal variable will be the $x$.

The slack will be updated for each iteration of the algorithm. 

The Lagrangian of the system will be:

$$
\mathcal{L}(x, z; s) = \frac{1}{2}\left\Vert
     Ax - b
\right\Vert^2 + z^T(d- Cx) - \delta^*_+(z)
$$

where, the dual decision variable $z$ is going to positive as well. 

By taking the partial derivative of the Lagrangian System, we will have a system of conditions for the optimality conditions for the problem. 

Let's list them and discuss them one by one: 

$$
\begin{cases}
    \partial_x \mathcal{L}(x, z; s) = 0 \implies A^T(A \bar{x} - b) + C^T\bar{z} & =0
    \\
    \partial_z\mathcal{L}(x, z; s) = 0 \implies \bar{s} = C\bar{x} - d &= 0
    \\
    x_i, z_i \ge 0 \implies \bar{x_i}\bar{z_i} &= 0 \quad \forall i
\end{cases}
$$

**Note**: ~~The variable $\bar{z}$ here is a diagonal matrix, where its diagonal is: $z_1, z_2 \cdots z_k$~~

1. The first 2 conditions come from the **strong duality theorem**, which is based on the fact that the problem is closed and convex. 
2. The second conditions re-iterates what is implied to the primal and dual based on strong duality, it's called: **Complementary Slackness**[^1]
3. $z \le 0$, this is asserted as for the Lagrangian.

**Algorithm**: 

The idea is to approximate the $\delta_+$ function with a **Log Barrier**, and using new variable named $\mu$. 

$$
\lim_{\mu \rightarrow 0_+} \mu \ln(s) \rightarrow \delta_+(s)
$$

Now let's consider a function with all 3 of these variables: $x, z; s$ like: 

$$
F_\mu (s, z, x) = \begin{bmatrix}
    s + Cx - d\\ 
    zs - \mu \mathbb{J}
    \\
    A^T(Ax - b) + C^Tz
\end{bmatrix} 
\tag{1}
$$
Where $\mathbb{J}$ is the vector of ones. 

* The first conditions in (1) asserts the definition of the slack variable. 
* The second condition asserts the relaxation on the constraints. 
* The third is the optimality conditions of the primal optimization. 

To solve the system, we want to: 

1. $F_u \rightarrow 0$
2. $\mu \rightarrow 0$, notice this condition asserts that $zs = 0$ which is complementary slackness. s

Notice that, the $\mu$ will help us safeguard the algorithm. This is the log barrier. 

The function $F_\mu$ represents the optimality conditions of the objective function: 

$$
\min_{x, s} \left\lbrace
    \frac{1}{2}\left\Vert
         Ax - b
    \right\Vert^2 - \mu \sum_{i}^{}\left(
            \ln(s_i)
        \right)
\right\rbrace
$$

**Question**: 

Why not just get the optimality conditions for the primal and then optimize that?? 

It turns out that it just doesn't work well, because of the inequality constraints. 


**Algorithm Routine**: 

1. Initialize: $x = 0, z, s, \mu > 0$. 
2. Get: Jacobian for the system, then use Newton's method to get the incremental update on variables $s, z, x$. 
3. Find step $\alpha$ so that: 
$$
\underbrace{\begin{cases}
s + \alpha \Delta s > 0 \\
z + \alpha \Delta z > 0    
\end{cases}}_{\text{Non-negativity Asserted}}
\quad 
\begin{cases}
s^+ = s + \alpha \Delta s\\
z^+ = z + \alpha \Delta z \\
x^+ = x + \alpha \Delta x
\end{cases}
$$
4. Update $\mu$: 
$$
u^+ = \frac{1}{10} \frac{\langle z^+, s^+\rangle}{\text{len}(z^+)}
$$
On average, we want the complementary relaxation to be zero. 

#### **Focusing on Step 2, The Newton's Method** 

Newton's method is saying that: 

$$
0 = F_\mu(s, z, x) + \text{Jcobian}[F_\mu](s, z, x) \begin{bmatrix}
    \Delta s \\ \Delta z \\ \Delta x
\end{bmatrix}
$$

And when we solve for the incrementations, the $\Delta$ thingy on the RHS, which is going to give us: 

$$
\begin{bmatrix}
\Delta s \\ \Delta z \\ \Delta x
\end{bmatrix} = \text{Jcobian}^{-1}[F_\mu](s, z, x) F_\mu
$$

And amazingly, the Jacobian of $F_\mu$ is going to be a block matrix: 

$$
\text{Jacobian}[F_\mu](s, z, x) = 
\begin{bmatrix}
    I & 0 & C
    \\
    \text{diag}(z) & \text{diag}(s) & 0
    \\
    0 &  C^T & A^TA
\end{bmatrix}
$$

And this is a 3 by 3 Block Matrix. 

To invert the matrix, we just do block Gaussian Eliminations. And everything will be cluttered around the bottom right entry, giving us a condition for the invertibility system: 

$$
\text{Jacobian}[F_\mu](s, z, x) \text{ Invertible} \iff 
A^TA + C^T \text{diag}(s/z)C \text{ Invertible}
$$

As long s this matrix over here is invertible, then we have the newton's method working to look for the update for the variables $x, z, s$. 

It's cool, because this is a closed form solution for step 2 of the algorithm. But usually, it's cool to just call a matrix solve on this thing to get the update for the system. 

**Summary and Overview of the Algorithm**

The IP methods converges fast, and it's as fast as the Newton's method. 

Global convergence theory as well, under additional assumptions. 
 

[^1]: See: [[Duality (Example Transformation)#Polyhedra Constraint 2-Norm Objective]] for more explanation on complementary slackness.