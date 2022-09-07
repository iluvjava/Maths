[Bifurcation 1D](Bifurcation%201D.md)
We are interested in the case where $x \in [0, L)$ where the behavior in $x = 0$ and $x = L$ is the same. 

That is, we are just looking at things differently and we want to introduce the idea of a attractor in the 1D system. 

And for a 1D system to have a fixed point that is unstable and yet attractive, periodic domain is the way to go. 

---
### Intro
So, here we are interested in system that is periodic for some parameters. There will be infinitely many fixed points for these type of system. 

**For example:**
$$
\theta' = \sin(\theta)
$$

This system has infinitely many fixed points in this case, the behaviors between each of the 2 fixed points is the same. 

There is no point to plot infinitely many fixed points, let's take $\theta \in [0, 2\pi)$. 

And the new interval $\theta \in [0, 2\pi)$ will be to our interests, now, we can glue the 2 ends of the interval together and get a circle. And this is the **phase portrait on a circle**. 

**For example:**
$$
\theta' = \theta^2
$$

Notice that, this is not periodic, $\theta'(0) \neq \theta'(2\pi)$ 

**Periodicity**
We can only do this when: 
$$
f(\theta + L) \equiv f(\theta)
$$

**Non Uniform Oscillator**: 

$$
\theta' = \omega - a\sin(\theta)
$$

Notice that there will be several cases: 
1. $a < \omega$ --> $\sin(\theta) \le a$, In this case there are no fixed points at all. 
2. $a = \omega$ --> $\theta' = 0$ when $\theta$ is $\pi/2$ in the periodic domain. 
	* But because we have  this periodicity, the semi-stable point will propels initial conditions away, but then, it will just come to another semi-stable fixed point of the same type. That is called: "**Attractor**". This is called an **Unstable Attractor**. 
3. $a > \omega$, and when this happened, there are 2 fixed points in the interval: $[0, 2\pi)$. a stable fixed point and an unstable fixed point with $\theta^*_1 < \theta^*_2$ where the first one is stable and the second one is unstable. 
	* This is a Saddle Node Bifurcation. 



