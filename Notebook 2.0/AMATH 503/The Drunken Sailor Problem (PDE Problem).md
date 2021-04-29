Here, we will apply the Fourier Transform on solving a PDE problem, and this problem is derived in chapter 2 of the textbook. 
[[Solving PDE in Infinite Domain]]
This is another example of solving PDEs with infinite boundary conditions. 

---

### **Intro**

Here is the PDE formulation of the PDEs for the Drunken Sailor Problem: 

$$
\begin{cases}
    \partial_t u = \alpha^2\partial_x^2 u & x \in \mathbb{R} \quad t > 0
    \\
    \lim_{x\rightarrow \pm\infty} u = 0 & \forall t
    \\
    u(x, 0) = \delta (x)
\end{cases}
\tag{1}
$$

And the function $\delta(x)$ here is the Dirac Delta function. This is a pretty famous function here. And it's activated on $x = 0$. It has the property that: 

$$
\int_{-\infty}^{\infty}\delta(x)dx = 1 \quad 
\int_{\infty}^{\infty}\delta f(x)dx = F(0)
\tag{2}
$$

This function can be viewed as a limit of the square activation function. 

$$
\delta(x):=
\lim_{\epsilon \rightarrow 0}\begin{cases}
    \frac{1}{\epsilon} & x\in (\frac{\epsilon}{2}, \frac{\epsilon}{2})
    \\
    0 & \text{else}
\end{cases}
\tag{3}
$$

**Physical Scenario of the Drunken Sailor:** 

The sailor is drunken and he has equal probability of going to the right, or going to the left. In a continuous manner. 

**What does the function $u(x,t)$ represent?**

It represent the probability density of the location of the sailor. 

This is also called the: "Random Walk problem" and the delta function is literally modeling each of the partile in the heat conduction problem. 
 
**What is the probability of presence given the location?**

$$
\mathbb{P}\left(\text{at }x, t\right) = 
\Delta x u(x, t)
$$

So that is the tiny integral on that little interval... So we need to take the limit as $\Delta t, \Delta x$ approaches $0$. In that case, the motion of the sailor will be continuous, and we will have PDF instead of CDF. 

---
### **Solving this**

**Important Notes**

> We will be avoiding the technique we introduced last time because it has a lot of mathematical subtleties to it, and we skipped those in the example, here we will be focusing on another way, a better way of solving PDEs on the fininite domain. **This new technique exposes some of the underlying assumptions for [[Solving PDE in Infinite Domain]]

Let's define solution under the fourier space like: 

$$
\hat{u}(w, t) = \mathcal{F}[u](w, t) = \int_{-\infty}^{\infty} 
    u(x, t)\exp\left(
        iwx
    \right)
dx
\tag{4}
$$

There is no reason to believe that we can do this at all, because we can assert that the fourier foruier transform of the function is going to be converging to something.

However, using similar reasoning frothe last time we have: 

$$
\mathcal{F}[\partial_t u](w, t) = \partial_t[\hat{u}](w, t)
\tag{5}
$$

And if we were to apply the forier transform on $u(x, t)$, then we will have to use integration by parts, and that will give us some results like this: 

$$
\mathcal{F}[\partial_{x}^2[u]](w, t) = (iw)^2\hat{u}
$$

#### **Exposing Underlying Assumptions**

From (4) we know that function $u$ can be fourier transformed on the infinite domain, and hence it will be aboslutely integrable on all real, (very stric, and there are looser assumptions to be made here). 

Now, let's take a loot at what expression (5) is going to imply for the solution we get for the PDE, by taking the fourier Transform of the second spatial derivative: 


$$
\mathcal{F}[\partial_x^2[u]](w, t) = \int_{-\infty}^{\infty} 
    \partial_x^2 [u](x, t)\exp\left(
        iwx
    \right)
dx
\tag{6}
$$

Let's use the integration by parts, and in that case it will be giving us: 

$$
\left.\partial_x[u](x, t)\exp\left(
    iwx
\right)\right|_{-\infty}^{\infty }
-
\left[
        iwu(x,t)\exp\left(
            iwx
        \right)       
    \right|_{-\infty}^{\infty }
+
(iw)^2
\int_{-\infty}^{\infty} 
    u(x, t)\exp\left(
        iwx
    \right)
dx
\tag{7}
$$

In order for this integral to be converging, the limit on 2 terms at the front **must approaches zero**. This implies that at least, the derivative of the solution function, and the original funciton has to approach zero, like, pretty fast. This is like the **boundary conditions** asserted by the Fourier Transform whenever we used it for solving the PDE problem. 

**Applying the Fourier Transform** on expressio one, we have: 

$$\hat{u}(w, t) = -\alpha^2\omega^2 \hat{u}(w,t)\tag{8}
$$

Solving the above ODE yields: 

$$
\hat{u}(w,t) = \hat{u}(w, 0)\exp\left(
    -\alpha^2w^2t
\right)
\tag{9}
$$

The initial condition says that:

$$
\hat{u}(w, 0) = \mathcal{F}[u(x, 0), x](w, t) =  \int_{-\infty}^{\infty} 
    \delta(x)\exp\left(
        iwx
    \right)
dx = 1
\tag{10}
$$

This is by the definition of the delta function. 

The solution under the Fourier domain is going to be: 

$$
\hat{u}(w,t) = \exp \left(
-\alpha^2w^2t
\right)
\tag{11}
$$

Taking the inverse fourier transform of this function will give use the solution of this problem. 

$$
\mathcal{F}^{-1}[\hat{u}](x, t) = \mathcal{F}^{-1}\left[
        \exp \left(
        -\alpha^2 w^2t
        \right)
    \right](x, t)
= 
\frac{1}{2\pi}
\int_{-\infty}^{\infty} 
    \exp \left(
        -\alpha^2w^2t - iwx
    \right)
dx
\tag{12}
$$

Now, the next thing is to solve this integral, and remember from the Gaussian Integral, which we have tried here: [[Application of Fourier Transform (PDE Flavor)]]

The integral of the solution turns out to be: 

$$
u(x,t) = 
\frac{1}{\sqrt{4\pi \alpha^2 t}}\exp \left(
-\left(
    \frac{x}{\sqrt{4\alpha^2 t}}
\right)^2
\right)
\tag{13}
$$

With long enough, we will lose track of where the Sailer is going to be, but the integral over the domain is still doing to be 1, because it's... PDF remember? 

---
### **Drunken Sailor in Higher Dimension**

In 2D the drunken Sailor problem is going to be like: 

$$ 
\begin{cases}
    \partial_tu &= \alpha^2(\partial_x^2u + \partial_y^2u)
    \\
    u&\rightarrow 0 \text{ as } x\rightarrow \pm\infty
    \\
    u(x, y, 0) &= \delta(x)\delta(y)
\end{cases}
$$

And notice that, the Dirac Delta functions is used here, in the 2D Sencario. 

Ok, when we take the Fourier Transform, we are going to wrt to different variable, depending on what we are dealing with.

Let's, first define how the heck we take the Fourier Transform wrt to variables. Which is going to be like: 

$$
\mathcal{F}_x\left[
        \mathcal{F}_y[u]
    \right](w_1, w_2, t)
=
\mathcal{F}_{xy}[u](w_1, w_2, t)
=
\int_{\infty}^{\infty}
\int_{\infty}^{\infty}
    u(x, y, t)\exp \left(
    iw_1y
    \right)
    \exp \left(
    iw_2x
    \right)
dydx
\tag{14}
$$

Similarily, we can take Inverse Fourier Transform and stuff like that. 

For the derivative on the PDE, the nested Fourier Transform is actually: 

$$
\mathcal{F}_{xy}[\partial_t[u]](w_1, w_2, t)
=
\partial_t[\hat{u}](w_1, w_2, t)
\tag{15}
$$

We can take out the time derivative operator that is nested inside the Fourier Transform Operator. 

Similarly we have: 

$$
\mathcal{F}_{xy}[\partial_x^2[u]](w_1, w_2, t)
=
(iw_1)^2 \hat{u}(w_1, w_2, t)
\tag{16}
$$

And: 

$$
\mathcal{F}_{xy}[\partial_y^2[u]](w_1, w_2, t)
=
(iw_2)^2 \hat{u}(w_1, w_2, t)
\tag{17}
$$

Which is just simple integration by parts with some **Assumptions** about the boundary conditions of the solution types. 

Now, applying the Fourier Transform on the PDE for both direction, we have: 

$$
\partial_t[\hat{u}](w_1, w_2, t) = -\alpha^2(w_1^2 + w_2^2)\hat{u}(w_1, w_2, t)
\tag{18}
$$

Solving the ODE system here, we will have: 

$$
\hat{u}(w_1, w_2, t) = u(w_1, w_2, 0)\exp \left(
-\alpha(w_1^2 + w_2^2)t
\right)
\tag{19}
$$

Boom we are ready to use the Initial Conditions for the solution and get the full solutions of the PDE. 

$$
\mathcal{F}_{xy}[u, t = 0] = \mathcal{F}_x[\delta] \mathcal{F}_y[\delta] = 1\times 1
\tag{20}
$$

And then the solution in the Fourier Domain is like: 

$$
\hat{u}(w_1, w_2, t) = \exp\left(
-\alpha(w_1^2 + w_2^2)t
\right)
$$

Now we are ready for the Inverse Fourier Transform, and it's like: 

$$
\mathcal{F}^{-1}_{xy}[\hat{u}] = \mathcal{F}^{-1}_x \left[
        \exp \left(
            -\alpha^2w_1^2t
        \right)
    \right]
    \mathcal{F}^{-1}
    \left[
        \exp \left(
            -\alpha^2w_2^2t
        \right)
    \right]
\tag{21}
$$

So the results are going to be like:  

$$
u(x, y, t) = 
\frac{1}{\sqrt{4\pi \alpha^2t}}\exp \left(
    \frac{-x^2}{4\alpha^2 t}
\right)
\frac{1}{\sqrt{4\pi \alpha^2t}}\exp \left(
    \frac{-y^2}{4\alpha^2 t} 
\right)
\tag{22}
$$

So then combining the results, we have:

$$
u(x, y, t) = 
\frac{1}{4\pi \alpha^2t}\exp \left(
    \frac{-x^2 - y^2}{4\alpha^2 t}
\right)
\tag{23}
$$

And this is the solution for the Drunken Sailor for the 2D scenario.