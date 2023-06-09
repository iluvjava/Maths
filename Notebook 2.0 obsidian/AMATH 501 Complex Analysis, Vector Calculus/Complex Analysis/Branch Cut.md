A way to make make a function legit (Non multi-valued), analytic, so it's easier to deal with. 
- [[Complex Logarithm]]
- [[Complex Functions]]


---
### **Intro**



---
### **Example 1 | Square Root**

Consider the square root of a complex number, which is given by 

$$
\begin{aligned}
    z^{\frac{1}{2}} 
    &= \exp\left(\frac{1}{2}\ln(z)\right)    
    \\
    &=
    \exp\left(\frac{1}{2} \ln|z| + i(n\pi + \text{Arg}(z)) \right), 
\end{aligned}
$$

where $n \in \mathbb{Z}$. Simplifying it we will have a set of solutions

$$
z^{\frac{1}{2}} = \sqrt{|z|}\exp(i\text{Arg(z)})(\pm1).
$$

#### **Looking for Branch Cut**
* Limiting to Principal Angle to eliminate multiple values. 
* Consider paths cross the barrier of the principal angle. 

**Limiting to Principal Angle**

Let's limit the number $z$ by saying that we only allow $z$ to have $\arg(z)$, so that the angle of the number $z$ is in the interval of $[-\pi, \pi]$. 

$$z^{\frac{1}{2}} = \exp\left(\frac{1}{2} \ln|z| + i\arg(z)\right)$$

Which will be giving us: 

$$
z^{\frac{1}{2}} = \sqrt{|z|}\exp(i\text{Arg(z)})
$$

**Considering Paths and Limit**

For any $z$, consider changing it's angle (let $\theta$ = $\text{arg}(z)$), more specifically, the following expression: 

$$
\lim_{\theta \rightarrow \pi} = \sqrt{|z|}\exp(i\theta)
$$
Where we try to rotate the number and make it's angle approaching $\pi$ (we can make it to be $\pi + 2n\pi$ for integer $n$, but we really need one specific one to make determine the branch cut for the function), 
Especially the discontinuity when we approaches it in the anti-clockwise direction: 
$$
\lim_{\theta\rightarrow \pi+} = \sqrt{|z|}\exp(i\theta) = -\sqrt{|z|}
$$

but when we approach it from the clock-wise direction: 

$$
\lim_{\theta \rightarrow -\pi} = \sqrt{|z|}\exp(i\theta) = \sqrt{|z|} 
$$

Left and right limit is not matched, this is a discontinuity when using the **Principal Argument** $\text{Arg(z)} \in [-\pi, \pi]$, therefore, a **Branch Cut** is needed for the limit where $\theta = \pi$. 

And hence, we have to formulate the Branch Cut of the formula to be $\mathbb{R}_{\leq 0} + i \mathbb R$ and this will be the branch cut for this function. 

**Comment**: 

Hou hou hou, square root of a negative number is still not allowed I am not impressed. 

In addition notice how the discontinuity on the Principal Argument got propagated via the continuous function (angle $\pm\pi$ is the same on the complex plane but it's different for $\text{Arg}$) and this is how we identified t he Branch Cut in the end. 

---
### **Example 2 | $\sqrt{z^2 - 1}$**

> let's find the branch cut for $\sqrt{z^2 - 1} = \sqrt{(z + 1)(z - 1)}$. 

And this expression can be written in the following form: 

$$
\begin{aligned}
    & \theta_1 := \text{Arg}(z - 1)
    \\
    & \theta_2 := \text{Arg}(z + 1)
    \\
    & \sqrt{|z + 1||z - 1|}
    \exp\left(\frac{i\theta_1}{2}\right)
    \exp\left(\frac{i\theta_2}{2}\right)
    \\
    =&\sqrt{|z + 1||z - 1|}
    \exp\left(\frac{i(\theta_1 + \theta_2)}{2}\right)
\end{aligned}
$$

Discontinuity of $\theta_1, \theta_2$  can be introduced by the expression $z^2 - 1$, when they jumps from $\pi$ to $-\pi$, these regions are $(-\infty, -1] + i0)\vee ([-1, 1] + 0i)$. When crossing $(-\infty, -1] + i0$ barrier, the value of both $\theta_1$, $\theta_2$ approaches $\pm\pi,\pm\pi$. Consider the below one sided limit

$$
\begin{aligned}
    \lim_{(\theta_1, \theta_2 )\nearrow (\pi, \pi)}
    \exp\left(\frac{i(\theta_1 + \theta_2)}{2}\right)
    & =
    \exp(i\pi) = -1
    \\
    \lim_{(\theta_1, \theta_2) \searrow (-\pi, -\pi)}
    \exp\left(\frac{i(\theta_1 + \theta_2)}{2}\right)
    & =
    \exp(-i\pi) = -1
\end{aligned}
$$

Therefore, the function is continuous along $(-\infty, -1] + i0$. When crossing $[-1, 1] + 0i$, we consider the following limit: 

$$
\begin{aligned}
    & (\theta_1, \theta_2) \rightarrow (0, \pm\pi)
    \\
    \implies &
    \exp\left(
        \frac{i(0 + \pm \pi)}{2}
    \right) = 0 + i \sin(\pm \pi/2) = 0 + \pm i, 
\end{aligned}
$$

therefore the imaginary part of the $f$ is not continuous when crossing $(-1, 1) + i0$. Take note that, when $z \rightarrow \{\pm 1\}$, the the function approches zero. The function is continuous at $\{\pm 1\}$, but it's not analytical. Therefore, the branch cut for $f(z) = \sqrt{(z + 1)(z - 1)}$ is: $[-1, 1] + i0$



---
### **Example 3: Cube Root**

> $$z^{\frac{1}{3}} = \exp\left(\frac{1}{3}\ln(|z|) + \frac{i}{3}(\text{Arg}{(z)}  + 2n\pi)\right)$$

So... this one is going to be more involved because there is gonna be more branch cut needed to make the function continuous on the domain. 

$$
z ^{\frac{1}{3}} = |z|^{\frac{1}{3}}\exp\left(
\frac{i}{3}\text{Arg}(z)
\right) 
\exp\left(\frac{i2n\pi}{3}\right)
$$




