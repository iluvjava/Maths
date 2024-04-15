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

Let $x_n\rightarrow x$, let $d_C$  be the distance to the set $C$, and hence it's a 1-Lipschitz function, then according to the definitions we have 

$$
\begin{aligned}
    \Vert x_n - \Pi_C x_n\Vert &= d_C(x_n) 
    \rightarrow \Vert x - \Pi_Cx\Vert = d_C(x), 
\end{aligned}
$$

which we used the continuity of the distance function. 
Using the fact that $x_n$ is convergence in finite dim space, we have that $\Vert x_n\Vert$ bounded and $\Pi_C x_n$ bounded as well by the Lipschitz 1 Property of projection operator. 
Therefore, Bozano Weierstrass would give 

$$
\begin{aligned}
    \text{dim}(X) < \infty \wedge \Vert \Pi_C x\Vert < \infty \implies 
    &
    \exists (k_n)_{n \in \mathbb N}: 
    \Vert x_{k_n} - \Pi_C x_{k_n}\Vert \rightarrow \Vert x - \Pi_C x\Vert
    \\
    \implies & 
    (\exists y \in C : \Vert x - \Pi_C y\Vert = d_C(x) )\implies 
    y = \Pi_C x, \; y \in C 
    \\
    & \text{ Singled valued projection by $C$ being Chebyshev} 
    \\
    \implies & 
    \Pi_C x_n \rightarrow \Pi_C x = y \in C. 
\end{aligned}
$$

To summarized, we used the subsequential limit and the definition of a projection operator to identify one of the outputs of the operator $\Pi_C$. 
Then that limit will have to be unique by the fact that $C$ is a Chebyshev set. 

**Remarks**

Projection may not be Lipschitz operator when the underlying set $C$ is not a convex set. 


#### **Thm | Chebyshev Operator Means Convexity of the Set (Finite Dimention Only)**
> Let $X$ be finite dimensional, and $C$ is Chebyshev, then $C$ is a convex set. 

**Proof**

From the previous lemma, projection operator $\Pi_C$ is a continuous operator. 
From the fact that the operator is a projection operator, $\Pi_C$ is a monotone operator. 
For more info, see [Monotone Operators Introduction](Monotone%20Operators%20Introduction.md). 
Since $\Pi_C$ is continuous, monotone, and full domain, using [Minty's Theorem, The Surjectivity Theorem](Minty's%20Theorem,%20The%20Surjectivity%20Theorem.md), it would be that $\Pi_C$ is a maximally monotone operator. 
Now we used the fact that a Monotone operator has a convex domain (See [Monotone Operators In Depth](Monotone%20Operators%20In%20Depth.md)). 
The domain of the projection $\Pi_C$ is the set $C$ since $C$ is already closed, it must be the $C$ is a convex set. 