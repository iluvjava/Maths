[Periodic Orbit and Bifurcation, Logistic Map](Periodic%20Orbit%20and%20Bifurcation,%20Logistic%20Map.md)
We gonna define chaos and use the logistic chaos to demonstrate it. 


---
### **Intro**

Here we are still considering the family of curves, the logistic map: 

> $$f(x):= rx(1 - x)$$

From the previous part, we know that, the function will bifurcate for some value of $r$. And the periodic orbits gets longer and longer. 

**Features from the Orbit Diagram of Logistic Map with varying R**: 

1. Orbit diagram has self-similarity 

### Definition

There are several definitions for it. 

> Longer term behavior that is **sensitive to initial conditions** in a deterministic system. 

The term: "Sensitive to Initial conditions" will be defined later. 

> Dynamics on a compact set is chaos if: 
> 1. It's sensitive to initial conditions
> 2. It's transitive on a set S. 
> 
> **Transitive**: Orbits gets **arbitrarily close** to Every Real Points in the set. 
> 
> To clarify, it means that, given any real point in a compact set, I run this deterministic map, if I wait a long enough, there will be a value from the iterations such that it's as close as I want it. 

---
### **Theorem Unstable 3 Periodic Orbit means Chaos**

**Intermittancy**: 

From the logistic map, by choosing r = 3.8282, we were able to get observe nearly 3 periodic orbit, with some drifting behavior. This is called intermittancy.

**Unimodal**

Let function $f: [0, 1] \mapsto [0, 1]$

A function that is concave, and as a signal maximum. 

> $f(x)$ is a unimodal and $f(x_{n + 1}) = f(x_n)$ and it has a unstable period 3 orbit, then it has unstable period orbits of any integer period. 

Notice, this is the case when we choose the right $r$ value for the logistic map. 

