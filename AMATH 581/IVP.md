Solving the Generalized Initial Value Problem 

---

### IVP

The initialvalue problem looks like this: 

Consider a differential equations that look like this

$$\frac{dY}{dt} =F(t, Y(t))$$

Where $Y:\mathbb{R} \mapsto \mathbb{R}^n$, it doesn't have to be real, it can be complex too. 

The initial condition is given as 

$$
Y(0) = Y_0
$$

---

### Practical Conerns

* Local and global errors from the analytical expression of the iteration scheme. 
	* The global error is always one power larger. 
	* These 2 errors are directly relevant to the step size $\Delta t$
* Truncations errors and the round off errors from the computers. 
  * Truncation errors happens when the relevant size of both addees numbers are 10e+16 away from each other, this reders the addition or the subtraction completely useless.
  * The roundoff error is always gonna be there, and it's 10e16, this will propagate through multiplications and division. 
  * These errors manifests itself when the size of $\Delta t$ is too small. 
* Given the iteration scheme and the particular problem we are solving, we are interested in the long term affect of the pertubations in the initial conditions of the problem 
	* This really depends on the problem and the given iteration scheme. 
	* This can be by pass by the usage of implicit iteration shemes. 
	* This will be there if, the problem is untable and the size time of simulation is huge, in that way, regardless of global error, the error will build up on the pertubation of the initial condition. 

#### Errors
**Local:**

Error from each step of the taylor approximations. 

**Global:**
Accumulation of local errors, one order larger than the local errors for method that doesn't involve a predictor. 

**Roundoff:**

Unrelated to the scheme, depends on the problem and the scheme, and it's due to the roudoff error on binary on the computer. 

---

### Schemes Classification 
Explicit: 

The future time step is depends on the previosu scheme. 
e.g: FE, RK, AB

Implicit: 
e.g: BE, AM. 

We have to solve the equations involving the future steps and the previous step for the future step. 

Explicit + Implicit: 
AB + DM with Predictor

---

### Analytical Approaches

* Taylor Series: [[Runge Kutta]] [[Generalized 2nd Order Taylor Scheme]]
* Integration: [[Adam B.M]]

---



