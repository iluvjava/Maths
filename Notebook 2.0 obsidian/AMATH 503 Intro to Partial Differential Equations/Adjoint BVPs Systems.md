[Linear Mapping in Hilbert Space](../MATH%20601%20Functional%20Analysis/Linear%20Mapping%20in%20Hilbert%20Space.md)

---
### **Intro**

BVPs, boundary value problem, are essentially linear system in the functional spaces. We can generalizes linear system to BVPs in $C^p[a, b]\mapsto \mathbb R$, where, $p$ is determined by the highest order of the ODE. We want to identifies the adjoint operators of general forms for the system, and we want to characterizes the existence of the solutions for the linear system. The theories as application to the Sturm Liouville's system and theorems. 

**References**: 

These materials will be taken from Prof Eric Foxall's classnotes for MATH 319 at UBCO, introduction to partial differential equations.

----
### **The Adjoint BVP**

We will find the adjoint of a ODE with B.C. We build example to example, and then to a generic form of the BVP with second order ODE. 

#### **Def | Adjoint Operator from ODE**
> Suppose that $L[y]:D\mapsto C^p[a, b]$ is a linear mapping on the functional space $D$ and suppose that $B[y]: C^p[a, b]\mapsto \mathbb R^p$ is a linear mapping denoting the boundary conditions for the ODE on $[a, b]$, then $D = \{y \in C^p[a, b] | B[y] = \mathbf 0\}$. Let the BVP ODE and the Boundary conditions be
> $$
>   \begin{cases}
>         L[y]  = h, 
>         \\
>        B[y] = 0. 
>   \end{cases}
> $$
> Then the adjoint operator $L^*$ is an operator such that it has domain $D^*$, and satisfies $\langle Lu, v\rangle = \langle u,L^* v\rangle$ for all $(u, v)\in D\times D^*$. The domain $D^*$ for the adjoint contains conditions for the Adjoint ODE with BC. 


#### **Generic Example 1**

> Let $L[y] = a(x)y'(x)$, then the adjoint operator is $L[y] = -(a(x)y(x))'$, with a boundary conditions operator $B[y]$ on the boundary $a, b$ of a closed interval $[a, b]$.

**Demonstrations**

Start by considering, for all $(u, v) \in D \times D^*$

$$
\begin{aligned}
    \langle L[u], v\rangle &= \int_a^b L[u]v dx
    \\
    &= 
    \int_a^b ay' dx
    \\
    &= 
    \left[
        au'v    
    \right|_a^b - \int_a^b u(av)'dx. 
\end{aligned}
$$

Then this would imply that, one of the option for the adjoint operator is $L[v] = -(a(x)v)'$ and the set $D^* := \{u\in D : [au'v](b) - [au'v](a) = 0\}$. See later examples on how to extract out the boundary conditions for the dual system. 

**Remark**
When $a(x)$ is a constant, then we have an anti-symmetric operator, the negative of the operator  becomes its adjoint. 

#### **Generic Example 2**

> Find the adjoint operator of $L[y] := a(x)y''(x)$, assuming we are on the interval $[a, b]$ and let $B[y]$ to be the appropriate linear operator packing the boundary conditions of the system. 

**Demonstrations**
consider the inner product form 
$$
\begin{aligned}
    \langle L[u], v\rangle &= \int_a^b au'' v dx
    \\
    &= \left [a u'v \right|_a^b - \int_a^b (av)'u'dx
    \\
    &= \left [a u'v \right|_a^b - \left[
            u(a_2v)'
        \right|_a^b - 
        \int_a^b (a_2v)''udx
    \\
    &= \left [a u'v \right|_a^b - \left[
            u(av)'
        \right|_a^b - 
        \left\langle u, \partial_x^2 [a v]\right\rangle
\end{aligned}
$$

And therefore, it's suggesting that $L^*[v] = (av)''$. And the boundary conditions must be satisfied in such a way that, $v\in D^*$ has the property that for all $u\in D$, we have the bilinear functional $\left [a u'v \right|_a^b - \left[u(av)'\right|_a^b = 0$. 


#### **Generic Second Order ODE with BVP**

> Define $L[u] = a_2u'' + a_1 u' + a_0u$, let the boundary condition be $\alpha_1 u(a) + \beta_1 u'(b) = 0$ and $\alpha_2 u(b) + \beta_2 u'(b) = 0$, denoting $B[u] = \mathbf 0$ to be a type of mixed boundary conditions. Defining $D = \{u \in C^2[a, b] : B[u] = \mathbf 0\}$ to be the domain of the operator $L$, then the adjoint operator $L^*[y]$ is $(a_2y)'' + (a_1y)' + a_0 y$. 

**Demonstrations**

To prove, we use the linearity property of the adjoint on linear mapping in Hilbert spaces. We start by considering the adjoin of $a_0u$, given as 

$$
\begin{aligned}
    \langle a_0 u, v\rangle &= \int_a^b a_0uvdx
    \\
    &= \int_a^b u(a_0v)dx
    \\
    &= \langle u, a_0 v\rangle,
\end{aligned}
$$

therefore, the adjoint operator is the operator itself. We can split the operator into sums of operator and invoke the linearity property of the adjoint operator. Let $L_2[u] = a_2y''$, $L_1[u] = a_1 y'$ and $L_0[u] = a_0y$, then using previous results we have

$$
\begin{aligned}
    \langle L[u],v \rangle &= 
    \langle L_2[u] + L_1[u] + L_0[u],v \rangle
    \\
    &= \langle L_2[u], v\rangle + \langle L_1[u], v\rangle + \langle L_0[u], v\rangle
    \\
    &= \langle u, L_2^*[v]\rangle + \langle u, L_1^*[v]\rangle + \langle L_0^*[u], v\rangle
    \\
    &= \left[
        a_1uv + a_2u'v - u(a_2v)'
    \right|_a^b + 
    \left\langle u, \partial_x^2[a_2v] - \partial_x[a_1v] + a_0v\right\rangle,
\end{aligned}
$$

take note the extra term. Here, we define a bilinear operator
$$
\begin{aligned}
    P[u, v](x) &= [ua_1v + u'a_2v - u(a_2v)'](x)
    \\
    &= [u(a_1 - a_2')v + u'a_2v - ua_2 v'](x)
    \\
    &= [u(a_1 - a_2')v + a_2(u'v - uv')](x)
    \\
    \implies 
    \langle L[u],v \rangle &= P[u, v](b) - P[u, v](a) + 
    \left\langle u, \partial_x^2[a_2v] - \partial_x[a_1v] + a_0v\right\rangle,
\end{aligned}
$$
then the potantial candidate for the operator $L^*[v] = \partial_x^2[a_2v] - \partial_x[a_1v] + a_0v$. The part of the proof is now complete. 

---
### **Sturm Liouville System is Self Adjoint**

We show that under homogeneous boundary conditions (RHS of the boundary constraints is zero), the Sturm Liouville system becomes a self-adjoint system. The system's boundary conditions and the Linear operator are the same for the adjoint system. 

#### **Def | Sturm Liouville's Form**

> The Sturm Liouville's form is a type of BC ODE, second order. It has the form $(p(x)y')' + (q(x) + \lambda r(x))y = 0$ and some boundary conditions. 

**Note**: 

There are many different types for the Sturm Liouville's system, they are used to assist the analytical solutions for separation of variables for canonical Elliptic PDEs. 


#### **Claim | It's self Adjoint**
> We show that the system with homogenous boundary conditions, $\alpha_1 u(0) + \beta_1 \partial_x u(0) = 0$ and $\alpha_2 u(1) + \beta_2 \partial_x u(1) = 0$. Define $L[y] = (p(x)y')' + q(x)y$, firstly observe that the S.L System is given as: $L[y] = -\lambda ry$, which becomes a type of Eigen system under weights $r(x)$. Let $B[y] = \mathbf 0$ denotes the above boundary conditions, we show that the BVP ODE system is self adjoint. 


