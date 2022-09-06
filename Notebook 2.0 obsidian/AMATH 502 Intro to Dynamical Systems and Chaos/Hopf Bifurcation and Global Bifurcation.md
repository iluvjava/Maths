Hopf Bifurcation is a special type of bifurcation in 2D. 

It has something to with the creation and destruction of [[Limit Cycles]]. 

Relevant idea: [[2D Bifurcation with Zero Eigenvalues]]

---

### Intro

A **Hopf Bifurcation** is when a fixed point goes from stable to unstable spiral, and during the process, a limit cycle is created/destroyed. 

**Notice**: This means that the limit cycle is supposed to be expand from the origin, or collapses onto the origin. 

**Think:**
This means that, hopf bifurcation require a fixed point to change from stable to unstable spiral, this means that, as the parameters changes, the eigenvalue of the Jacobian is crossing the imaginary axis on the complex plane. 

If the limit cycle is stable: **Super Critical Hopf Bifurcation**

If the limit cycle is unstable: **Subcritical Hopf Bifurcation**



---
### Subcritical Hopf Bifurcations/Global Bifurcation

Consider the system in polar coordinates: 

$$
\begin{cases}
    r' &= \mu r + r^3 - r^5 = r(\mu + r^2 - r^4)
    \\ 
    \theta' &= \omega + r^2
\end{cases}
$$  

Solving for $r$, we have the roots as: 

$$
r = \pm_2 \sqrt{\frac{1}{2} + \pm_1 \frac{\sqrt{1 + 4\mu}}{2}}
$$

Notice that the radius will have to be $>0$, so in this case it simplifies to: 
$$
r = \sqrt{\frac{1}{2} + \pm_1 \frac{\sqrt{1 + 4\mu}}{2}}
$$

Notice that this is just a 1D bifurcation. Let's consider by cases: 

1. When $\mu < -1/4$, there is no fixed point on $r$. The system is a stable spiral 
2. When $\mu = -1/4$, there is a semi-stable fixed point for $r = 1/\sqrt{2}$. There is a limit cycles, and it comes out of nowhere. 
   1.  **This is NOT hopf bifurcation, the stability of the spiral fixed point hasn't change**. This is called a: **Saddle-node Bifurcation of Limit Cycle**. 
   2.  This is a type of: **Global Bifurcation**. We cannot just zoom into a fixed point and look at the Jacobian to see how the eigenvalue cross the imaginary axis in this case. 
3.  When $-1/4 < \mu < 0$, and in this case, we have 2 limit cycles. The inside limit cycle is unstable, and the outside limit cycle is stable.
4.  When $r> 0$, there is one stable fixed point. 
	1.  The unstable limit cycle, inner cycle, collapse onto the origin. 
	2.  This is a **Subcritical Hopf Bifurcation**. 

Bifurcation diagram of r: 
![[saddle-node-limit-cycle.png]]

The lower half of the curve (Cut half by the extrema of the curve), is unstable, and the upper half of the curve is stable. 

