prereq: [[Calculus of Residue]], [[Identifying Type for Singularity]]
And in this file, we are going to how to actually compute it, demonstrated with some examples, and then we will apply for some special type of real integrals. 

---
### **Intro**

previously on the method of residue we derived 

$$
\oint_Cf(z)dz = 2\pi i\sum_{n = 1}^N \text{Res}(f, z_n).
$$

However, the evaluation for the residual at isolated singularities will use the Laurent Series of the function because the residual needs a series centered at the poles and the coefficient $a_{-1}$ is needed. We introduce some cool tricks in this file to compute the residual for the function at points faster and easier. 

---
### **Shortcut | For Simple Pole**

**Trick**
> When $z_0$ is a simple pole of the function $f$, the residue is calculated by the limit $\lim_{z\rightarrow z_0}(z - z_0)f(z)$.


**Proof**

Ny the fact that we have a simple pole, the series power for $z - z_0$ goes to $-1$ for the lowest, the Laurent series is then given by: 

$$
\begin{aligned}
	\sum_{n = -1}^{\infty}a_{n}(z - z_0)^n. 
\end{aligned}
$$

we consider the limit 

$$
\begin{aligned}
	\lim_{z \rightarrow z_0}(z - z_0)f(z) 
	&= \lim_{z\rightarrow z_0} (z - z_0)\sum_{n = -1}^\infty a_n(z - z_0)^n
	\\
	&= \lim_{z\rightarrow z_0}\sum_{n = -1}^\infty a_n(z - z_0)^{n + 1} 
	\\
	&= \lim_{z\rightarrow z_0}\sum_{n = 0}^\infty a_{n - 1}(z - z_0)^{n}
	\\
	&=
	\lim_{z\rightarrow z_0} a_{-1} + \sum_{n = 1}^\infty a_{n - 1}(z - z_0)^n
	\\
	&= a_{-1} = \text{Res}(f, z_0). 
\end{aligned}
$$

and we are done. 

---
### **ShortCut | Higher Order Poles**

**The Trick**
> Let $z_0$ be an isolated pole for $f$ with order $N$, then the residue of the function at $z_0$ can be calculated by 
> $$
> \lim_{z \rightarrow z_0} (N- 1)!
> \frac{d^{N-1}}{dz^{N-1}}\left[
> (z - z_0)^Nf(z)
> \right] = a_{-1} = \text{Res}(f, z_0). 
> $$
> To memorize, the inner term $(z - z_0)^N$ "desingularize" the principal parts of the Laurent series, the derivative reduces the series to reveal the term with $N - 1$ power to be the constant in the analytical part, and the term $(N - 1)!$ cancles out the additional constant created by the differentiation. 

**Proof**

Lauren series expended at $z_0$, and then we do surgery on it. Observe the following sequences of steps. 

$$
\begin{aligned}
	f(z) &= \sum_{n = -N}^\infty a_{n}(z - z_0)^n 
	\\
	(z - z_0)^Nf(z) 
	&= 
	\sum_{n = -N}^\infty a_{n}(z - z_0)^{n + N}
	\\
	&= \sum_{n = 0}^\infty a_{n - N}(z - z_0)^{n}
\end{aligned}
$$

Consider derivativethe $N - 1$ th derivative on the above desingularized series, which yield:  

$$
\begin{aligned}
	\frac{d^{N - 1}}{dz^{N - 1}}(z - z_0)f(z)
	&= 
	\frac{d^{N-1}}{dz^{N-1}} \left(
		\sum_{n = 0}^\infty a_{n - N}(z - z_0)^{n} 
	\right)
	\\
	&= 
	\sum_{n = N - 1}^\infty 
	n!a_{n - N}(z - z_0)^{n - N + 1} 
	\\
	&= (N - 1)!a_{-1} + \sum_{n = N}^{\infty} n!a_{n - N}(z - z_0)^{n - N + 1}
	\\
	\implies 
	\frac{d^{N - 1}}{dz^{N - 1}}\frac{(z - z_0)f(z)}{(N - 1)!}
	&=
	a_{-1} + \frac{1}{(N - 1)!}\sum_{n = N}^{\infty} n!a_{n - N}(z - z_0)^{n - N + 1}
	\\
	\lim_{z\rightarrow z_0}\frac{d^{N - 1}}{dz^{N - 1}}\frac{(z - z_0)f(z)}{(N - 1)!}
	&= a_{-1} = \text{Res}_{f}(z_0). 
\end{aligned}
$$



---
### **No Shortcut | Essential Singularity**

Haha no short cut good luck finding the Laurent series. To apply the above methods, simply find out the type of singularities using the documents in the prereq for a given function, and then try these method above, when we have an isolated singularity that has finite order to it. 
