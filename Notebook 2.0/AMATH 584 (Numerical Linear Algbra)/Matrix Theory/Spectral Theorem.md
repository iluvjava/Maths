[[Subspace Direct Sum]]

We make use of the Schur Decomposition to proof spectral theorem before. 

References: [here](https://mast.queensu.ca/~br66/419/spectraltheoremproof.pdf)

---
### **Intro**

The proof of spectral theorem applies well to Hermitian matrix, but it also applies on Normal Matrices. 

Here, we will look at another proof of the spectral theorem. Which is phrased in a much larger and general scope, and uses totally different ideas. 

A list of things that we are going to use for the spectral theorem's proof: 

* [[Lagrangian and Dualization Techniques]]
* [[Hermitian Adjoint]]

We are going to perform optimization on an invariant subspace of the Adjoint Operator. 

---
### **Lemma 1**

> Given any invariant subspace of adjoint operator $A$, then the orthogonal subspace is an invariant subspace as well. 
> 
> $$
> \forall\; v \in \mathcal{V}: Av \in \text{span}(\mathcal{V}) 
> \; \wedge \; A(\mathcal{V}) \subseteq \mathcal{V}
> \implies 
> \forall \; u \in \mathcal{V}^{\perp}: Au \in \mathcal{V}
> $$

Because: 

$$
\begin{aligned}
    & \forall \; v\in \mathcal{V}, u \in \mathcal{V}^\perp: 
    \langle u, v \rangle = 0
    \\
    & \langle Au, v \rangle \underset{[1]}{=} \langle u, Av \rangle \underset{[2]}{=} 0
\end{aligned}
$$

\[1\]: Because A is an adjoint operator for this vector field. 

\[2\]: Because $Av\in \mathcal{V}$ using the fact thta $\mathcal{V}$ is an invariant subspace of the linear operator $A$. 


---
### **Lemma 2**

> Eigevalues are the local minimals to the following optimization problems: 
> 
> $$
> \max_{x} \left\lbrace
>     \langle x, Ax \rangle \text{ s.t: } \Vert w\Vert_2^2 = 1 \wedge x \in \mathcal{V}
> \right\rbrace
> $$

Here, we make the assumption that the linear operator $A$ is a type of complex matrix. 

Given any subspace that is invariant to the operator $A$, the solution is the biggest eigenvectors in that subspace. 

Consider using an orthogonal basis for $\mathcal{V}$, so that: 

$$
U^HU = I \wedge U \text{ is an ortho-normal basis for } \mathcal{V}
$$

**Define:** 

$$
\begin{aligned}
    F(\alpha) &= U\alpha
    \\
    G(\alpha) &= \Vert U\alpha\Vert_2
\end{aligned}
$$

Then the optimal conditions will be: 

$$
\begin{aligned}
    \nabla_\alpha [F(\alpha)] &= \lambda \nabla_\alpha [G(\alpha)]
\end{aligned}
$$

Computing we have: 
$$
\begin{aligned}
    \nabla_\alpha [F(\alpha)] &= \nabla_\alpha [\langle U\alpha, AU\alpha \rangle]
    \\
    &= \nabla_\alpha [\langle \alpha, U^HAU \alpha \rangle]
    \\
    &= (U^HAU + (U^HAU)^H) \alpha
    \\\underset{[1]}{\implies}
    &= 2(U^HAU)\alpha
\end{aligned}
$$

\[1\] Because the matrix $A$ is an adjoint operator, Hermitian in the case of complex matrices. 


$$
\begin{aligned}
    \nabla_\alpha [G(\alpha)] &= 2U^HU\alpha
\end{aligned}
$$

And the solution to the optimization problem would be a solution that satisify the following conditions: 

$$
\begin{aligned}
    U^HAU \alpha &= \lambda U^HU\alpha 
    \\
    AU\alpha &= \lambda U\alpha 
    \\
    Ax &= \lambda x
\end{aligned}
$$

Therefore, the maximal solution is the eigen vectors with the largest eigenvalues in the Invariant subspace $\mathcal{V}$. 

---
### **Spectral Theorem and the construction of Eigen Space**

The spectral theorem is claimed for Any adjoint operator for its given vector spaces. But here, we are restricted to complex matrices because of how limited my skills in math are. 

The proof of the theorem follows an inductive patterns. The previous lemmas will be used for this proof. And the statement of the theorem is: 

> Given Hermitian matrix $A\in \mathbb{C}^{n\times n}$, it will be diagonalizable and all eigenspaces associated with each eigen vectors will be orthogonal. 

**Explanation and alternative View of the theorem**

* Eigen spaces: They are invariant subspace for the linear operator $A$
* The eigenspaces will have to span the whole subspace $\mathbb{C}^n$ if this theorem is true. 


**Proof:**

**The basecase:** 

* Choose any eigen vector $x_{[1]}$, and it's orthogonal subspace $\mathcal{V}^{(2)}$.
* Use **Lemma 2**, we find $x_{[2]}\in \mathcal{V}^{(2)}$, and $x_{[2]}$ is an eigen vector, and hence it's invariant to $A$, therefore, $x_{[1]}\perp x_{[2]}$ by **Lemma 1**. 

**Inductively, we have this results**

$$
\mathcal{V}^{(k)}\perp \bigoplus_{i = 1}^{k - 1} \mathcal{V}^{(i)} \wedge \,\mathcal{V}^{(i)} \neq \{0\}\;\forall\; 1 \le i \le k-1
$$

Use **Lemma 2** we find $x_{[k]}$ such that $Ax_{[k]} = \lambda_k x_{[k]}$. Because $x_{[k]}$ is invariant to $A$ by definition of eigen vector, $\text{span}(x_{[k]})$ will be orthogonal to subspace $\bigoplus_{i = 1}^{k - 1} \mathcal{V}^{(i)}$. New susbpace by considering: 

$$
\mathcal{V}^{(k + 1)} \perp \left(
    \bigoplus_{i = 1}^{k  - 1} \mathcal{V}^{i}
\right) \cup \{x_{[k]}\}
$$

And $x_{[k]} \neq \mathbf{0}$. 

We do this until $\mathcal{V}^{(n)}$, because each time we introduce an orthgonal vector into the subspace, and therefore $\mathcal{V}^{(n)} = \mathbb{C}^n$ will span the whole subspace. 

Spectral theorem is proven. $\blacksquare$
