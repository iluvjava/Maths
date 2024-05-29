- [Multivalued Functions, Set-valued Mappings](Multivalued%20Functions,%20Set-valued%20Mappings.md) 
- [Minty's Theorem, The Surjectivity Theorem](Minty's%20Theorem,%20The%20Surjectivity%20Theorem.md)

---
### **Intro**

The resolvent operators are important objects optimizations due to its favorable properties. 
It makes multi-valued mapping such as a monotone operator into an, singled valued mapping for study. 

### **Def | Resolvent Operators**

> Let $A: X \mapsto 2^X$ be an operator, then the resolvent $\mathcal J_A := (I + A)^{-1}$. 

**Observations**

The domain of the operator is the same as operator $A$. 
Using Minty's theorem, when $A$ is maximally monotone, the operator $(I + A)$ has full domain and therefore the domain of $\mathcal J_A$ is $X$ because 

$$
\begin{aligned}
    \text{dom}(T) &= \text{rng}(T^{-1}) = \text{rng}(I + A) = X. 
\end{aligned}
$$

The graph of the resolvent operator is a linear transform of the graph of the original operator. 
Recall from multi-valued mapping that, $\text{gph}(A^{-1})$ and $\text{gph}(I - A)$ are sets that are just one linear transformation away. 
The transformation is in $X \times X$. 


---
### **Firmly Non-expansiveness of the Resolvent Operators**

We discuss how the resolvent operator preserves some favorable properties of the original operator. 
See [Firmly Nonexpansive Operators](Firmly%20Nonexpansive%20Operators.md) for more information about firmly non-expansive operators. 


#### **Prop | Resolvent of Monotone Operators are Firmly non-expansive**
> Let $A: X \mapsto 2^X$, and $D = \text{rng}(I + A)$, and $T = \mathcal J_A  = (I + A)^{-1}$.
>  Then 
> 1. $A$ is mono implies $T: D\mapsto X$ is firmly non-expansive. 
> 2. $A$ is maximal monotone then $T: X \mapsto X$ is firmly non-expansive. 
> And under both cases $T$ is a single valued operator. 

**Proof**

If $x \in \mathcal J_A(u)$ and $y \in \mathcal J_A(v)$ then we have $u - x \in Au$ and $v - y \in Ay$. 
By $A$ being monotone we have 

$$
\begin{aligned}
    \langle x - y, (u - x) - (v - y)\rangle & \ge 0 
    \\
    \langle  x -y, -(x - y) + (u - v)\rangle &\ge 0
    \\
    \langle x - y, u - v\rangle &\ge \Vert x - y\Vert^2. 
\end{aligned}
$$

However, we would also have 

$$
\begin{aligned}
    v - y &\in A y \iff y \in [I + A]^{-1}v =\mathcal J_A v, 
    \\
    u - x &\in Ax \iff x \in [I + A]^{-1} u =\mathcal  J_A u. 
\end{aligned}
$$

and therefore, we would have 

$$
\begin{aligned}
    \langle \mathcal J_Au - \mathcal J_A v, u - v\rangle  
    &\ge \Vert \mathcal J_A u -\mathcal J_Av\Vert^2. 
\end{aligned}
$$

which is equivalent to that $J_A$ is a firmly non-expansive operator by one equivalent characterization of firmly nonexpansive operators. 
In addition, a firmly non-expansive operator is a single valued operator because it's already non-expansive. 
It's evident from above by setting $u = v$, then $x = y$ from the inequality. 
To see that $T$ is a full domain operator, apply the observations we made about resolvent operators at the start of the file. 

**Remarks**

Using the equivalent characterizations of a firmly non-expansive operators, we obtain the following fact with minimal efforts: 

1. $I - \mathcal J_A$ is a firmly non-expansive operator as well. 
2. $\mathcal R_A = 2\mathcal J_A - I$ is non-expansive and a full domain operator. 
3. The resolvent operator is obviously monotone as well because it's already firmly non-expansive. 


---
### **The Resolvent of a Strongly Monotone Operator**

By the realization that a strongly monotone operator is monotone. 
The above results apply for the resolvent of strongly monotone operator too. 
In this section, we show that the resolvent of a strongly monotone operator exhibits additional favorable properties. 

#### **Claim | Resolvent of a Strongly Monotone Operator**
> With $B$ $\beta$-strongly monotone written as $B = A + \beta I$ where A is maximally monotone,  then the resolvent operator $\mathcal J_{B} = (I + B)^{-1}$ is $((1 + \beta)^{-1} - 1)$-strongly monotone.
> In addition, $\mathcal J_B$ is a contraction with contraction index $(1 + \beta)^{-1}$. 

**Proof**

With $u = \mathcal J_B x, v = \mathcal J_B y$, so there exists $u \in Bu, v \in Bv$ where $x = u_B + u, y = v_B + v$ 

$$
\begin{aligned}
    \langle \mathcal J_Bx - \mathcal J_B y, x - y\rangle
    &= \langle u - v, x - y\rangle 
    \\
    &= \langle u - v, u + u_B - (v - v_B)\rangle
    \\
    &= \Vert u - v\Vert^2 + \langle u - v, u_B - v_B\rangle
    \\
    ([1])\implies 
    &\ge \Vert u - v\Vert^2 + \beta \Vert u - v\Vert^2
    \\
    &\ge (1 + \beta) \Vert u - v\Vert^2, 
\end{aligned}
$$

where at (\[1\]), we used strong monotonicity of $B$. 
By cauchy Swarts we have: 

$$
\begin{aligned}
    \Vert u - v\Vert \Vert x + y\Vert
    &\ge 
    (1 + \beta) \Vert u - v\Vert^2
    \\
    \Vert u - v\Vert
    &\le (1 + \beta)^{-1} \Vert x - y\Vert, 
\end{aligned}
$$

therefore, $\mathcal J_B$ is also a conraction with contraction index $(1 + \beta)^{-1} < 1$. 
Which is also the Lipschitz constant of the $\mathcal J_B$. 

Consider $x' = ((1 + \beta)I + A)^{-1}x = \mathcal J_Bx$, 
then $\exists x'_A \in Ax: (1 + \beta)x' + x'_A = x$, similarly for $y$ we have $\exists y \in Ay: (1 + \beta)x' + y'_A = y$. 
With that information consider any $u' = \mathcal J_B u$ for any $u$: 
$$
\begin{aligned}
    & \exists u'_A \in Au: 
    (1 + \beta) u' = u - u'_A
    \\
    & \exists u'_A \in Au: u' = (1 + \beta)^{-1}(u - u_A')
\end{aligned}
$$
and hence: 

$$
\begin{aligned}
    & \exists x'_A \in Ax: x' = (1 + \beta)^{-1}(x - x_A')
    \\
    & \exists y'_A \in Ay: y' = (1 + \beta)^{-1}(y - y_A')
\end{aligned}
$$

with $u \in \{x, y\}$, we would have

$$
\begin{aligned}
    \langle x' - y', x - y\rangle &= 
    (1 + \beta)^{-1}\langle x - x'_A - (y - y'_A), x - y \rangle
    \\
    &= (1 + \beta)^{-1} \langle (x - y) - (x'_A - y'_A), x- y\rangle
    \\
    &= (1 + \beta)^{-1}\Vert x - y\Vert^2 + 
    \langle -(x_A' - y_A'), x - y\rangle
    \\
    &= 
    ((1 + \beta)^{-1} - 1)\Vert x - y\Vert^2 + 
    \langle (x - y) -(x_A' - y_A'), x - y\rangle 
    \\
    &= 
    ((1 + \beta)^{-1} - 1)\Vert x - y\Vert^2 + 
    \langle x - x'_A - (y - y'_A), x - y\rangle
    \\
    & \text{by } x - x'_A = (1 + \beta) x', y - y'_A = (1 + \beta) y'
    \\
    & = ((1 + \beta)^{-1} - 1)\Vert x - y\Vert^2 + 
    \langle (1 + \beta)(x' - y'), x - y\rangle
    \\
    ([1])\implies 
    &\ge 
    ((1 + \beta)^{-1} - 1)\Vert x - y\Vert^2 + (1 + \beta)^2 \Vert x' - y'\Vert^2
    \\
    &\ge 
    ((1 + \beta)^{-1} - 1)\Vert x - y\Vert^2. 
\end{aligned}
$$

At (\[1\]) we used $\langle \mathcal J_B x - \mathcal J_B y, x - y \rangle \ge (1 + \beta)\Vert \mathcal J_B x - \mathcal J_B y\Vert^2$
Observe that with $\beta > 0$, $((1 + \beta)^{-1} - 1) > 0$ and hence $\mathcal J_B$ is strongly monotone with constant: $((1 + \beta)^{-1} - 1)$. 
Combining both results we have 
$$
\begin{aligned}
    ((1 + \beta)^{-1} - 1) \Vert x - y\Vert^2 
    \le \langle \mathcal J_B x - \mathcal J_B y, x - y\rangle 
    \le (1 + \beta)^{-1}\Vert x - y\Vert^2
\end{aligned}
$$
