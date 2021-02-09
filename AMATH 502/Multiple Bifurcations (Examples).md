We are going to look at some of the examples of a function having multiple bifurcations marks, and how to deal with them. 
Prereq: [[Bifurcation 1D]]

---

### Intro
Most of the time for a given system, there will be multiple bifurcations happening, and to handle the stability part of the analysis, we don't really need to test the stability everywhere, we just need to determine one of it and them everything will follow through with the continuity assumption made on the RHS function of the system. 

### Example 1 
> $$x' =- rx + x^4 - x^5 = x(r + x^2 - x^4)$$

Firstly 
* $x = 0$ is a fixed point. 

Secondly, solving the equation we have: 
$$
x^2 = \frac{1 \pm \sqrt{1 + 4r}}{2}
$$

And the conditions for have 2 unique solution is: 
$$
1 + 4r > 0 \implies r > \frac{-1}{4}
$$
This is **condition (1)**

Now assume that it's true, then
$$
x = \pm \sqrt{
\frac{1 \pm \sqrt{1 + 4r}}{2}
}
$$
And the both unique roots exists if whatever inside is positive, and it's not hard to see that the condition would be: 
$$
r < 0
$$
This is **condition (2)**. Whenever $r$ is larger than zero, we risks a negative subtraction in the square root.

In the end, we have 5 roots, let's list them here: 
$$
\begin{align}
	x_1 &= 0
	\\
	x_2 &= \sqrt{\frac{1 + \sqrt{1 + 4r}}{2}}
	\\
	x_3 &= \sqrt{\frac{1 - \sqrt{1 + 4r}}{2}}
	\\
	x_4 &= -\sqrt{\frac{1 + \sqrt{1 + 4r}}{2}}
	\\
	x_5 &= \sqrt{\frac{1 - \sqrt{1 + 4r}}{2}}
\end{align}
$$

And there are 2 critical points, $r = -1/4$ and $r = 0$, slicing the interval for $r$ in to 3 different pieces. 

1. $x < -1/4$ --> $x_1$ is the only solution. 
2. $x > 1/4 \wedge x < 0$ -->All 5 solutions are present. 
3. $x > 0$  --> $x_1, x_4$ are there. 
#### Bifurcation Graph without stability: 
![[mulitple-bifurcation-eg1.png]]

#### Stability

Notice that, the easiest point to do linear analysis with is $x = 0$. Taking the derivative we have: 
$$
f'(x) = r + 3x^2 - 5x^4\implies f'(0) = r
$$
And this means that $r > 0$ it's unstable and $r < 0$ it's stable. 

Notice that, each of the roots only have multiplicity of 1, and hence, stability **must alternates between stable and unstable ** for 3 of the intervals discussed above. 

And this would mean that the bifurcation graph actually looks like this: 

![[multiple-bifurcation-stability-eg1.png]]

And as we can see, there are 3 points where the bifurcations happens, when $r = -1/4$, there are 3 points, and 2 of them will undergo S.N.B. And when $r = 0$, it's a Subcritical Pitchfork Bifurcations. 