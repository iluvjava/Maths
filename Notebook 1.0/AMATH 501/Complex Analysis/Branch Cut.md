A way to make make a function legit (Non multi-valued), analytic, so it's easier to deal with. 
[[Complex Logarithm (The Key)]]
[[Complex Functions]]

---

### Intro

The Branch cut is a set of points that we remove from the domain of a complex multi-valued function so that the function becomes a function that is single value and analytic too. 

By introducing **principle argument** for the input of the functions around a special point, the multi-valued function changed into single valued function, however, and then we introduce a branch cut at the  **region of discontinuity** on the domain of the function so it remains analytic for derivatives. 

As we see in the case of the complex logarithm, $\text{Log}$, the principle cut can be made everywhere, and it's a ray shooting away from the origin, and in this discussion, we are going to use some other example for to illustrate. 

---

### Example 1: Square Root 
Let's illustrate the it with the example of the complex root function. 

$$
z^{\frac{1}{2}} = \exp\left(\frac{1}{2}\ln(z)\right)
$$

Notice that this is an multi-valued function because $\ln$ is multi-valued, and this means that: 

$$
z^{\frac{1}{2}} = \exp\left(\frac{1}{2} ln|z| + i(n\pi + \text{Arg}(z)) \right)
$$

where $n \in \mathbb{Z}$

Simplifying it we will have the solution that: 

$$
z^{\frac{1}{2}} = \sqrt{|z|}\exp(i\text{Arg(z)})(\pm1)
$$
#### Looking for Branch Cut
* Limiting to Principal Angle
* Consider paths cross the barrier of the principal angle. 
##### Limiting to Principal Angle
Let's limit the number $z$ by saying that we only allow $z$ to have $arg(z)$, so that the angle of the number $z$ is in the interval of $[-\pi, \pi]$. 

$$z^{\frac{1}{2}} = \exp\left(\frac{1}{2} ln|z| + i\text{Arg}(z)\right)$$

Which will be giving us: 

$$
z^{\frac{1}{2}} = \sqrt{|z|}\exp(i\text{Arg(z)})
$$

##### Considering Paths and Limit

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

And hence, we have to formulate the Branch Cut of the formula to be $\mathbb{R}_{\leq 0}$ and this will be the branch cut for this function. 

**Comment**: 
Hou hou hou, square root of a negative number is still not allowed I am not impressed. 

In addition notice how the discontinuity on the Principal Argument got propagated via the continuous function (angle $\pm\pi$ is the same on the complex plane but it's different for $\text{Arg}$) and this is how we identified t he Branch Cut in the end. 

---

### Example 2: $\sqrt{z^2 - 1}$

let's find the branch cut for another function which is a bit more complicated: 

> $$\sqrt{z^2 - 1} = \sqrt{(z + 1)(z - 1)}$$

And this expression can be written in the following form: 

$$
\sqrt{|z + 1||z - 1|}
\exp\left(\frac{i\theta_1}{2}\right)
\exp\left(\frac{i\theta_2}{2}\right)
$$

**Where $\theta_1, \theta_2$ are $\text{Arg}(z - 1)$ and $\text{Arg}(z + 1)$ respectively.**

Simplifying and let's see: 

$$
\sqrt{|z + 1||z - 1|}
\exp\left(\frac{i(\theta_1 + \theta_2)}{2}\right)
$$

Ok, let's apply something. We know that, the discontinuity for this problem is going to be some kind of combination of the discontinuity from the previous one. 
So it's likely to happen for one of these 2 regions: 

$$(-\infty, -1] \quad \vee \quad[-1, 1]$$

This is the case because $\sqrt{z - 1}$ is discontinuity at $(-\infty, 1]$ while at the same time $(-\infty, -1]$. 


#### Crossing The $(-\infty, -1]$ Barrier

When crossing this barrier, the value of $\theta_1$, $\theta_2$ approaches $-\pi,\pi$ for both. 

And this will mean that $\exp(\pm i\pi)$ is staying at $-1$, and hence we can cross the barrier with continuity. 

$$
\lim_{\theta_1, \theta_2 \rightarrow (\pi, \pi)}
\exp\left(\frac{i(\theta_1 + \theta_2)}{2}\right)
=
\exp(i\pi) = -1
$$

And at the same time: 
$$
\lim_{\theta_1, \theta_2 \rightarrow (-\pi, -\pi)}
\exp\left(\frac{i(\theta_1 + \theta_2)}{2}\right)
=
\exp(-i\pi) = -1
$$

Woah! 

#### Cross the $[-1, 1]$ Barrier

When crossing this one, the angles are like: 

$$
(\theta_1, \theta_2) \rightarrow (0, \pm\pi)
$$

And it's obvious to see that we are not cross the barrier continuously. 

Therefore, the branch cut for the function is gonna be: 

> The branch cut for $f(z) = \sqrt{(z + 1)(z - 1)}$ is: $$[-1, 1]$$



---
### Example 3: Cube Root

> $$z^{\frac{1}{3}} = \exp\left(\frac{1}{3}\ln(|z|) + \frac{i}{3}(\text{Arg}{(z)}  + 2n\pi)\right)$$

So... this one is going to be more involved because there is gonna be more branch cut needed to make the function continuous on the domain. 

$$
z ^{\frac{1}{3}} = |z|^{\frac{1}{3}}\exp\left(
\frac{i}{3}\text{Arg}(z)
\right) 
\exp\left(\frac{i2n\pi}{3}\right)
$$




