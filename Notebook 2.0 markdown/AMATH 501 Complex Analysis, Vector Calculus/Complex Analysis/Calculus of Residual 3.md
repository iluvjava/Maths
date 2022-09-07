
Here we will be focusing on how to use the Residual Theorem as whole to solve real functions using the complex plane. 

prereq: [Calculus of Residual (Res Shortcut)](Calculus%20of%20Residual%20(Res%20Shortcut).md)

---

### Class I Function (Meromorphic on $\mathbb{R}$)

Consider real functions of the form:

$$
\int_{-\infty}^{\infty} f(z) dx 
$$

Where the function $f(z)$ is a meromorphic function on the complex domain. 

For example: 

$$
\int_{-\infty}^\infty \frac{1}{1 + z^4}dz
$$

Let's denote $C$ to be the semi-circle with radius $R$ on the top half of the complex plane, going in a counter clock-wise conditions, and then we break the contour into the top and the bottom, and then we will have: 

$$C_1 = e^{i\theta} \quad 0 \leq \theta \leq \pi$$

$$
C_2 = x \quad -R \leq x \leq R
$$

And then we know these 2 sections joint together is giving us the full contour integral:

$$
\oint_{C} \frac{1}{1 + z^4} dz = \int_{C1} \frac{1}{1 + z^4} dz  + \int_{C2} \frac{1}{1 + z^4} dz 
$$

Now we gonna prove that, the complex semi-circle integral is going to approach zero when the $R$ is approaching infinity. 

$$
|1 + z^4| > |z^4| = |z|^4 = |R^4\exp(i\theta 4)| = R^4
$$

And then, we have the inequality:

$$
\frac{1}{|1 + z^4|} < \frac{1}{R^4}
$$

And then taking the contour integral on both side of the inequality is giving us that:

$$
\int_{C1} \frac{1}{|1 + z^4|} dz < 
\left| 
\int_{0}^\pi \frac{1}{R^4} iR\;d\theta
\right|
=
\left|\int_{0}^\pi
\frac{i}{R^3} d\theta
\right| = \frac{i\pi}{4R^4}
$$

Taking the limit of $R \rightarrow 0$, we will have the expression that:

$$
\lim_{R\rightarrow \infty} = \int_{C1} \frac{1}{|1 + z^4|} dz =0
$$
Then the whole contour integral is going to be: 
$$
\lim_{R\rightarrow \infty}\oint_{C} \frac{1}{1 + z^4} dz = 
\lim_{R\rightarrow \infty}\int_{C2} \frac{1}{1 + z^4} dz 
$$

Now, we will be able to apply the residual theorem, by noting that there are 2 poles inside the region $C$, and they will be: 

$$
z_1 = \exp
\left(
\frac{i\pi}{4}
\right) 
\quad  
z_2 = 
\exp\left( 
\frac{i\pi}{2}
\right)
$$

**Note** These 2 poles are also simple poles. 

And the whole integral will be: 

$$
\text{Res}(f, z_1) = \lim_{z\rightarrow z_1}
\frac{(z - z_1)}{1 + z^4} =
\lim_{z\rightarrow z_1} \frac{1}{4z^3} = 
\frac{1}{4}
\left(
\frac{-1}{\sqrt{2}} - \frac{i}{\sqrt{2}}
\right)
$$

And the residual on the other pole is derived in the same way, and it's giving us: 

$$
\frac{1}{4}
\left(
\frac{1}{\sqrt{2}} - \frac{i}{\sqrt{2}}
\right)
$$

And the final answer is: 

$$
2\pi i(\text{Res}(f, z_1) + \text{Res}(f, z_1)) = \frac{\sqrt{2}}{2}\pi
$$

Boom, magics, now we are able to  solve some of the freak integrals that normal students back in Sophomore year is not able to solve. 

