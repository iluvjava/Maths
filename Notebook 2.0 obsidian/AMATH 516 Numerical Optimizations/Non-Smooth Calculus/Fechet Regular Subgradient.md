---
alias:Regular Subgradient
---
- [Subgradient Intro](Subgradient%20Intro.md)

---
### **Intro**
Recall from the prerequisites of this document that the convex subgradient is not sufficient to describe the functions when it's non convex. 
Under simple cases where the function is non-convex, the convex subgradient doesn't reduces to the ordinary gradient for differentiable functions. 
This motivates the definition and discussion for regular subgradient. 

Let $f : \mathbb R^n \mapsto \mathbb{\bar R}$. 
Let $v \in \hat \partial f(\bar x)$. 
Let $\bar x \in \text{dom}(f)$. 
Suppose that we take some $x \in \bar x + \epsilon \mathbb B$, some point $x$ that is very close to the point $\bar x$ where we evaluated our regular subgradient. 
One interpretation on the definition of regular subgradient is the inequality 

$$
f(x) - f(\bar x) - \langle v, x - \bar x\rangle  \ge o(\Vert x - \bar x \Vert). 
$$

This relaxes the definition of a convex subgradient by replacing $o(\Vert x - \bar x\Vert) = 0$. 
Obviously any function where convex $\partial f(\bar x) \neq  \emptyset$ would mean that $\hat \partial f(\bar x) \neq \emptyset$. 
The small $o$ term measures how far away is $f$ from a convex function locally. 
But this is not the full picture. 
Recall that 

$$
v \in \hat \partial f(\bar x) \iff 
\liminf_{x\rightarrow \bar x} 
\frac{f(x) - f(\bar x) - \langle v, x - \bar x\rangle}{\Vert x - \bar x\Vert} \ge 0. 
$$


The use of liminf allows for the choice of the smallest value of $f(x) - f(\bar x) - \langle v, x - \bar x\rangle$ around $\bar x$. 
For convex function however, the use of $\liminf, \lim, \limsup$ would all be equivalent. 
This part differs from the definition of a convex subgradient. 
For the easy of notation we consider denoting the second order information of the function using the notation:

$$
\begin{aligned}
    \mathbb D_f(x, \bar x | v) = f(x) - f(\bar x) - \langle v, x - \bar x\rangle. 
\end{aligned}
$$

Please compare this quantity to [Bregman Divergence](Bregman%20Divergence.md), and see that this is a generalization of a Bregman Divergence to function that are not necessarily differentiable. 
With this we may also represent a differentiable function (See [Frechet, Gateaux Differentiability Euclidean Space](../../MATH%20000%20Math%20Essential/Analysis/Frechet,%20Gateaux%20Differentiability%20Euclidean%20Space.md)) in a way similar to the definition of the regular subgradient. 
Let $f : \mathbb R^n \mapsto \mathbb {\bar R}$ be a differentiable at $\bar x \in \mathbb R^n$ if and only if there exists $v \in \mathbb R^n$ such that 

$$
\begin{aligned}
    o(\Vert x  - \bar x\Vert)
    & \le 
    \mathbb  D_f(x, \bar x| v) \le o(\Vert x - \bar x\Vert)
    \\
    \iff 
    \lim_{x \rightarrow \bar x} \frac{ \mathbb D_f(x, \bar x | v)}{\Vert x -\bar x\Vert}
    &= 0
    \\
    \iff 
    \liminf_{x \rightarrow \bar x} 
    \frac{ \mathbb D_f(x, \bar x | v)}{\Vert x -\bar x\Vert} &= 
    \limsup_{x \rightarrow \bar x} 
    \frac{ \mathbb D_f(x, \bar x | v)}{\Vert x -\bar x\Vert} = 0
\end{aligned}
$$

We know define the regular subgradient. 
We already did in the introduction but we will do it again here using the new notations. 

#### **Definition | Regular Subgradient**
> $v \in \hat \partial f(\bar x)$ is a subgradient if and only if 
> $$
>   \liminf_{x \rightarrow \bar x} \frac{\mathbb D_f(x, \bar x | v)}{\Vert x - \bar x\Vert} \ge 0. 
> $$


#### **Claim | Second Order Lower Model**
> Let $v \in \hat \partial f(\bar x)$, if and only if there exists $\varphi(x - \bar x)$ such that $\mathbb D_f (x, \bar x | v) \ge \varphi(x - \bar x)$ and $\nabla \varphi (\bar x) = \mathbf 0$. 

**Proof**

For the $(\implies)$ direction, consider $v \in \hat \partial f(\bar x)$. 
From the definition of regular subgradient, we have that $\mathbb D_f(x, \bar x, | v) \ge o(\Vert x - \bar x\Vert)$, therefore choosing any function $\var phi$ such that $\varphi (x - \bar x) = o(\Vert x - \bar x\Vert)$ would statisfies: 

$$
\begin{aligned}
    \lim_{x \rightarrow \bar x} \frac{\varphi (x - \bar x)}{\Vert x - \bar x\Vert} &= 0 \iff \nabla \varphi(x - \bar x) = \mathbf 0. 
\end{aligned}
$$

For the $(\impliedby)$ direction, we consider $\varphi(x - \bar x) = \min(\mathbb D_f(x , \bar x | v), 0)$.
This is a valid candidate because $\mathbb D_f(x, \bar x | v) \ge \varphi(x - \bar x)$ by its definition. 
Next, consider

$$
\begin{aligned}
    \nabla \varphi(x - \bar x) &= \mathbf 0 
    \\
    \iff
    \lim_{x \rightarrow \bar x} \frac{\varphi(x - \bar x)}{\Vert x - \bar x\Vert}
    &= \min\left(
        \lim_{x \rightarrow \bar x} 
        \frac{\mathbb D_f(x, \bar x | v)}{\Vert x - \bar x\Vert} , 0
    \right) = 0
    \\
    \implies
    \liminf_{
            \substack{
                x\rightarrow \bar x 
                \\
                x \neq \bar x
            }
        } \frac{\varphi(x - \bar x)}{\Vert x - \bar x\Vert}
    &= \min\left(
        \liminf_{
            \substack{
                x\rightarrow \bar x 
                \\
                x \neq \bar x
            }
        } 
        \frac{\mathbb D_f(x, \bar x | v)}{\Vert x - \bar x\Vert} , 0
    \right) = 0
    \\
    \implies 
    \liminf_{
        \substack{
                x\rightarrow \bar x 
                \\
                x \neq \bar x
            }
        } 
        \frac{\mathbb D_f(x, \bar x | v)}{ \Vert x - \bar x\Vert} &\ge 0 \iff v \in \hat \partial f(\bar x). 
\end{aligned}
$$

One the first line we used the hypothesis that the gradient of $\varphi(x - \bar x) = \mathbf 0$
On the second line we take the limit and dividing by nonzero quantity $\Vert x - \bar x\Vert$. 
The limit moves in because $\min(x, 0)$ is a continuous function. 
Next, the existence of the limit implies that existence of minimal subsequantial limit and therefore we exchange $\lim$ for $\liminf$. 
Finally, since $\min(\cdot, 0) = 0$ for the subsequential limit, it means the other term inside of it must have a positive limit. 

**Remarks**

The above characterization is equivalent to the definition of regular subgradient. 

#### **Claim | Differentiable Lower Bounding Functions**
> $v\in \hat \partial f(\bar x)$ if and oly if there exists $h : \mathbb R^n \mapsto \mathbb R$ such that $h$ is differentiable at $\bar x$ with $f(x) \ge h(x), f(\bar x) = h (\bar x)$ and $\nabla f(\bar x) = v$. 

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

This is direct since when $f$ is convex, we have $\mathcal D_f(x, \bar x | v)$ for all $v$, all $\bar x \in \text{dom}(f)$. 
The little-o term is gone. 


#### **Claim | Characterizing Subgradient by Dini Hadamard Subderivatives**
> If $\bar x \in \text{dom}(f)$ then $\hat \partial f(\bar x) = \{v\in \mathbb R^n | \langle v, w\rangle \le df(x | w) \forall w \in \mathbb R^n\}$. 

**proof**

See [Variational Subderivatives](Non-Smooth%20Calculus/Variational%20Subderivatives.md) for more information. 

#### **Thm | Regular Subgradient is Dense for L.S.C Functions**
> L.S.C functions has dense regular subgradient. 
> Let $f : \mathbb R^n \mapsto \mathbb{\bar R}$, then for all $\epsilon > 0$, there exists $y \in x_0 + \epsilon \mathbb B$ such that $\hat \partial f(y) \neq \emptyset$ and $f(x_0) - \epsilon \le f(x) \le f(x_0)$. 

**Proof**

#UNFINISHED. 

#### **Thm | Sufficient Conditions for Differentiability**
> If $\hat\partial [f](\bar x) \neq \emptyset$  and $\hat \partial [-f](\bar x) \neq \emptyset$, then the function $f$ is differentiable at $\bar x$. 

**Proof**

We list out the conditions by the definition of variational subgradient: 

$$
\begin{aligned}
    v \in \hat\partial [f](\bar x) \iff 
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

the sum of the expression yield $-\langle u + v, x - \bar x\rangle \ge o(\Vert x - \bar x\Vert)$. 
By the fact that this is true for all $x - \bar x$, setting $x - \bar x$ by $tw$, then $w \in \mathbb R^n$ could be arbitrary vector of $\mathbb R^n$. 
In this sense we have $- t\langle u + v, w\rangle \ge o(\Vert w\Vert)$. 
Dividing both side by $\Vert w\Vert$ it would have $-t\langle u + v, w/\Vert w\Vert\rangle \ge 0$ for all $w \in \mathbb R^n$. 
And it could only happen if $u + v = \mathbf 0$ because $w, -w$ will force the inequality to be equality. 
With the the original condition a substitution of $u = -v$ transforms it: 

$$
\begin{aligned}
    f(x) - f (\bar x) - \langle v, x- \bar x\rangle & \ge o(\Vert x - \bar x\Vert) \quad [(1)]
    \\
    -f(x) + f (\bar x) + \langle v, x- \bar x\rangle & \ge o(\Vert x - \bar x\Vert)\quad 
    [(2)]
    \\
    [(2)]
    \iff 
    f(x) - f(\bar x) - \langle v, x - \bar x\rangle &\le o(\Vert x - \bar x\Vert)
    \\
    [(1)] \wedge [(2)]\implies 
    | f(x) - f(\bar x) - \langle v, x - \bar x\rangle | &\le o(\Vert x - \bar x\Vert), 
\end{aligned}
$$

and at the last line we have the definition of Frechet derivative. 
Hence the claim has been proven. 

---
### **Basic Theorems for Regular Subgradient**



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