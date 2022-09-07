Solving the Generalized Initial Value Problem 

---

### **IVP**

The initial value problem looks like this: 

Consider a differential equations that look like this

$$\frac{dY}{dt} =F(t, Y(t))$$

Where $Y:\mathbb{R} \mapsto \mathbb{R}^n$, it doesn't have to be real, it can be complex too. 

The initial condition is given as 

$$
Y(0) = Y_0
$$

---

### **Practical Concerns**

* Local and global errors from the analytical expression of the iteration scheme. 
	* The global error is always one power larger. 
	* These 2 errors are directly relevant to the step size $\Delta t$
* Truncation errors and the round off errors from the computers. 
  * Truncation errors happens when the relevant size of both addees numbers are 10e+16 away from each other, this order the addition or the subtraction completely useless.
  * The round off error is always gonna be there, and it's 10e16, this will propagate through multiplications and division. 
  * These errors manifests itself when the size of $\Delta t$ is too small. 
* Given the iteration scheme and the particular problem we are solving, we are interested in the long term affect of the perturbations in the initial conditions of the problem 
	* This really depends on the problem and the given iteration scheme. 
	* This can be by pass by the usage of implicit iteration schemes 
	* This will be there if, the problem is unstable and the size time of simulation is huge, in that way, regardless of global error, the error will build up on the perturbation of the initial condition. 

#### **Errors**
**Local:**

Error from each step of the Taylor approximations. 

**Global:**
Accumulation of local errors, one order larger than the local errors for method that doesn't involve a predictor. 

**Round off:**

Unrelated to the scheme, depends on the problem and the scheme, and it's due to the Round off error on binary on the computer. 

---

### **Schemes Classification** 
Explicit: 

The future time step is depends on the previous scheme. 
e.g: FE, RK, AB

Implicit: 
e.g: BE, AM. 

We have to solve the equations involving the future steps and the previous step for the future step. 

Explicit + Implicit: 
AB + DM with Predictor

---

### **Analytical Approaches**

* Taylor Series: [Runge Kutta](Runge%20Kutta.md) [Generalized 2nd Order Taylor Scheme](Generalized%202nd%20Order%20Taylor%20Scheme.md)
* Integration: [Adam B.M](Adam%20B.M.md)

---



