[Subspace Direct Sum](Subspace%20Direct%20Sum.md)


---
### **Intro**

Let's take a look at how null space of $A$ and $A - \lambda I$ can from a basis given any Linear Operator. 

**Define: Eigenspace of order $k$** 

> $$
> \mathcal{N}_k(\lambda) = \text{Ker}(A - \lambda I)^k
> $$

Where $\lambda$ is any eigenvalues of matrix $A$. The kernel of $(A - \lambda I)^k$.  

### **Lemma 1 (Pretty Important)**

> $$
> \exists\; k: \mathcal{N}_1(\lambda) \subseteq \mathcal{N}_2({\lambda}) \subseteq \cdots = \mathcal{N}_k(\lambda) = \mathcal{N}_{k + 1}(\lambda) = \cdots 
> $$

There exists some value of $k$, such that the kernel of $(A - \lambda I)^{k}$ stops expanding as the power gets larger. 

**Proof**

We are going to use proof by induction nested with a proof by contradiction. Let the inductive hypothesis be: 

$$
\mathcal{N}_{k + l}(\lambda) =  \mathcal{N}_{k + l - 1}(\lambda)
$$

We wish to prove: 

$$
\exists \;k: \mathcal{N}_{k + l}(\lambda) =  \mathcal{N}_{k + l  + 1}(\lambda)
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
    \equiv&  \neg (v \in \mathcal{N}_1(\lambda) \implies v\in \mathcal{N}_2(\lambda))
\end{aligned}
$$

Well, obviously, $v \in \mathcal{N}_1(\lambda) \implies v \in \mathcal{N}_2(\lambda)$, if this is not true, I think the universe will be broken. 

Now, because this is the case, and the linear operator $A$ has finite dimensional subspace, this will mean that at some point, the subspace will have to be equal. This goes back to the hypothesis we made. 

$\blacksquare$


---
### **Lemma 2**

Eigenspace and the image of the matrix removing eigen space doesn't intersect with each other. 

> $$
> \mathcal{N}_k(\lambda) \cap \text{Im}(A - \lambda I)^k = \{\mathbf{0}\}
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

The first $\implies$ comes from substituion of $v$ in term of $w$. The second implies comes from the fact that $(A - \lambda I)^kv$ is not expanding for larger value of $k$.

$\blacksquare$


---
### **Lemma 3**

The eigen space and the matrix range removing the eigen space is spanning the whole subspace of the linear operator and they are disjoint. 

> $$
> \mathcal{V} = \mathcal{N}_k(\lambda) \oplus \text{Im}(A - \lambda I)^k
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

> $\mathcal{N}_k(\lambda)$ and $\text{Im}(A - \lambda I)^k$ are invariant subspace of $A$. 

**Proof**

$$
\begin{aligned}
    & v \in \mathcal{N}_k(\lambda) 
    \\
    & (A - \lambda I)^k v = 0
    \\
    & (A - \lambda I )^kAv = A(A - \lambda I)^k v
    \\
    & = \mathbf{0}
\end{aligned}
$$

Therefore $\mathcal{N}_k(\lambda)$  is the invariant subspace of $A$. $\blacksquare$

**Note**: $A(A - \lambda I)^k = (A - \lambda I )^kA$, this is true in the sense that $A(A - \lambda I) = (A - \lambda I)A$

**Consider:** 

$$
\begin{aligned}
    v = (A - \lambda I)^kw \quad w \neq \mathbf{0}
    \\
    Av = A(A - \lambda I)^k w
    \\
    Av = (A - \lambda I)^k \underbrace{(Aw)}_{y}
    \\
    Av \in \text{Im}(A - \lambda I)
\end{aligned}
$$

$\blacksquare$

---
### **Theorem**

Constructing the Eigenspaces. 

Let's start with: 

$$
\begin{aligned}
    & \text{Ker}(A - \lambda_1 I)^{n_1} \oplus \text{Im}(A - \lambda_1I)^{n_1}
\end{aligned}
$$

Let's define the new linear operator $A^{(2)}$ mapping from $\text{Im}(A - \lambda_1I)^{n_1}$ to $A$ and then to whatever, then this will create 2 new subspaces for the direct sum. We use **Lemma 3** and **Lemma 4**. 

$$
\begin{aligned}
    & \text{Ker}(A - \lambda_1 I)^{n_1} \oplus \text{Im}(A - \lambda_1I)^{n_1}
    \\\underset{{\text{[1]}}}{\implies}
    & 
    \text{Ker}(A - \lambda_1 I)^{n_1} \oplus \text{Ker}(A - \lambda_2I)^{n_2}\oplus\text{Im}((A - \lambda_2 I)^{n_2}(A - \lambda_1I)^{n_1})
    \\
    & 
    \text{Ker}(A - \lambda_1I)^{n_1} \oplus 
    \text{Ker}(A - \lambda_2I)^{n_2}\oplus \cdots 
    \oplus 
    \text{Ker}(A - \lambda_kI)^{n_k}
\end{aligned}
$$

\[1\]: 
Let $v\in \text{Im}(A - \lambda_1I)^{n_1}$, then apply $A$ on $v$, and consider $(A - \lambda_2 I)^{n_2}v$, which will be: 

$$
\begin{aligned}
    & (A - \lambda_1 I)^{n_1}v 
    \\
    & (A - \lambda_1 I)^{n_1}(A - \lambda_2 I)^{n_2}
\end{aligned}
$$

And that is the new subspace for eigen decomposition. Because the subspace is all linear independent to each other by **lemma 2**, and they build up $\mathcal{V}$ (by **Lemma 3**), the subspace for the original linear operator, then in the end, we have all the eigensubspace. **Lemma 4** makes the inductive steps possible because it preserve the image of $(A^{(i - 1)} - \lambda_{i - 1})^{n_{i - 1}}$ inductively. 


---
### **Jordan Blocks**

Jordanblocks are standard form of nilpotent matrices. 

Let's fix the values of $\lambda$, so lemma 1 will be: 

$$
\exists \; k:\mathcal{N}_1 \subseteq \mathcal{N}_2 \cdots \mathcal{N}_{k - 1}\subseteq \mathcal{N}_{k} = \mathcal{N}_{k + 1}\cdots
$$

The null space of $(A - \lambda I)^n$ stops expanding after a while and they equals. this is from **Lemma 1**. 

**Define**

$$
B = (A - \lambda I)
$$


**Relative Linear Independence/Basis**

We need to define this. 

> $$
> \begin{aligned}
>     \mathcal{A} \vdash \mathcal{B} \iff 
>     \forall \; b \in \text{span}(\mathcal{B}): 
>     \sum_{i}^{}w_ia_i = b \implies w_i = 0 \;\forall \; i
> \end{aligned}
> $$

$\mathcal{A}$ is a relative basis of $\mathcal{B}$, which means that, for all elements in set $\mathcal{B}$, it's not a linear combinations of any vectors in $\mathcal{A}$ 

Any subsets of a set of linear independent vectors will give 2 subspaces that are relative basis to each other. Replacing $\mathcal{B} = \{\mathbf{0}\}$ will produce the traditional definition of basis. 

**Observe**

$$
v \in \mathcal{N}_l \implies Bv \in \mathcal{N}_{l - 1}
$$

Because: 

$$
\begin{aligned}
    &  v \in \mathcal{N}_l
    \\\implies & 
    B^l v = \mathbf{0}
    \\\implies&
    B^{l-1}Bv = \mathbf{0}
    \\\implies& 
    Bv \in \mathcal{N}_{l - 1}
\end{aligned}
$$

**Lemma 5**

> Using subspace $\mathcal{N}_k$ to define a relative basis for $\mathcal{N}_{k - 1}$, say it's $\{e_1, e_2, \cdots, e_s\}$, we wish to prove that $\{e_i\}_{i = 1}^s \cup B(\{e_i\}_i^s)$ is a relative basis to $\mathcal{N}_{k - 2}$. 

**By definition:** 

$$
\begin{aligned}
    & \{e_1, e_2, \cdots, e_s\} \vdash \mathcal{N}_{k} \wedge \{e_1, e_2, \cdots, e_s\} \subset \mathcal{N}_{k}
    \\\implies &
    \forall s \in \mathcal{N}_{k - 1}: 
    \sum_{i}^{}c_i e_i = s\implies c_i = 0 \;\forall \; i
\end{aligned}
$$

By the previous observations: 

$$
B(\{e_i\}_{i = 1}^s) \subseteq \mathcal{N}_{k - 1}
$$

Consider, if there exists a linear combinations of $\{e_i\}_{i = 1}^s\cup B(\{e\}_{i = 1}^s)$ that can be represented by elements from subspace $\mathcal{N}_{k - 1}$, then it can be said that: 

$$
\begin{aligned}
    & \underbrace{\sum_{i}^{} c_i e_i}_{\in \mathcal{N}_k} + \underbrace{\sum_i d_i Be_i}_{\in \mathcal{N}_{k-1}} \in \mathcal{N}_{k - 2} \subset \mathcal{N}_{k - 1}
    \\\implies & 
    c_i = 0 \; \forall i \quad \text{ because }  \{e_i\}_{i = 1}^s \vdash \mathcal{N}_{k - 1}
\end{aligned}
$$

Setting $c_i$ to zeros and then we consider: 

$$
\begin{aligned}
    & \sum_{i}^{} d_i Be_i \in \mathcal{N}_{k - 2}
    \\\implies & 
    B^{k - 2}\sum_{i}^{} d_i Be_i = \mathbf{0}
    \\\implies & 
    B^{k - 1}\sum_{i}^{}d_i e_i = \mathbf{0}
    \\\implies &
    \sum_{i}^{}d_i e_i \in \mathcal{N}_{k - 1}
    \\\underset{[1]}{\implies}&
    d_i = 0\quad \forall\; i
\end{aligned}
$$

\[1\]: This is true by the hypothesis that $\{e_i\}_{i =1}^{s} \vdash \mathcal{N}_{k - 1}$. 

$\blacksquare$


---
### **The constructions of Generalized Eigenvectors**

The size of the Null space expanses as the power of $B$ increases. 

A chain of vector spans $\mathcal{N}_k$ firmly. Because: 

$$
\begin{aligned}
    v & \in \mathcal{N}_k \wedge v \vdash \mathcal{N}_{k - 1}
    \\
    Bv & \in \mathcal{N_{k - 1}} \wedge Bv \vdash \mathcal{N}_{k - 2}
    \\
    &\vdots
    \\
    B^{k - 2}v &\in \mathcal{N}_{2} \wedge B^{k - 2}v  \vdash \mathcal{N}_{1}
\end{aligned}
$$

Each time, a new vector that is not in the previous $\mathcal{N}$ gets introduces, therefore, the set: 

$$
\{v, Bv, \cdots , B^{k - 2}v\} \cup \{
    \mathcal{N}_1
\} \quad \text{spans } \quad \mathcal{N}_{k}
$$




