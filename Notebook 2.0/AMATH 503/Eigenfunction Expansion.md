[[Sturm Liouville Theory]] is needed for this, and the completeness theorem of the SL system from [[Sturm Liouville Theory P2]] is also needed for this. 

This is a method that is for solving non homogeneous PDEs, in a finite domain. 

This is Chapter 14 Materials.

---
### **Intro**

Here is an example of a non-homogeneous PDE: 

$$
\partial_t[u] + \alpha^2 \partial_x^2[u] = \sin(3\pi x)
$$

BC, IC: 

$$
u(0, t) = u(1, t) = 0 \quad u(x, 0) = \sin(\pi x)
$$

Under the domain: $x \in[0, 1]$

Take not, this thing even works when the non-homogeneous part is depending in time. 

So that PDE of the form: 
$$
\partial_t[u] + \alpha^2 \partial_x^2[u] = f(t, x)
$$

It's also ok. 

Steps: 

**1. Find the eigenfunctions for the solution for the Homogeneous version of the PDE.**

The soltuion for the system 

$$
\partial_t[u] + \alpha^2 \partial_x^2[u] = 0
$$

And skipping how to solve this, we have: 

$$
X_n(x) = \sin(n\pi x) \quad \tilde{\lambda}_n = n\pi \quad n \in \mathbb{N}
$$

Make note that, when we solve for the Eigen Functions $X_n(x)$, we were dealing with: 

$$
\frac{X''(x)}{X} =  - \tilde{\lambda}^2
$$

And this is a **Sturm Loiuville System**!  With $p(x) = r(x) = 1$ and $q(x) = 0$, and $\lambda = \tilde{\lambda}^2$. 

By the **Completeness Theorem**, the Eigen functions $X_n(x)$ is going to be complete in this case. 

Ok, as we all know it, the solution for the system can be expressed as: 

$$
u(x, t) = \sum_{n = 1}^{\infty}
    T_n(t)X_n(x)
\tag{1}
$$

$$
f(x, t) = \sin(n\pi x) = \sum_{n = 1}^{\infty} f_n(x)X_n(x) = \sum_{n = 1}^{\infty}f_n(t)\sin(n\pi x)
$$

Andin this case: 

$$
\begin{cases}
    f_n(t) = 0 & n \ne 3
    \\
    f_3(t) = 1 & \text{else}
\end{cases}
$$

Now, we need to find the $T_n(t)$ for $u(x,t)$. 

We do this by susbtituting (1) into the PDE. And this will be like: 

$$
u_t = \sum_{n = 1}^{\infty}T_n'(t)X_n(x)
$$

$$
u_{xx} = \sum_{n = 1}^{\infty}
T_n(t)X''_n(x) = \sum_{n = 1}^{\infty}
    -T_n(t)\tilde{\lambda}_n^2 X_n(x)
$$

And if we put this back to the PDe we have: 

$$
\sum_{n = 1}^{\infty}
    (T_n'(t) + \alpha^2 \tilde{\lambda}_n^2 T_n(t))X_n(x) = 
    \sum_{n = 1}^{\infty}f_n(t)X_n(x)
$$

$$
\sum_{n = 1}^{\infty}
    (T_n'(t) + \alpha^2 \tilde{\lambda}_n^2 T_n(t) - f_n(t))X_n(x) = 0
\tag{3}
$$

**$X_n(x)$ are orthogonal, the sum is zero, therefore the independent terms will have to be multiplying with a zero. (Linearly Independent! No trivial solution is gonna be hidden in here.)**

Which implies hat $T_n'(t) + \alpha^2(n\pi)^2T_n(t) - f_n(t) = 0$

$$
T_1'(t) + \alpha^2\pi^2T_1(t) = f_1(t) = 0
$$
$$
T_2'(t) + \alpha^2\pi^2T_2(t) = f_2(t) = 0
$$
$$
T_3'(t) + \alpha^2\pi^2T_3(t) = f_3(t) = 1
$$
(...)

So we had a system of Homogeneous ODE for $n\ne 3$. And the solution can be written like: 

$$
T_n(t) = T_n(0)\exp(-\alpha^2(n\pi)^2t)
$$

And now the question is what is $T_n(0)$? 

$$
u(x,0) = \sum_{n = 1}^{\infty}
    T_n(0)\sin(n\pi x) = \sin(\pi x)
$$

Then: 

$$
T_n(0) = \begin{cases}
    0 & n\ne 1
    \\
    \exp(-\alpha^2\pi^2 t) & \text{else}
\end{cases}
\tag{2}
$$

Ok, let's take a look at the non-homogeneous part: 

$$
T_3'(t) + \alpha^2(3\pi)^2T_3(t) = 1 
$$

The homogeneous part of the ODE is just like all the other $T_n(x)$, amd the particular solution is just a constant.

After some simple math, we will have the full solution for the ODE to be: 

$$
T_3(t) = y_3(0)\exp(-\alpha^2(3\pi)^2 t) + \frac{1}{\alpha^2(3\pi)^2}
$$

And... what is $y_3(0)$? The constant for the Homogenous part solution? 

From (2), $T_3(t) = 0$, so we have: 

$$
y_3(0) + \frac{1}{\alpha^2(3\pi)^2} = 0
$$

$$
\implies y_3(0) = \frac{-1}{\alpha^2(3\pi)^2}
$$

Therefore, the full solution will be of the form: 

$$
T_3(t) = \frac{1}{\alpha^2(3\pi)^2}\left(
    1 - \exp(-\alpha^2(3\pi)^2t)
\right)
$$

Therefore, there are only 2 terms left for $u(x,t)$: 

$$
u(x, t) = T_1(t)X_1(x) + T_3(t)X_3(x)
$$

$$
u(x, t) = 
\exp(-\alpha^2 \pi^2 t)\sin(\pi x) + \frac{1}{\alpha^2(3\pi)^2}
\left(
    1 - \exp(-\alpha^2(3\pi)^2t)\sin(3\pi x)
\right)
$$

And this is the solution. 

#### **A High Level Summary**

1. Work about the spatial basis function (Eigen Functions, $X_n(x)$) for the system. 
2. Express the non-homogeneous part of the equation, the $f(x,t)$ in term of the Eigen Function. 
3. Express $u(x, t)$ as a series of $\sum T_n(t)X_n(x)$ as well. 
4. Substitute it back with $T_n(t)X_n(x)$, get a similar looking expresion as (3) for the above example. 
5. Using Orthogonality property of the Eigen Function to get a system of Homogeneous/non-homogenous ODEs. 
6. Using the Initial conditions to determine the coefficients for the non-homogenous cofficients involved for step (5). 
7. The non-homogeous part of the system of ODEs will manifest itself as an extra term for the final solution of the PDE. 

---
### **A More General Example**

(...)

