This is fundamental about vector spaces and linear operators. 


----
### **Intro**

There are 2 types of summation when it comes to subspaces in linear algebra. 

**Define a bunch of subspaces:** 

> $$
> \mathcal{V} = \{
>     V_1\subseteq \mathbb{R}^{n}, V_2 \subseteq \mathbb{R}^n, \cdots V_m \in \mathbb{R}^n
> \} 
> $$

**Normal Summation**

A normal summation over these bunches of subspaces: 

> $$
> \sum_{v\in \mathcal{V}}^{}v = 
> \sum_{i = 1}^{m}w_iv_i 
> $$

And this is a linear combinations in the traditional sense. Notice that, the vector $v_i$ is from the subspace. And there really could be multiple vectors from the subspace. And in that sense, this means we can have more flexitybilty. 

$w_i$ is there because the vector $v$ comes from a subspace. Then the choice for the weights on the vector is going to be arbitrary. 

**Direct Summation**

Direction summation of subspaces is stricter. 

> $$
> \bigoplus_{v\in \mathcal{V}}^{}  v = \sum_{i = 1}^{m} w_iv_i \iff 
> \exists ! \{w_1, w_2, \cdots w_m\}: \bigoplus_{v\in \mathcal{V}} v = \sum_{i = 1}^{m}w_1v_i
> $$

The only way that direct summation is the same as Normal Summation is when the weights placed upon vectors from each of the subspaces is **unique**. 

**Direct Consequences of the Definition**

$$
\bigoplus_{v\in \mathcal{V}} v = \mathbf{0} \implies w_1 = w_2, \cdots = w_m = 0 \text{ is the only solution for weights}
$$

And this basically means that: 

$$
\forall\; U, V \in \mathcal{V}: U \cap V = \text{span}\{\mathbf{0}\}
$$

$$
\text{dim}(U\oplus V) = \text{dim}(U) + \text{dim}(V)
$$

**A Trick to Remember**: 

> $$
> U\oplus V = \text{span}(U)\;\dot\cup\;\text{span}(V)
> $$

It's like a disjoint union of 2 sets, and the sets will have to be disjoint. 

---
### **Relative Independence**


---
### **Block Diagonal Matrices and Direct Sum**

> $$
> A = A_{1,1}\oplus A_{2, 2}\oplus \cdots \oplus A_{n-1, n-1}\oplus A_{n, n} = \bigoplus_{i = 1}^nA_{i, i} = 
> \begin{bmatrix}
>     A_{1, 1}& & 
>     \\
>     & A_{2, 2,}& 
>     \\
>     \\
>     & & \ddots&
>     \\
>     & & & A_{n, n}
> \end{bmatrix}
> $$

And this is direc sums applied to sequences of matrices.


