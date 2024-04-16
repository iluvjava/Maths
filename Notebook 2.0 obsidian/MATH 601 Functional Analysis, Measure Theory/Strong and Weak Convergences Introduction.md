- [Convergence, Completeness in Metric Space](Functional%20Spaces/Convergence,%20Completeness%20in%20Metric%20Space.md)
- [Hahn Banach Theorem and its Corollaries](Hahn%20Banach%20Theorem%20and%20its%20Corollaries.md) 
- [Hilbert Space Introduction](Hilbert%20Space%20Introduction.md)

---
### **Intro**

Let $X$ be Hilbert space. 
So it's a special kind of Metric space. 
Recall that a sequence $x_n$ converges to $x$ in the metric means that $d(x, x_n) \rightarrow 0$ where $d(x, x_n)$ is just a real number. 
This is also referred to as strong convergence in Hilbert space. 
In Hilbert space, strong convergence of $x \rightarrow x$ is equivalent to $\lim_{x\rightarrow \bar x}\Vert x - \bar x\Vert = 0$. 
However, this is not the only mode of convergences in Hilbert space. 
We define weak convergence next.

#### **Def | Weakly Converging Sequence**
> Let $x_n$ be a sequence in $X$ that converges weakly to a point $x$, denote as $x_n \rightharpoonup x$, then for all $v \in X$ we have $\langle x_n, v\rangle\rightarrow 0$. 


**Observations**

A sequence the converges weakly is not a sequence that converges strongly. 
Obviously consider the standard basis vector of $l^2$ with $\e_i$. 
We have $\langle \e_i, v\rangle = v_i$ for all $v_i$, for any $v \in X$. 
Since $v \in X$, we must have the partial sum $\sum_{i = 1}^{n} v_i^2$ to be convergent. 
And therefore $v_i$ is bounded by $\epsilon^2_i$, therefore it converges weakly. 
Also it doesn't converge strongly because it's not Cauchy. 
We have $\Vert \e_i - \e_j\Vert = 1$ for all $i \neq j$. 



**Remarks**

In finite dimension, weak convergence is the same as strong convergence. 


#### **Def | Weak Seqeuentially Closed**
> A set $D \subseteq X$ is a sequential weakly closed set if, for all $x_n \in X$ such that $x_n \rightharpoonup x$, then $x \in D$. 
>



#### **Facts**
> We state a list of useful facts that may be useful. 
> 1. Weak limits if exists they are unique. 
> 2. Strong convergence implies weak convergence. 
> 3. $x_n \rightarrow x \iff (x_n \rightharpoonup x \wedge \Vert x _n \Vert\rightarrow \Vert x\Vert)$
> 4. $x_n \rightharpoonup x$ implies that $x_n$ is a bounded vector. 
> 5. Weak convergence is able to achieve convergence point-wise. Meaning that if $x_n \rightharpoonup y$, then $x_{n, k}\rightarrow y_{n, k}$ for all $k \in \mathbb N$. 
> 6. Every bounded sequence has a weakly convergent subsequence. 


**Remarks**

(6.) is the Bozano Weierstrass theorem manifested in the infinite dimensional Hilbert Space. 

---
### **Theorems**

We prove some theorems about weak convergence. 
They are useful for applying the concepts in various context. 

#### **Thm | The Weak Limit is Unique**
> Let $x_n \rightharpoonup y$ and $x_n\rightharpoonup y$, then $y = z$. 

**Proof**

Consider any $p \in X$, then consider the difference as part of the definition of the weak convergence of the sequence: 

$$
\begin{aligned}
    \langle x_n - z, p\rangle - \langle x_n - y, p\rangle &= \langle y - z, p\rangle
    \\
    \lim_{n\rightarrow \infty}
    \left(
        \langle x_n - z, p\rangle - \langle x_n - y, p\rangle 
    \right)
    &= \langle y - z, p\rangle
    \\
    \lim_{n\rightarrow \infty}\langle x_n - z, p\rangle 
    - \lim_{n\rightarrow \infty}\langle x_n - y, p\rangle 
    &= \langle y - z, p\rangle
    \\
    0 &= \langle y - z, p\rangle, 
\end{aligned}
$$

in which case, we have that $\langle y - z, p\rangle$ for all $p \in X$. 
Therefore $y = z$. 
We can break the limit apart in the above derivation because weak convergence asserts the existence of the limits of both parts. 


#### **Thm | Equivalent Conditions for Strong Convergence**
> Let $x_n \in X$ be a sequence in Hilbert space then$x_n \rightarrow x$ if and onlyif $x \rightharpoonup x$ and $\Vert x_n \Vert\rightarrow \Vert x\Vert$. 

**Proof**

Direction ($\implies$) is direct. 
Because the mapping $\Vert x_n\Vert$ is a continuous mapping, and by property of metric space, the limit would be $\Vert x\Vert$. 
For proving $(\impliedby)$, consider 

$$
\begin{aligned}
    \Vert x_n - x\Vert^2 &= \Vert x_n\Vert - \Vert x\Vert^2 - 2\langle x, x_n\rangle
    \\
    &= 
    \Vert x_n\Vert^2 + \Vert x\Vert^2 - 2(\langle x, x_n - x\rangle + \Vert x\Vert^2)
    \\
    \implies
    \lim_{n\rightarrow \infty} \Vert x_n - x\Vert^2 
    &= 
    \lim_{n\rightarrow \infty}
    \Vert x_n\Vert^2 + \Vert x \Vert^2
    - 2\left(\lim_{n\rightarrow \infty} \langle x, x_n - x\rangle + \Vert x\Vert^2\right)
    \\
    \text{by } & \lim_{n\rightarrow \infty} \Vert x_n\Vert^2 = \Vert x\Vert^2 
    \\
    \implies 
    &= 
    \Vert x\Vert^2 + \Vert x\Vert^2 - 2(0 + \Vert x\Vert^2)
    \\
    &= 0. 
\end{aligned}
$$

therefore, the sequence converges strongly. 



#### **Thm | Convergence of the Dot Product**
> Let $x_n\rightarrow x$ and $y_n \rightharpoonup y$, then $\langle x_n, y_n\rangle\rightarrow \langle x, y\rangle$. 

**Observations**

The dot product between the dot product of 2 weakly converging sequence is not the same as the dot product of the limit of individual weak sequence. 
Observe the counter example that $x_i = y_n = \e_i \rightharpoonup \mathbf 0$, but their dot product would be $\Vert \e_1\Vert = 1$, which is not the dot product of their limits $\langle \mathbf 0, \mathbf 0\rangle = 0$. 

**Proof**

To prove, for this proof we will assume that a weakly converging sequence is bounded. 
This claim is not trivial to show. 
Recall from definition that $x_n\rightarrow x \iff \lim_{n\rightarrow \infty}\langle x_n - x, x_n - x\rangle = 0$. 
And for the weak limit we have $y_n\rightharpoonup y \iff \lim_{n\rightarrow \infty}\langle y_n - y, z\rangle = 0$. 
With that we consider 

$$
\begin{aligned}
    \langle x_n, y_n\rangle
    &= 
    \langle x_n, y_n - y\rangle + \langle x_n, y\rangle
    \\
    &= 
    \langle x_n - x, y_n - y\rangle + \langle x, y_n - y\rangle + \langle x_n, y\rangle
    \\
    &\le 
    \Vert x_n - x\Vert \Vert y_n - y\Vert + 
    \langle x, y_n - y\rangle + \langle x_n, y\rangle
\end{aligned}
$$

takingthe limit, we have the term $\Vert x_n - x\Vert\Vert y_n - y\Vert \rightarrow 0$ because $\Vert x_n - x\Vert\rightarrow 0$ and $\Vert y_n - y\Vert < \infty$. 
The cross term $\langle x, y_n - y\rangle$ is also zero by the weak convergence of $y_n$. 
Therefore, the above expression as limit $\langle x_n, y\rangle\rightarrow \langle x, y\rangle$ by the strong convergence of sequence $x_n$. 


