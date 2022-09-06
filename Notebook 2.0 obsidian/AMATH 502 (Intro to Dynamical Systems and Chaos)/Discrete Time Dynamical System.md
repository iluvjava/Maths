1D dynamical System is fascinating, because it has chaos, and oscillations at the same time. 

This doesn't happen for 1D continuous dynamical system. 

---
### Intro

A lot of the ideas from continuous time system carries over to the discrete dynamic time system. It's also called a **difference equation**. Which can be conveniently written in the form of: 

$$
x_{n + 1} = f(x_n)
$$

**Orbit**: A list of values, which is also the solutions to the iterative system. 

**Fixed points*: $f(x_n) = x_n$, this happens then we have a fixed point for the system.

**Map**: It refers to the iteration function $f()$. 

Yes, we can still talk about stability, fixed points, and bifurcation for the discrete time system, and the idea behind them is very similar. 

---
### Linear Constant-Coefficient Difference Equation

Assume a simple system: 

$$
x_n = \lambda x_{n - 1} = \lambda^n x_0
$$

Notice that, this is a simple discrete system. Let's talk about different cases for lambda here: 

1. $0 < |\lambda| < 1$
   1. $\lambda > 0$ $x_n$ monotonically decreases. 
   2. $\lambda < 0$ $x_n$ oscillates, but limit of the sequence is zero. 
2. $\lambda = 0$
   1. The sequence is always zero, regardless of what $x_0$ is given. 
3. $|\lambda| > 1$ 
   1. $\lambda > 0$ Monotonically increases and it diverges. 
   2. $\lambda < 0$ Oscillates and diverges. 

Ok, let's take a look at the Stability analysis and apply what we just talked above, consider: 

$$
x_n = x^* + \epsilon_n
$$

Consider deviation from the fixed points, and then we are substituting it into the map, and then we are going to look at the first order approximation of the system by assuming $\epsilon >>0$

$$
f(x_n) = f(x^* + \epsilon_n) = f(x^*) + \epsilon_n f'(x^*) + \mathcal{\epsilon_n^2}
$$

And, the majority of deviation comes from: $\epsilon_{n + 1} = \epsilon_n f'(x^*)$. Therefore, it's immediately clear that, if we start close to the fixed point then we have: 

1. $|f'(x^*)| < 1 \wedge f(x^*) = 0 \implies$ Fixed point is stable. 
2. $|f'(x^*)| > 0 \wedge f(x^*) = 0 \implies$ Fixed point is unstable. 
3. $f'(x^*) = 0 \wedge f(x^*) = 0 \implies$ Something interesting is happening, LSA failed. 

**Note**: For the multi-variable case, we have: 

$$
f(x_n + \epsilon_n) = J[f](x^*)\epsilon_n + \mathcal{\Vert \epsilon_n\Vert^2}
$$

Where we just replace the derivative to the Jacobian of the map evaluated at the fixed point. 

---
#### **Multiple Variable Linear Difference System**

Consider the system which can be modeled $N\times N$ matrix $A$: 

$$
x_{n + 1} = Ax_n
$$

Then using the idea of eigen value decomposition, we can represents any initial conditions to be: 

$$
x_0 = \lambda_1 v_1 + \lambda_2 v_2 + \cdots + \lambda_Nv_N
$$

And then it's not hard to see that we will have: 

$$
x_n = \lambda_1^n v_1^n + \lambda_n v_2^n + \cdots + \lambda_N^nv_N^n
$$

Stability: 

Eigenvalues outside of the unit circle: Unstable

Inside: Stable.

For dynamic systems in higher dimension, repeat the same process but check it with the eigenvalue with the maximal absolute value. 