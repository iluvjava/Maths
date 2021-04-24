[[Laplace Transform Generalized]]

We learn how to use the Laplace Transform on the previous 2 series, and here, we will be solving the Drunken Sailor Problem using the Laplace Transform. 

---
### **Intro**

The drunken sailor problem is the following PDE:

$$
\begin{cases}
    \partial_t [u](x,t) = \partial_x^2[u](x, t) & x \in \mathbb{R}, t > 0
    \\
    u\rightarrow 0 \text{ as } |x|\rightarrow \infty
    \\
    u(x, 0) = \delta (x)
\end{cases}
$$

We are going to consider the Laplace Transform in time. 

So the laplace transform will be in $t$ instead of in $x$, this is **GOOD** because the solution funciton $u$ is one sided in time!

---
### **Laplace Transform on the Drunken Sailor**

given $u(x,t)$ as a on sided function in $t$. 

def: 

$$
\widetilde{u}(x,s) = \mathcal{L}[u](x, s) = 
\int_{0}^{\infty} 
    u(x, t)\exp \left(
        -st
    \right)
dt
\tag{1}
$$

We also need to figure out the quantities: $\mathcal{L}[\partial_t[u]]$ and $\mathcal{L}[\partial_x^2[u]]$. 

$$
\mathcal{L}[\partial_t[u]] = 
\int_{0}^{\infty} 
    \partial_t[u] \exp(-st)
dt
\tag{2}
$$

Using integration by parts we have: 

$$
u\exp(-st)|_{0}^{\infty} + 
s \int_{0}^{\infty} 
    u\exp(-st)
dt = \lim_{t\rightarrow \infty}(u\exp(-st)) -u(x, 0) + s \tilde{u}(x, s)
\tag{3}
$$

As $t\rightarrow \infty$, it doesn't go to infinite, because, it depends on $s$. If $s$ is purely imaginary. $u$ will decay, but it's only for $s$ value goes to positive infinity not for the $t$ value. 

We got stuck. 

We do a thing call: "Informal method" and make an assumption about the solution, just like the Fourier Trnasform, and the assumption is: 

$$
u \exp \left(
-st
\right)\rightarrow 0 \text{ as } t \rightarrow \infty
\tag{4}
$$

And when we do this, we will have toe be careful to **check this conditions** after getting the solution by the end. 

Boom then continue from expression (2), (3) we have: 

$$
\widetilde{u}_t = \mathcal{L}[\partial_t[u]](x, s) = -u(x, 0) + s\tilde{u}(x,s) = -\delta (x) + s \tilde{u}(x, s)
\tag{5}
$$

Notice that, because $\partial_t[u]$ has nothing to do with the $t$, then the Laplace of $u_{xx}$ is just going to be: 

$$
\mathcal{L}[\partial_x^2[u]](x,s) = \partial_x^2[\mathcal{L}[u]](x,s) = \partial_x^2[\widetilde{u}](x,s)
\tag{6}
$$

Then at this rate, we will be ablve to get the PDE under the Laplace Space, with the assumption from the informal method. Giving us: 

$$
-\delta (x) + s\tilde{u} = \partial_x^2[\widetilde{u}](x,s)
$$

$$
\implies \partial_x^2[\tilde{u}] - s \tilde{u} = -\delta(x)
\tag{7}
$$

This is a Non-homogenous, second order, ODE in terms of $x$. 

**Note** The Dirac Delta functions is almost all zeros. hence, (7) can be turned into a homogenous ODE, for a log of value of $x$. This means that, we can discuss by cases depending on the quantity for $x$, let's consider that: 

$x > 0, x < 0$, we have: 

$$
\implies \partial_x^2[\tilde{u}] - s \tilde{u} = 0
$$

Which is a homogenous ODE, and it's giving us: 

$$
\widetilde{u}(x, s) = A \exp \left(
-\sqrt{s}x
\right)
+ 
B 
\exp \left(
    \sqrt{s}x
\right)
\tag{8}
$$

If the original function decays to zero as $x\rightarrow \infty$ goes to infinity, then the same thing is happening for $\tilde{u}$ too. This means that: 

**Note**: $s$ is complex[^1]. Because of the **Branch Cut**, we are going to use one of them, let's say that we are choosing $\Re(\sqrt{s}) > 0$, then the exponent with $B$ is blowing up as $x\rightarrow \infty$. 

Then that means: 

$$
\tilde{u}(x, s) = A \exp \left(
-\sqrt{s}x
\right)
\tag{9}
$$

Now, we are going to consider the other case where $x\rightarrow -\infty$, and the corresponding ODE solution has the same format compare to the previous
case, giving us: 


[^1]: [[Laplace Transform Generalized]], we show that inverse Laplace has $s$ going around in the complex plane. 