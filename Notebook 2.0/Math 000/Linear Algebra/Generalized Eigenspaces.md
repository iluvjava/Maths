[[Subspace Direct Sum]]


---
### **Intro**

Let's take a look at how null space of $A$ and $A - \lambda I$ can from a basis given any Linear Operator. 

**Define: Eigenspace of order $k$** 

> $$
> \mathcal{N}_k(\lambda) = \text{Ker}(A - \lambda I)^k
> $$

Where $\lambda$ is any eigenvalues of matrix $A$. The kernel of $(A - \lambda I)^k$.  

### **Lemma 1**

> $$
> \mathcal{N}_1(\lambda) = \mathcal{N}_2({\lambda}) = \cdots = \mathcal{N}_k(\lambda) = \mathcal{N}_{k + 1}(\lambda) = \cdots 
> $$

**Proof**

We are going to use proof by induction nested with a proof by contradiction. Let the inductive hypothesis be: 

$$
\mathcal{N}_{k + l}(\lambda) =  \mathcal{N}_{k + l - 1}(\lambda)
$$

We wish to prove: 

$$
\mathcal{N}_{k + l}(\lambda) =  \mathcal{N}_{k + l  + 1}(\lambda)
$$

Assume hypothesis is false: 

$$
\begin{aligned}
    & v \in \mathcal{N}_{k + l + 1}(\lambda) \wedge v  \notin \mathcal{N_{k + l}}(\lambda)
    \\
    \implies &
    (A - \lambda I)^{k + l + 1} v = \mathbf{0} \wedge 
    (A - \lambda I)^{k + l}v \neq \mathbf{0}
\end{aligned}
$$

Consider $w = (A - \lambda I)v$, then: 

$$
\begin{aligned}
    (A - \lambda I)^{k + l}w &= \mathbf{0}
    \\
    (A - \lambda I)^{k + l - 1} w &\neq \mathbf{0}
    \\
    \Rightarrow\Leftarrow 
\end{aligned}
$$

A contradiction on the hypothesis we made, however, we know for sure this hypothesis is true because it has the base case of: 

$$
\begin{aligned}
    v& \in \mathcal{N}_1(\lambda) \wedge v \notin \mathcal{N}_2(\lambda)
    \\
    \equiv&  \neg (v \in \mathcal{N}_1(\lambda) \implies v\in \mathcal{N}_22(\lambda))
\end{aligned}
$$

Well, obviously, $v \in \mathcal{N}_1(\lambda) \implies v \in \mathcal{N}_2(\lambda)$, if this is not true, I think the universe will be broken. 

$\blacksquare$


---
### **Lemma 2**

Eigenspace and the image of the matrix removing eigen space doesn't intersect with each other. 

> $$
> \mathcal{N}_k(\lambda) \cap \text{Im}(A - \lambda I) = \{\mathbf{0}\}
> $$

**Proof**

$$
\begin{aligned}
    v &\in \mathcal{N}_k(\lambda) \cap \text{Im}(A - \lambda I)^k
    \\
    \implies&
    (A - \lambda I)^k v = \mathbf{0} \; \wedge \; 
    v = (A - \lambda I)^kw \wedge w \neq \mathbf{0}
    \\
    \implies&  w \in \mathcal{N}_{2k}(\lambda)
    \\
    \underbrace{\implies}_{\text{Lemma 1}}& w \in \mathcal{N}_{k}(\lambda)
    \\
    v &= (A - \lambda I)\mathbf{0}
    \\
    v &= \mathbf{0}
\end{aligned}
$$

$\blacksquare$


---
### **Lemma 3**

The eigen space and the matrix range removing the eigen space is spanning the whole subspace of the linear operator and they are disjoint. 

> $$
> \mathcal{V} = \mathcal{N}_k(\lambda) \oplus \text{Im}(A - \lambda I)
> $$


By rank nullity theorem: 

$$
\text{dim}(\mathcal{N}_k(\lambda)) + \text{dim}(A - \lambda I) = \text{dim}(\mathcal{V})
$$

And because they are equal, and this is all the subspace that can be spanned by operator $A$, we said that they have to be linear independent to each other. And hence, their direct sum is the subspace of the linear operator $A$. 


---
### **Lemma 4**
The eigenspace and the image of linear operator $A$ applied on the subspace removing the eigensubspace is an **Invariant Subspace** of linear operator $A$

Def Invariant Subspace of $A$

> $$A(\mathcal{S}) \subseteq \mathcal{S}$$

It preserves the subspace after feeding in a certain subspace $S$ into the linear operator $A$. 

**Claim for Lemma 4**

> $\mathcal{N}_k(\lambda)$ and $\text{Im}(A - \lambda I)$ are invariant subspace of $A$. 

**Proof**


---
### **The Eigenspaces are Nipotent for $A$**





