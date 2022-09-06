This is one of the way of solving the BVP problem. It's applied for functions with a BVP that is kinda complicated, and also kinda **non-linear.** 

prereq: [[BVP]]

---

#### **The Introduction** 
The initial conditions $y'(a) = A$ remains unknown, and then we need to find a interval for $A$ such that it got mapped to another interval for $y(b)$, and then we perform a binary search like method by tweaking the value of $A$ until it converges to the boundary condition on the other side with a given amount of tolerance. 

#### **An example**

> $$\frac{d^2\phi_n}{dx^2} + (100 - \beta_n)\psi_n = 0$$

This is the problem, and it has the boundary conditions of: 
$$x \in [-1, 1] \;\quad \psi(\pm 1) = 0$$ 

Continuing out previous discussion in prereq, we know that $\beta_n\leq 100$ , $x\in[-1, 1]$. 

**Canonical Transformation**

$$y_1 = \psi_n \quad y_2 = \psi_n\;'$$

$$ y_1' = \psi_n' \quad y_2' = \psi_n''$$

$$y_1' = y_2 \quad y_2' = (\beta_n - 100)y_1$$

And the solution should be some kind of wave as we discussed before. 

```

filename: rhsfunc
```octave
function f = rhsfunc(t, y, n0, beta)
	f1 = y(2); f2 = y(beta-n0)*y(1);
	f = [f_1, f_2]
end
```

filename: runbvp: 
```octave
close all; clc; clear variables; % won't clear the breakpoints

n0 = 100; 
xp = [-1 1]; 
A = 1;  % Good guess to start with
y0 = [0; A]; 
beta_start = n0; 
beta = beta_start;

[t, y] = ode45(@(t, y) rhsfunc(t, y, n0, beta), xp, y0); 

figure; plot(y(:, 1));

```

This is the first step of taking a good guess for the BVP problem. 

Using Visualization we inputs different values for `beta` to get close to the interval on the other side of the boundary. 

Spoiler: beta = 0.9. 

And hence we know that we have to work with the beta parameter as our tweaking parameter. 

**Here is the observation**: $97\leq\beta\leq 100$, in this interval, when $\beta$ close to 100, $y(1) > 0$ and when $\beta$ close to 97, $y(1) < 0$. Notice how we have an local, monotone mapping from the value of $97\leq\beta\leq 100$, to an interval of $y(1)$ such that the interval includes the boundary conditions? 

---

### **Control Flow for Implementing the Shooting Method**

filename: runbvp: 
```octave
close all; clc; clear variables; % won't clear the breakpoints

n0 = 100; 
xp = [-1 1]; 
A = 1;  % Good guess to start with
y0 = [0; A]; 
beta_start = n0; 
beta = beta_start;

tol = ?; dbeta = 3/2; 

for J = 1:1000
	[t, y] = ode45(@(t, y) rhsfunc(t, y, n0, beta), xp, y0); 
	
	if abs(y(end, 1)) < tol
		break
	end
	
	if y(end, 1) > 0
		beta = beta - dbeta;
	else
		beta = beta + dbeta/2;
		dbeta = dbeta/2;
	end
end

figure; plot(y(:, 1));

```

It might not look like the binary search, but it actually is, if we start at the center of the interval for beta. 

Notice that, 2 times the value of `beta_start` should include the desirable boundary value of the other side. 

#### Observation 

When we step over it, we reset by a value of `dbeta/2`, and then we will be heading back. 

Notice that, if we step extremely close to the solution but still over shoot by a tiny bit, then we will be hitting the else case (`beta = beta - dbeta`) a lot. And also notice that the sum is summing up like a Geometric Series, and this will mean that, we will head back to the original place where it first triggered us to hit the else case. 

And hence, notice that, this is telling us the range we are exploring is `dbeta` around the point where we first hit. 

**Multiple Solutions**

Notice that there will be several solutions, on top of the for loop, we need to identify all the possible values of $\beta$ such that the solution with the $\beta$ is very close to an actual solution we want. 

Doing this is not hard, we just search for all of the values of $\beta$ linearly down the spectrum if any of them are shoot close to the region on that other side of the boundary, then we got the solution, else, the maximal amount of iterations count will simply breaks out of the forloop and then the forloop will try for the next value of $\beta$ automatically. 

**Verification**
* Check Convergence, if we are using bisection, then it's going to be linear, and Newton Rapson is quadratic degree. The rate of convergence must match the method of root finding. 

**This is not hard**
Notice that, if we define a function such that, the inputs is the parameters we want to tweak and the output is the eigen boundary conditions on the RHS, then we can phrase this problem as a root finding problem, using the `fzero` command. 


---

#### Extensions and Notes

Notice that, this method doesn't need any interval to be defined, and it can be paired with other optimization process. 

This happens when we phrases the problem as a optimization problem of choosing: 
1. The parameters for the function. 
2. The intiai conditions of the functions 
3. Initial guesses for our parameters so that we know they are close to the solutions we want to have in the end. 

And then we tweak them so that: 
1. The boundary at the other side satisfied some conditions. 
2. Other features of solution satisfy the solution we want in the end. 


Here are some features of the shooting method: 
1. It combines the root finding approach with an IVP solver. 
2. It's not just restricted to the bisection search method (beta stepping), other root finding algorithm can be substituted into the routine for optimizing the roots.  
3. The method converges with the expected order of accuracy will mean thta the resulted approximation is close to the true solution we want. 


