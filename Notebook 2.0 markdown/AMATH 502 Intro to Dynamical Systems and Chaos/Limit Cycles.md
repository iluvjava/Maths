The limit cycles. 
[2D Non-Linear System](2D%20Non-Linear%20System.md)

---
### Intro

Limit cycles is the 2D fixed point, much like a fixed point in the 1D system where you can have a semi-stable fixed point, a limit cycle in 2D can also be semi-stable. 

However, for problems regarding the limit cycles, we have these general things: 
1. It's very hard to find a limit cycle if we were given a system. 
2. It's hard to tell if there are/is limit cycles in the system if we were given one. 
3. It's easier to rule out the existence of limit cycles if we were given some kind of system: Gradient System, Hamiltonian System. 

---
### Def: 
A Limit Cycle is an **isolated** trajectory that **does not begin or end with a fixed point**. 

Isolated: There are no closed trajectories near it. 

**Question**: Is neutrally stable center s limit cycle? 

This is not a limit cycle because, we whatever radius I choose, I will be circling around it. Then, given any cycles, I can choose a point that is infinitely close to it, and it will be a closed trajectory, which is not fitting the definition. **Neutrally stable center is not Isolated**.  

---
### An Example of Limit Cycle

We are going to view this problem in the polar coordinate. 

$$
r ' =r(1 - r^2) \quad \theta' = 1
$$

This is 2D decoupled system, so it is easier. 

Viewing $r' = r(1 - r^2)$, there are 2 fixed points, $r = 0$ which is not stable, and $r = 1$, which is a stable and attractive fixed point. 

However, the other $\theta' = 1$ says that, we will be circling around the origin at a fixed angular speed. 

This means that, $r = 1$ is a limit cycles, if we start inside the circle, then we will goes to limit cycle, which is the stable fixed point in dimension $r$. And if we have any point that is outside, then we will be pushed back to the cycle, because $r = 1$ is a fixed point. 

Just but simulating the trajectories backwards, we will have limit cycles with opposite stability. 

Notice that, we have 2 types of limit cycles: 
1. Stable
2. Unstable
3. Semi-stable (Example not shown yet. )

**Note:**: Limit cycles doesn't have to be a cycle, it can be any closed loop in the 2D plane, as fancy as you want it to be, but topologically, it's going to be a closed loop.

---
### Linear system and Limit Cycles

Notice that, one of the immediate thing from the definition of the limit cycles is that linear system cannot contain any limit cycles. 

if $x(t)$ is a solution of a linear system, then any linear combinations of such a trajectory will be the solution as well. 

Using proof by contradictions, assume that the solution is: $x(t)$ and it's looping back, then $(1 + \epsilon)x(t)$ is another solution, and $\epsilon$ can be made as small as possible so that $|x(t) - (1 + \epsilon)x(t)|$ is as small as possible, and this means that, the trajectory $x(t)$ is not isolated. 

All limit cycles has to be closed loop --> it can never be isolated in a linear system --> There are no limit cycles in the linear system. 


---

### Example Vander Pol oscillator

It's hard to tell if it has a limit cycles, but comparison to the damped harmonic oscillator will provides intuitions for the existence of limit cycles in the system. 

The damped harmonic oscillator is like: 

$$
m x'' + bx + kx = 0
$$

And it can be non-dimensionalized with $\tau = t\sqrt{k/m}$, which reduces to the form: 

$$
x'' + \mu x' + x = 0
$$

Where $\mu$ is the damping coefficient for the system. 

Let's take a look at the Van Der pol Osci: 

$$
x'' + \mu(x^2 - 1)x' + x = 0
$$

Observe the following: 

1. $|x| > 1$ the system reduce to a damping harmonic oscillator that resists the motions. 
2. $|x| < 1$ the system reduces to a damping harmonic oscillator that assists the motions.

So, there has to be something in between such that, the trajectories stay in a closed range. 

yes, it's there, and it's not a cycle, its look depending on the parameters for the system and can be pretty stiff sometimes. And the limit cycle is a **Stable Limit Cycle**. 

