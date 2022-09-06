Reference Vid: [Vid link](https://www.youtube.com/watch?v=bYfGVQ1Sg98)
Reference Vid: [Brunton](https://www.youtube.com/watch?v=sQvrK8AGCAo)
[[Proper Orthogonal Decomposition Intro]]


Here, we will be focusing in a purely data-driven way of analyzing large system of dynamics. 

Dynamic mode decomposition use the idea of approximating the koopman opeartor for very lower data, under the principal mode basis, which should reduce the computational complexity greatly. 

---
### **Intro**

Let's take example of these type of differential equations: 

$$
\frac{dx}{dt} = f(x, t, \mu)
$$

Where $x$ is a vector. 

Notice that, if we have measurements: 

$$
y_k = g(x_k)
$$

Say if we are observing some dynamical system and we are taking some measurements. 

However, the observation we take is very very sparse compare to the complex system. 

Just because we measured it, it doesn't make te observed one the best variables. 

It's not clear that we know what $f(x, t, \mu)$ is. 

But we still want to say something about the system. 


---
### **Dynamic Mode Decomposition (DMD)**

This is similar to a PCA, and our goal is to look for the low rank structure from the observation. 

We want to approximate the system with the best possible linear dynamic system. 

So: 

$$
\frac{dx}{dt} = f(x, t, \mu) \rightarrow  \frac{dx}{dt} = Ax 
$$


let's assume that $x \in \mathbb{R}^n$ where the dimension should be huge. Assume that the sates of the systems is **HUGE**. 

Remember that, whe solving the linear system, we will be given the solution in term of the eigenvectors with the exponential function. 

$$
x' = Ax \implies x = v\exp(\lambda t)
$$

And now, lets assume that the eigenfunction to be: $\phi_j$, and the eigenvalue to be $\lambda_i$. 

And notice that the solution will be a linear combinations of those things, giving u: 

$$
\sum_{i = 1}^{n}\left(
    b_j\phi_j \exp(\lambda_it)
\right)
$$

As soon as we were given non-linear solution, then we will have many different approaches to it, but linear system has a general solution, and this is why we want to approximate it with linear dynamical system.$


**What is given?**

We have sparse data that we have collected from the system. 

Assuming that measurement is taken as: 

$$
x_j = x(t_j)
$$

Time moment: $t_j$ and the value is: $x_j$, and then we will define a big matrix to be: 

$$
X = \begin{bmatrix}
    x_1 & x_2 & \cdots & x_{m - 1}
\end{bmatrix}
$$

let's make another matrix: 

$$
X' = \begin{bmatrix}
    x_2& x_3& \cdots& x_m
\end{bmatrix}
$$


Objective: build a linear dynamical system, I want the best matrix such that, when I multiply it on $X$, then we take to the next time step. 

$$
X' \approx AX 
$$

This is the operator that takes us from the past to the future. And it's likely to be over-determined. Let's assume that it's equality to make the notation simple. 

What is the solution them?

$$
X'X^\dagger = A
$$

Where $X^\dagger$ is the Pseudo inverse. And Notice that, we are using the Pseudo inverse because, this is an overdetermined matrix. We are just looking for the matrix that get to the next time step with as less errors as possible. 

The matrix $A$ is also sometimes referred to as the Koopman Operator, a linear operator the advances the dynamic of the system. In idealized case, it will be infinite dimension and it describes the dynamics of the data in an alternative coordinate system. But in this case, we are just trying to approximate it. 

#### **Krylov Subspace**

The promise is that $A$ (Koopman operator) will evolve the function given the initial condition, which means that given snapt shots for the first $m$ denoted as matrix $X$: 

$$
X = 
\begin{bmatrix}
\\
x_ 1 & x_2 & \cdots & x_m
\\[1em]
\end{bmatrix}
$$

$$
X' = AX = \begin{bmatrix}
\\
Ax_ 1 & Ax_2 & \cdots & Ax_m
\\[1em]
\end{bmatrix} = \begin{bmatrix}
\\
x_ 1 & x_2 & \cdots & x_m
\\[1em]
\end{bmatrix}
$$

And if we start with the initial conditions, and apply it with $A$ repeatedly we have: 

$$
X' =\begin{bmatrix}
\\
Ax_ 1 & A^2x_1 & \cdots & A^mx_1
\\[1em]
\end{bmatrix}
$$

Notice that, $X'$ is the Krylov Subspace of matrix $A$. Consider eigen decomposition of matrix $A$ to be $\Phi \Omega \Phi^{-1}$, we should have: 

$$
x_k = \Phi \Omega^k\Phi^{-1}
$$

Where, $\Phi$ is a matrix such that all its columns are the orthogonal modes for the diff equation. 


---
### **DMD Algorithm from Prof Kutz**: 

Objective: Solve the matrix A in lower subspace. 


**Step 1**

Let's assume that there exists low rank structure in the data we observed from the system. A lot of systems experience low-rank structure, this is the dogma of data science. 

$$X = U\Sigma V^H$$

And we assume a rank $r$ truncation of the data: 

$$
X \approx U\Sigma V^H
$$

From now on matrices are truncated. 

**Step 2**

Now consider the matrix $A$ approximating the time step dynamics. 

$$
A = X'X^\dagger \implies A = X'V\Sigma^{-1}U^H
$$

Consider a similarity transform of $A$, under the Principal mode of the matrix $A$, giving us: 

$$
\widetilde{A} = U^HAU = U^HX'V\Sigma^{-1}
$$

The matrix $\tilde{A}$ describes the dynamics of the principal modes. Consider the fact that $U$ is very skinny, meaning that the dynamics has low-rank structure. Then the matrix $\widetilde{A}$ describes the motion involving the principal modes, at a much lower dimension.  

**Step 3**

Consider the eigenvalue decomposition of the matrix $\widetilde{A}$. Here, we are trying to solve the system and get solution for the linear system.  

$$
\widetilde{A}W = W\Lambda 
$$

Then the solution for the system $y' = \widetilde{A}y$ will be: $y(t) = W\exp(\Lambda t)W^{-1}y_0$

The matrix $W$ is called the DMD mode. 

**Step 4**: 

To go back to the larger dimension, we will the 

Given any initial conditions, say $x_0$, project it onto the DMD modes. 

Consider: 

$$
\Phi = X'V\Sigma^{-1}W = AUW
$$

And this is the DMD modes. Not orthogonal. 

The solution is then: 

$$
x = \Phi\exp(\Omega t)b \quad b = \sum_{k = 1}^{r}\left(
        \Phi_k \exp(\omega_kt)b_k
    \right)
$$

**Step 5**

Keep, updating the matrix $A$ as we do the simulation with the low rank modes. 

---
### **Prof Brunton's Approach on DMD**

SVD on the dynamic matrix $X$

$$
X = U\Sigma V
$$

**Note**: Let this be the reduced decomposition SVD for $X$. 

Then $X'$ will be: 

$$X' = AU\Sigma V^H \implies X'V\Sigma^{-1} = AU$$

However it's hard to solve with Pseudo inverse because the system is too big then we have: 

$$
U^HX'V\Sigma^{-1} = U^HAU = \widetilde{A}
$$

$\widetilde{A}$ tells use how the POD modes evolves in times. **This matrix has the same leading eigenvalues as the matrix** $A$[^2]. 

The eigenvalue decomposition of the PDE modes $\tilde{A}$ is given by: 

$$
\widetilde{A}W = W\Lambda
$$

Then, the eigenvalue for the bigger matrix will be given by:

The leading eigenvalues in $\Lambda$ is the same as the eigenvalue for matrix $A$.[^1] 

$$
\Phi = X'V\Sigma^{-1}W
$$

Then the prediction into the next time step will become: 

$$
(\Phi^{\dagger}u_0) \exp(\Omega t) \quad\text{Where: } \Omega = \frac{\ln(\Lambda)}{\Delta t}
$$

The $b_0$ is the initial conditions describes by the modes (POD). 

---
### **MATLAB CODES**


[^2]: Because $A$ and $\widetilde{A}$ are related via a singularity transform. 

[^1]: Think of $\Phi$ to be like: $U\widetilde{A}W$, so that is essentially: $UW\Lambda$, where the Lambda controls the eigenspace of the matrix $\widetilde{A}$, which manipulates the orthogonal modes of $U$. This is called the dynamic modes. 