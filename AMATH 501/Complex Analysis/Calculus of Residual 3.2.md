
prereq: [[Calculus of Residual 3]], [[Branch Cut]]
Branch cut, and keyhole contour. 

More Resources: [Residue Calculus](https://www-thphys.physics.ox.ac.uk/people/FrancescoHautmann/ComplexVariable/s1_12_sl9.pdf)

---

### Intro: 
Sometimes, when he function presented has a branch cut and singularities, we will need more creativity on the **Branch Cut**, and then we need to make a contour that is more complex before getting to complex contour integral.  

General Strategy for Creativity: 

* The singularities are not going to fall onto the Branch cut!
* The Contour can only contain isolated poles! If not, try to make that happen and then take the limit. (Key Holes are important here!)

### Example

> $$
> \int_0^{\infty} \frac{\sqrt{x}}{x^3 - 1} dx \quad \text{Let: } f(z) = \frac{\sqrt{z}}{z^3 + 1}
> $$

And then this is problem is hard for the following reason: 

* The contour cannot go over, through, or on the branch cut. 
* One of the singularity is on the default branch cut for $\sqrt{x}$

And here is the part that we are going to be creative with: 

* Find a different branch cut for the function $\sqrt{x}$ because the default $\text{Arg}(\theta) \in [-\pi, \pi]$ are overlapping with singularity: 1. 
* Find a keyhole shaped contour that goes over the branch cut and then take the limit. 

And that means we are choosing the Principle Angles for the complex number to be: 

$$
\text{Arg}(z) \in [0, 2\pi]
$$

And the corresponding Branch Cut for the function is $\mathbb{R}_{\geq 0}$ 
 ![[Assets/keyhole.png]]

This keyhole contour is the thing we are going to care about for this integral, let's take a look. 

The inner corridor has radius: $\epsilon$, and the outer corridor has radius $R$, and it consists o 4 components that we are going to integrate WRT individually. 

$$
\lim_{R\rightarrow \infty}\int_{CO} |f(z)| dz = 0 \quad \text{as: }
\epsilon \rightarrow 0
$$



This part is true and it's not hard to bound the integral with an inequality. 

In a similar manner we can show that: 

$$
\lim_{\epsilon\rightarrow 0} 
\left\vert 
\int_{CI} \frac{\sqrt{z}}{1 + z^3} dz
\right\vert
=
\int_{0}^{2\pi} 
\frac{\epsilon^{1/2}}{|1 + \epsilon^2 \exp(i\theta)|} \;\epsilon \; d\theta
$$

And then we use the inequality: 

$$
\frac{\epsilon^{3/2}}{|1 + \epsilon^2 \exp(i\theta)|} \leq \epsilon^{3/2}
$$

Now let's take a look at the integrals that connects these 2 corridors. **For $B$**, it's going to be paramaterized as $x\exp(2\pi i)$, going from left to right yield $\epsilon \leq z \leq R$. . 

**Note** that, $\exp(2\pi i)$ is literally just one, but here we need it for the branch cut. It will also mean that: $dz = \exp(2\pi i)dx$

$$
\int_{B} \frac{\sqrt{z}}{1 + z^3} dz =
\int_{R}^{\epsilon} \frac{-\sqrt{x}\exp(i\pi)}{1 + x^3 \exp(i6\pi)}\exp(2\pi i) dx
$$

Which will be simplified to: (I swapped the sign and integral bound)

$$
\int_{\epsilon}^{R}\frac{\sqrt{x}}{1 + x^3} dx
$$

And HOLY SHIT, this integral is the same as the integral we already have if we were to take the limit. 

For $T$, the same thing happen, because we are paramaterizing $z = x\exp(i 0)$ and it's just 1, which is giving us the same integral back to where we started. 

And hence we know that: 


$$
\lim_{R\rightarrow \infty\; \epsilon \rightarrow 0}
\oint_{C} 
\frac{\sqrt{z}}{z^3 + 1}dz = 2\int_{0}^\infty\frac{\sqrt{x}}{x^3 + 1} dx
$$

Where

$$
C = CI\cup CO\cup T\cup B
$$

And that closed contour integral can be evaluated with the use of **Residue Theorem**. Which is not too hard, all 3 singularities are simple poles, and they are all inside of the keyhole. 


#### Comment
"Can I just use a" Semi Circle that lays on the real axis as the contour, and take the limit? 

No you can't, because $-1$ is a singularity, and that cannot be on the contour, but branch cut can. 



