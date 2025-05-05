---
alias:Regular Subgradient
---
- [Subgradient Intro](Subgradient%20Intro.md)

---
### **Intro**

Under simple cases where the function is non-convex, the convex subgradient doesn't reduces to the ordinary gradient for differentiable functions. 
For example $x^3$ doesn't have any convex subgradient but it's a differentiable function. 
This motivates the definition and discussion for regular subgradient for non-convex functions. 

Let $f : \mathbb R^n \mapsto \mathbb{\bar R}$. 
Let $v \in \hat \partial f(\bar x)$. 
Let $\bar x \in \text{dom}(f)$. 
Denote the second order information of the function using the notation:

$$
\begin{aligned}
    \mathbb D_f(x, \bar x | v) = f(x) - f(\bar x) - \langle v, x - \bar x\rangle. 
\end{aligned}
$$

The above is similar to [Bregman Divergence](Bregman%20Divergence.md), here this is a generalization to function that are not necessarily differentiable. 
For example, this notations can represent a differentiable function (See [Frechet, Gateaux Differentiability Euclidean Space](../../MATH%20000%20Math%20Essential/Analysis/Frechet,%20Gateaux%20Differentiability%20Euclidean%20Space.md)). 
Recall: [The Little-o Notations in Limits](../../MATH%20000%20Math%20Essential/Analysis/The%20Little-o%20Notations%20in%20Limits.md). 
Let $f : \mathbb R^n \mapsto \R$ be a differentiable at $\bar x \in \mathbb R^n$ if and only if there exists $v \in \mathbb R^n$ such that 

$$
\begin{aligned}
    o(\Vert x  - \bar x\Vert)
    & \le 
    \mathbb  D_f(x, \bar x| v) \le o(\Vert x - \bar x\Vert)
    \iff
    \lim_{x\rightarrow \bar x}
    \frac{\mathbb D_f(x,  \bar x| v)}{\Vert x - \bar x\Vert} = 0
\end{aligned}
$$

We know define the regular subgradient. 

#### **Definition | Regular Subgradient**
> $v \in \hat \partial f(\bar x)$ is a subgradient if and only if 
> $$
>   \liminf_{x \rightarrow \bar x} \frac{\mathbb D_f(x, \bar x | v)}{\Vert x - \bar x\Vert} \ge 0. 
> $$


#### **Claim | Second Order Lower Model**
> Let $v \in \hat \partial f(\bar x)$, if and only if there exists $\varphi(x - \bar x)$ such that $\mathbb D_f (x, \bar x | v) \ge \varphi(x - \bar x)$ and $\nabla \varphi (\bar x) = \mathbf 0$, i.e: $\varphi = o(\Vert x - \bar x\Vert)$. 

**Proof**

For the $(\implies)$ direction, consider $v \in \hat \partial f(\bar x)$. 
From the definition of regular subgradient, we have that $\mathbb D_f(x, \bar x, | v) \ge o(\Vert x - \bar x\Vert)$ which means there exists $\varphi: \R^n \rightarrow \R$ satisfying $\varphi (x - \bar x) = o(\Vert x - \bar x\Vert)$ would statisfies: 

$$
\begin{aligned}
    \lim_{x \rightarrow \bar x} \frac{\varphi (x - \bar x)}{\Vert x - \bar x\Vert} &= 0 \iff \nabla \varphi(x - \bar x) = \mathbf 0. 
\end{aligned}
$$

For the $(\impliedby)$ direction, we consider $\varphi(x - \bar x) = \min(\mathbb D_f(x , \bar x | v), 0)$ then $\nabla \varphi(x - \bar x) = \mathbf 0$ implies


$$
\begin{aligned}
    0
    &= 
    \liminf_{
        x \rightarrow \bar x
    } \frac{\varphi(x - \bar x)}{\Vert x - \bar x\Vert}
    \\
    &= 
    \liminf_{
        \bar x \neq x \rightarrow \bar x
    } 
    \frac{\min(\mathbb D_f(x, \bar x | v), 0)}{\Vert x - \bar x\Vert}
    \\
    &= \min\left(
        \liminf_{
            x \rightarrow \bar x
        } 
        \frac{\mathbb D_f(x, \bar x | v)}{\Vert x - \bar x\Vert} , 0
    \right)
    \\
    &\le 
    \liminf_{
        x \rightarrow \bar x
    } 
    \frac{\mathbb D_f(x, \bar x | v)}{ \Vert x - \bar x\Vert}. 
\end{aligned}
$$


**Remarks**

The above characterization is equivalent to the definition of regular subgradient. 

#### **Claim | Differentiable Lower Bounding Functions**
> $v\in \hat \partial f(\bar x)$ if and only if there exists $h : \mathbb R^n \mapsto \mathbb R$ such that $h$ is differentiable at $\bar x$ with $f(x) \ge h(x), f(\bar x) = h (\bar x)$ and $\nabla f(\bar x) = v$. 

**proof**

We suggest the following function as a the candidate:  

$$
h(x) := \min(\mathbb D_f(x, \bar x | v), 0)  - \langle  v, x - \bar x\rangle - f(\bar x). 
$$

The reader should convince yourself in your head that $f(\bar x) = h(\bar x)$ and $f(x) \ge h(x)$. 
Next, we need to show the equivalent between the condition $v \in \hat \partial f(\bar x)$ and $v = \nabla f(\bar x)$. 
The proof is similar to what we had for the previous proof. 


---
### **Testing out the Regular Subgradient** 

In this section let's just make sure that the definition of a regular subgradient is consistent with what we had learned from before. 


#### **Claim | Regular Subgradient Reduces to Convex Subgradient when Function is Convex**
> When $f$ is convex, proper and lsc, then $\hat \partial f = \partial f$ where $\partial f$ here denotes the convex subgradient. 

**Proof**

This is direct since when $f$ is convex, we have $\mathbb D_f(x, \bar x | v) \ge 0$ for all $v$, all $\bar x \in \text{ri.}\text{dom}(f)$. 
The little-o term is gone. 


#### **Theorem 1 | Characterizing Subgradient by Dini Hadamard Subderivatives**
> If $\bar x \in \text{dom}(f)$ then $\hat \partial f(\bar x) = \{v\in \mathbb R^n : \langle v, w\rangle \le df(x)(w) \;\forall w \in \mathbb R^n\}$. 

**proof**

See [Variational Subderivatives](Non-Smooth%20Calculus/Variational%20Subderivatives.md) for more information. 

#### **Theorem 2 | Regular Subgradient is Dense for L.S.C Functions**
> L.S.C functions has dense regular subgradient. 
> Let $f : \mathbb R^n \mapsto \mathbb{\bar R}$, then for all $\epsilon > 0$, there exists $y \in x_0 + \epsilon \mathbb B$ such that $\hat \partial f(y) \neq \emptyset$ and $f(x_0) - \epsilon \le f(x) \le f(x_0)$. 

**Proof**

#UNFINISHED. 

#### **Thereom 3 | Sufficient Conditions for Differentiability**
> If $\hat\partial f(\bar x) \neq \emptyset$  and $\hat \partial [-f](\bar x) \neq \emptyset$, then the function $f$ is differentiable at $\bar x$. 

**Proof**

For all $x \in \R^n$ the definition has: 

$$
\begin{aligned}
    v \in \hat\partial f(\bar x) \iff 
    f(x) - f(\bar x) - \langle v, x - \bar x\rangle 
    & \ge 
    o(\Vert x - \bar x\Vert)
    \\
    u \in \hat\partial [-f](\bar x) \iff 
    - f(x) + f(\bar x) - \langle u, x - \bar x\rangle 
    & \ge 
    o(\Vert x - \bar x\Vert)
\end{aligned}
$$

the sum of the expression yield for all $x \in \R^n$
$$
    -\langle u + v, x - \bar x\rangle \ge o(\Vert x - \bar x\Vert). 
$$
We can show $u = v$. 
Let $x = \bar x + \tau(u - v)$ then the above is: 

$$
\begin{aligned}
    0 &\le o(\tau) - \langle u + v, \tau(u - v)\rangle
    \\
    &= o(\tau) - \tau \Vert u + v\Vert^2
    \\
    \iff 
    0 &\le o(\tau)/\tau - \Vert u + v\Vert^2. 
\end{aligned}
$$

Take limit as $\tau \searrow 0$, $0 \le - \Vert u + v\Vert^2$. 
With the the original condition a substitution of $u = -v$ it becomes: 

$$
\begin{aligned}
    f(x) - f (\bar x) - \langle v, x- \bar x\rangle & \ge o(\Vert x - \bar x\Vert), 
    \\
    -f(x) + f (\bar x) + \langle v, x- \bar x\rangle & \ge o(\Vert x - \bar x\Vert)
    \\
    \implies 
    |f(x) - f(\bar x) - \langle v, x - \bar x\rangle | &\le o(\Vert x - \bar x\Vert). 
\end{aligned}
$$

Then the last line we have the definition of Frechet derivative. 
It's now proved and $f$ is Frechet Differentiable at $\bar x$. 



---
### **Basic Theorems for Regular Subgradient**

One of the most basic rule for subgradients is the sum rule. 

#### **Theorem | Smooth nonsmooth sum rule of regular subgradient**
> Let $F = f + g$. 
> Suppose that $f:\R^n \rightarrow \R$ is differentiable at $\bar x$. 
> $g$ has regular subgradient $\partial g(\bar x)\neq \emptyset$. 

**Proof**

From Theorem 1, and the property of Dini-Hadmard subderivative it has if $v \in \hat \partial F(\bar x)$: 

$$
\begin{aligned}
    (\forall w \in \R^n)\; 
    \langle v, w\rangle \le dF(\bar x)(w) = df(\bar x)(w) + dg(\bar x)(w)
    = \langle \nabla f(\bar x), w\rangle + dg(\bar x)(w). 
\end{aligned}
$$

Since this is true for all $w$, we have equaliy $\hat \partial F(\bar x) = \nabla f(\bar x) + \hat \partial g(\bar x)$. 


---
### **Examples**

We introduce some non-convex examples of regular subgradient. 

#### **Example | Negative Absolute Value**
> Consider $f(x) = - |x|$. 
> Then $\hat \partial f(0) = \emptyset$. 

**Demonstrations**

Using the theorem we had, we have 

$$
\begin{aligned}
    df(0 | w) &= - |w| \ge v w \quad \forall w \in \mathbb R^n
    \\
    \implies - \frac{|w|}{|w|} &\ge v \text{ sign}(w)
\end{aligned}
$$
And from above we would have $-1 \ge v$ and $-1 \ge -v$, which is impossible for all values of $v \in \mathbb R$, therefore the regular subgradient is zero at that point. 


**Remarks**

However, there are regular subgradient whenever $x \neq 0$, but it suddenly vanished at the point $x = 0$. 
This raises concern and mathematicians try to address that as well using the ideas of limiting subgradient. 
See [Limiting Subgradient](Non-Smooth%20Calculus/Limiting%20Subgradient.md) for more information. 
Obviously, we would also have that $\hat \partial f(\bar x) \neq \hat \partial [-f](\bar x)$. 