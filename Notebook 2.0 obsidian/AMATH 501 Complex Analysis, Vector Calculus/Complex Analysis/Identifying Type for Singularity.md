prereq: [[Types of Singularities]]. A basic understanding for Singularity is needed for the discussion. 

---
### **A Fact**
Assuming that the function as a Pole (Isolated Singularity) with order $n$ at $z_0$ (not Essential Singularity), then the following statement regarding the function and the Pole is true: 

> $$ 
> \underset{n}{\text{argmin}}
\left(\lim_{z \rightarrow z_0} (z - z_0)^n f(z) < \infty \right)
> $$

Where $n$ is the *minimum positive integer needed* such that the limit of the expression exists as a finite number. 

#### **Remark**

When evaluating the limit, it's really common to use the Lopital's Rule for the evaluation of the fraction, if it's in the undetermined form. 

---
### **Example-1 | $\tan(z)$**

Consider the poles of the function $\tan(z)$ they are points where function value goes to infinite, they can be represented by $z_n = \frac{\pi}{2} + n\pi$. Is it a simple pole? Consider

$$
\begin{aligned}
    \lim_{z \rightarrow z_n} \frac{(z - z_n)\sin(z)}{\cos{z}} 
    &= \lim_{z \rightarrow z_n} \frac{(z - z_n)\cos(z) + \sin(z)}{-\sin(z)} \quad \text{ By Lopital
    }
\end{aligned}
$$

Now, we substitute in the $z_n$, notice that we have: $\sin(z_n) = \pm 1, \cos(z_n) = 0$, so the above evaluates to $\mp 1$, which is bounded. Therefore, $z_n$ are all simple poles for the function $\tan(z)$. 


---
### **Example-2 | A Trickier One**

Consider: 

$$
\frac{\cos(z)}{(z - \pi/2)^4}, 
$$

and we want to know that pole at $\pi/2$. Inertial in thoughts will let us take the guess that it's a 4th order pole because multiplying it by $(z - \pi/2)$ will give us a limit that evaluates to a constant ($0$ in this case). However, $n = 4$ is incorrect because it's not the smallest we can get. Please consider using Lopitals rule that
$$
\lim_{z \rightarrow \pi/2} \frac{\cos(z)}{(z - \pi/2)^4}=
\lim_{z\rightarrow \pi/2} \frac{-\sin(z)}{4(z - \pi/2)^3} = \infty
$$

After the Lopital's rule, we may multiply by $(z - \pi/2)^3$ and evaluate the limit to $-1/4$. So... This means that this limit is going to exists if I multiply the expression at hand with $(z - \pi/2)^3$, which means that: 

$$
\lim_{z \rightarrow \pi/2} \frac{\cos(z)}{(z - \pi/2)} = \lim_{z\rightarrow \pi/2} \frac{-\sin(z)}{1} = 0.
$$

And limit exists and it's finite, and hence that point is a 3rd order pole for the function. 


### Comment

Laurent Series expanded at the point $z_0 = \pi/2$ is going to give us the same answer. But sometimes this route can be harder than in this case. 