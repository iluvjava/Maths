- [Projection in Hilbert Spaces](Projection%20in%20Hilbert%20Spaces.md)- 
- [Convex Sets Projections and Dist, Intro](Convex%20Sets%20Projections%20and%20Dist,%20Intro.md)
- [Monotone Operators Introduction](Monotone%20Operators%20Introduction.md)

---
### **Intro**

Our ambience space $X$ is a Hilbert space. 
Professor Heinz is very interested in this type of problem because it's very deep and it's linked to an open problem in mathematics. 

#### **Def | Chebyshev Sets**
> $C$ is a Chebyshev sets when it satisfies the following: 
> 1. It's Non-empty, 
> 2. It's Closed, 
> 3. $\Pi_C$ is always a singleton. 


#### **Thm | A Convex Closed Set is Chebyshev**
> Let $C$ be non-empty closed and convex. 
> Then it is a Chebyshev sets. 

**Proof**

See [Convex Sets Projections and Dist, Intro](Convex%20Sets%20Projections%20and%20Dist,%20Intro.md) for more information. 

**Remarks**

The converse of the theorem in Hilbert space is an unsolved mystery. 
In a finite dimensional space, $C$ being a Chebyshev set would be equivalent for $C $ being a closed, non-empty convex set. 



#### **Lemma | Chebyshev And Continuity**
> Suppose that $X$ is a finite dimensional Hlibert space and $C$ is Chebyshev set, then $\Pi_C$ is continuous. 

**Proof**

Choose any $x \in X$. 
Let $x_n\rightarrow x$, we want to show that $\Pi_C x_n \rightarrow \Pi_Cx$, and since $\Pi_C x$ is singleton by $C$ being Chebyshev, we would had shown that $\Pi_C$ is continuous. 
distance function $d_C$ is continuous and therefore we have $d_C(x_n) \rightarrow d_C(x)$. 
And by definition of distance function, the convergence implies $\Vert \Pi_C x_n - x_n\Vert \rightarrow \Vert \Pi_C x - x\Vert$. 
$x_n \rightarrow x$ implies $\Vert x_n\Vert < M_1 <\infty$ for all $n$, the convergence of distance function implies $\Vert \Pi_C x_n - x_n\Vert < M_2 < \infty$ as well, therefore: 

$$
\begin{aligned}
    \Vert x_n - \Pi_C x_n\Vert 
    &\ge |\Vert x_n\Vert - \Vert \Pi_C x_n\Vert|
    \\
    M_2 
    &\ge |\Vert x_n\Vert - \Vert \Pi_C x_n\Vert |
    \\
    \Vert x_n\Vert - \Vert \Pi_C x_n\Vert
    &\in [-M_2, M_2]
    \\
    \Vert \Pi_C x_n\Vert
    &\in [-M_2 - M_1, M_2 + M_1] \; \forall n \in \mathbb N, 
\end{aligned}
$$

therefore, these conditions translate to $\Pi_C x_n$ being a bounded sequence as well. 
By Bozano Wereistrass, we would have that $\text{clstr}(\Pi_C x_n) \neq \emptyset$, the cluster point of the projection sequence is non-empty. 
Take any $y \in \text{clstr}(\Pi_C x_n)$, we would have $\Pi_C x_{k_n} \rightarrow y$. 
Here the subsequence is associated with the specific choice of $y \in \text{clstr}(\Pi_C x_n)$. 
The consequence for any cluster point $y$ is 

$$
\begin{aligned}
    \Vert x_n - \Pi_C x_n \Vert\rightarrow d_C(x) 
    \\
    \implies 
    \Vert x_{k_n} - \Pi_C x_{k_n}\Vert \rightarrow d_C(x). 
\end{aligned}
$$

Since the choice of $y \in \text{clstr}(\Pi_C x_n)$ is arbitrary, consider any other $\overline y, y \in \text{clstr}(\Pi_C x_n)$, both would satisifes the above conditions. 
Using the fact that $C$ is Chebyshev, $\Pi_C$ is singled valued and therefore, the closest point to $C$ from $x$ is unique and therefore $y = \overline y$




**Remarks**

Projection may not be Lipschitz operator when the underlying set $C$ is not a convex set. 


#### **Thm | Chebyshev Operator Means Convexity of the Set (Finite Dimension Only)**
> Let $X$ be finite dimensional, and $C$ is Chebyshev, then $C$ is a convex set. 

**Proof**

From the previous lemma, projection operator $\Pi_C$ is a continuous operator. 
From the fact that the operator is a projection operator, $\Pi_C$ is a monotone operator. 
For more info, see [Monotone Operators Introduction](Monotone%20Operators%20Introduction.md). 
Since $\Pi_C$ is continuous, monotone, and full domain, using [Minty's Theorem, The Surjectivity Theorem](Minty's%20Theorem,%20The%20Surjectivity%20Theorem.md), it would be that $\Pi_C$ is a maximally monotone operator. 
Now we used the fact that a Monotone operator has a convex domain (See [Monotone Operators In Depth](Monotone%20Operators%20In%20Depth.md)). 
The domain of the projection $\Pi_C$ is the set $C$ since $C$ is already closed, it must be the $C$ is a convex set. 