- [Multivalued Functions, Set-valued Mappings](Multivalued%20Functions,%20Set-valued%20Mappings.md) 
- [Minty's Theorem, The Surjectivity Theorem](Minty's%20Theorem,%20The%20Surjectivity%20Theorem.md)

---
### **Intro**

The resolvent operators are important objects optimizations due to its favorable properties. 
It makes multivalued mapping such as a monotone operator into an, singled valued mapping for study. 
Recall Minty's Theorem. 

### **Def 1.0 | Resolvent Operators**

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
Recall from multivalued mapping that, $\text{gph}(A^{-1})$ and $\text{gph}(I - A)$ are sets that are just one linear transformation away. 
The transformation is in $X \times X$. 


#### **Theorem | Resolvent of monotone operators**



---
### **Firmly Non-expansiveness of the Resolvent Operators**

We discuss how the resolvent operator preserves some favorable properties of the original operator. 
See [Firmly Nonexpansive Operators](Firmly%20Nonexpansive%20Operators.md) for more information about firmly non-expansive operators. 


#### **Prop 2.1 | Resolvent of Monotone Operators are Firmly non-expansive**
> Let $A: X \mapsto 2^X$, and $D = \text{rng}(I + A)$, and $T = \mathcal J_A  = (I + A)^{-1}$.
>  Then 
> 1. $A$ is mono implies $T: D\mapsto X$ is firmly non-expansive. 
> 2. $A$ is maximal monotone then $T: X \mapsto X$ is firmly non-expansive. 
> And under both cases $T$ is a single-valued operator. 

**Proof**

If $x = \mathcal J_Au$ and $y = \mathcal J_Av$ then we have $u - x \in Ax$ and $v - y \in Ay$. 
By $A$ being monotone we have 

$$
\begin{aligned}
    0&\le 
    \langle x - y, (u - x) - (v - y)\rangle 
    \\
    &= \langle  x -y, -(x - y) + (u - v)\rangle
    \\
    0&\le 
    \langle x - y, u - v\rangle
    - \Vert x - y\Vert^2. 
\end{aligned}
$$

Therefore, we would have 

$$
\begin{aligned}
    \langle \mathcal J_Au - \mathcal J_A v, u - v\rangle  
    &\ge \Vert \mathcal J_A u -\mathcal J_Av\Vert^2. 
\end{aligned}
$$

$\blacksquare$

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

#### **Claim 3.1 | Resolvent of a Strongly Monotone Operator**
> With $B$ $\beta$-strongly monotone written as $B = A + \beta I$ where A is maximally monotone, then $\mathcal J_B$ is a contraction with contraction index $(1 + \beta)^{-1}$. 
> And $I - \mathcal J_B$ is a strongly monotone operator. (Also known as Co-coersive.). 

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


#### **Claim 3.2 | Co-Coersivity of the resolvent operator of strongly monotone operator**
> With $\beta$ strongly monotone operator $B$, resolvent $\mathcal J_B$, then $I - \mathcal J_B$ is a $(1 - (1 + \beta)^{-1})$ strongly monotone operator. 

**Proof**

Firstly, we consider for all $x, y$ which has

$$
\begin{aligned}
    \langle x - y, \mathcal J_B x - \mathcal J_B y\rangle  
    &\le 
    \Vert x - y\Vert \Vert \mathcal J_Bx - \mathcal J_B y\Vert
    \\
    &= \Vert x - y\Vert (1 + \beta)^{-1}\Vert x - y\Vert
    \\
    &= (1 + \beta)^{-1}\Vert x - y\Vert^2. 
\end{aligned}
$$

With that we have inequality 

$$
\begin{aligned}
    \langle x - y, -\mathcal J_Bx + \mathcal J_By \rangle 
    &\ge - (1 + \beta)^{-1}\Vert x - y\Vert^2 
    \\
    \iff
    \langle x - y, x - y -(\mathcal J_Bx - \mathcal J_By) \rangle 
    &\ge
    (1 - (1 + \beta)^{-1})\Vert x - y\Vert^2
    \\
    \implies 
    \Vert x - y\Vert\Vert [I - \mathcal J_B]x - [I - \mathcal J_B] y\Vert
    &\ge
    (1 - (1 + \beta)^{-1})\Vert x - y\Vert^2
    \\
    \iff
    \Vert [I - \mathcal J_B]x - [I - \mathcal J_B] y\Vert 
    &\ge
     (1 - (1 + \beta)^{-1})\Vert x - y\Vert, 
\end{aligned}
$$

Therefore, it establishes that $[I - \mathcal J_B]$ is a $1 - (1 + \beta)^{-1}$ strongly convex operator. 

**Remarks**

With $\beta$ strongly monotone operator $B$, it's insufficient to gurantee that strong convexity of operator $\mathcal J_B$ in general. 
Counter example identified by me, and it's posted in Stack exchange: [here](https://math.stackexchange.com/questions/4925632/counter-example-for-the-resolvent-of-a-strongly-monotone-operator-being-strongly/4981168#4981168). 


We are specifically interested in looking at the strongly monotone operator $\partial f$ where $f$ is a $\mu$-strongly convex function. 
#### **Theorem | Strongly convex functions**


**Proof**


