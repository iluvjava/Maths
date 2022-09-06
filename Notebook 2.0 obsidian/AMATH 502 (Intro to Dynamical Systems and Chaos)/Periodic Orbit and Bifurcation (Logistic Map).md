Here we are going to use the logistic map to demonstrate the behavior of: 
1. Bifurcation for discrete system. 
2. Periodic Orbit 
3. Periodic Doubling 
Using the Logistic Map as an example. 
[[Discrete Time Dynamical System]]

---
### Logistic Map

> $$
> f(x) = rx(1 - x)
> $$

This is the logistic map. 

**What are the fixed point of the discrete dynamical system?**

Solving $f(x) = x$, we have 2 solutions: 

1. $x^* = 0$, $x^* = 1 - 1/r$

**What are the stability of the fixed points above?**

$$
f'(x) = r - 2 rx
$$
$$
f'(0) = r \quad f'(1 - 1/ r) = 2-r
$$

FP $x^*$ is stable when $r < 1$, $x^* = 1 - 1/r$ is stable when $2-r\in (-1, 1)$, and this means that $3>r>1$. 

Notice that, as $r$ goes from 0 to 1, the stability of 2 of the fixed point exchanged. And therefore, the first bifurcation of the system is **Transcritical Bifurcation**.

---
### Periodic Orbit

An orbit is a sequence, a periodic orbit of $N$ has the property of 

$$
x_N = f(x_{N - 1}) = x_0
$$

So this thing loops back, and more importantly, $N$ is the smallest value that make the statement true. 

For example, a 2-periodic orbit will be like: 

$$
x_2 = f(f(x_0)) = x_0
$$

And here, we will use the function exponential to denote the function composition, instead raising the output of the function to some kind of power. 

---
### Period 2 Orbits in Logistic Map

Here, we are looking for the period 2 orbits in the logistic Map. Notice that, the fixed points are not the necessarily fixed points for the period 2, but they will help with solving the equation. 

To look for the fixed points, we need to solve another map: 

$$
f(f(x)) = x = r(rx(1 - x))(1 - rx(1-x)) 
$$
$$
x(-r^3x^3 + 2r^3x^2 - (r^3 + r^2)x + r^2 - 1) = 0
$$


And that will be the system we are solving: 

It already has $x = 0$ and $x = 1 - 1/r$, which are the previous 2 fixed points. 

So then we can factor out: $(1 - 1/r)$, getting another quadratic to solve: 

$$
-((1 - r + r x) (1 + r - r x - r^2 x + r^2 x^2))=0
$$
$$
1 + r - r x - r^2 x + r^2 x^2 = 0 
$$

And then, we get the roots: 

$$
x = \frac{1}{2}
    \left(
    1 + \frac{1}{r}    
    \right)
    \pm \frac{1}{2r}  \frac{\sqrt{(r + 1)(r - 3)}}{2r}
$$

And notice that the fixed points for $f(f(x))$ exists as long as: 
$$
(r + 1)(r - 3) \ge 0 \implies r > 3 \tag{1}
$$
And when $r = 3$, that is when the bifurcation happened. 

Observe that, this type of bifurcation looks like a limit cycles in 2D for the following reasons: 
1. Periodic Oscillations 
2. When it starts oscillating, there is no collision of fixed points and such.

Now we are going to assume that the fixed points for the 2-period orbits are denoted by: $x_+, x_-$. 

**What are the stability of the fixed points $x_-, x_+$?** 

Stability is determined by considering: 

$$
(f(f(x_+)))' = f'(f(x_+))f'(x_+) = f'(x_-)f'(x_+)
$$

By symmetry, we have: 

$$
f'(x_+)f'(x_-) = f'(x_-)f'(x_+)
$$
And then this will mean that: 

$$
f'(x_{+, -}) = r
\left(
    1 - \left(
        1 + \frac{1}{r} \pm \sqrt{
            (r+1)(r-3)
        }r
    \right)
\right) = -1 \mp \sqrt{(r + 1)(r - 3)}
$$

And THIS, will tell use the stability of the Limit cycles, I mean, 2 periodic orbit. Because: 
$$
f(f(x))' = 
(-1 \mp \sqrt{(r + 1)(r - 3)})(-1 \pm \sqrt{(r + 1)(r - 3)})
$$
Expanding the polynomials inside stuck in between:
$$
-1 < 1 - (r + 1)(r - 3) < 1 \implies -1 < 4 + 2r - r^2 < 1
$$
Indicating stability. 

However, the quadratic has one positive root located at: $1 + \sqrt{6}$, and this means that: 

Whenever: 

$$
3 < r  < 1 + \sqrt{6}
$$
The period 2 orbits are going to be stable. 

Also notice that, the fixed point $x = 1 - 1/r$ becomes unstable after the value of $r$ goes over $3$. 

It will look like a pitchfork bifurcation when drawn out, but it's not. It's actually acting more like a Hopf Bifurcation but look from the side. 

----

Period 4 Orbits? 

No, stop we need to solve a 16 degree polynomial for this. 