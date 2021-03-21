Welcome.

---
### Intro
Dynamical System and Chaos. 
We are interested in the Qualitative Analysis of Solutions on ODEs. 

Which means that, we want to just look at the equations, and gain some insights about the behaviors of the classes of solutions to the system. 

---
### Learning Goals 
#### Overarching Goals 
* Interpret the behavior of a dynamic system in terms of a real-world applications.
* Convert a dynamical system to dimensionless form. 

#### Chapter 1, Section 1.0: Intro
1. Classify a dynamical system as a continuous/discrete time, autonomous/non-autonomous, linear/nonlinear, and by dimension. 
2. Explain the different in approach between an ODEs class and a dynamical system class (solution method vs qualitative)

Links: 
[[1D Autonomous]]

#### Chapter 2: 1D Flows 
1. Find the fixed points of a 1D (continuous time autonomous dynamical system)
2. Draw a phase portrait for a 1D dynamical system. 
3. Classify fixed points as stable/unstable/semi-stable using the phase portrait. 
4. Give a qualitative sketch of the solution of a differential equation from the phrase portrait. 
5. Given an example of a dynamical system with given properties of a given phase portrait. 
6. Recognized that solutions to 1d systems are monotonic. 
7. Classify fixed points as stable/unstable using linear stability analysis. 
8. Recognized when linear stability analysis fails. 

Links: 
[[1D Stability]]


#### Chapter 3: Bifurcations
1. Classify bifurcation points of 1D dynamical systems as **saddle-node**, **transcritical**, **super critical pitchfork**, or **subcritical pitpchfork**. 
2. Find the bifurcation point(s) for the types listed above for a given !D dynamical system. 
3. Describe the qualitative changes that occur at the bifurcation point for each type of bifurcation. 
4. Draw a bifurcation diagram 
5. Identify the normal forms of bifurcations. Describe how a general bifurcation of a given type relates to the normal form. 
6. Identify and explain **hysteresis**. 

Links:
[[Bifurcation 1D]], [[Bifurcation 1D Extra]], [[Insect Outbreak]], [[Multiple Bifurcations (Examples)]]

#### Chapter 4: Flows on the Circle 
1. Find and classify the fixed points of a flow on a circle. 
2. Draw a phase portrait for a flow on a circle. 
3. Identify and classify bifurcations for a flow on a circle. 

Links: 
[[Flows on The Circle]]

#### Chapter 5: 2D Linear Systems
1. Convert a second-order differential equations to a system of two first-order equations. 
2. State the definition of **stable, unstable, attracting asympotically stable, and neurally stable fixed points** and a give examples that distinguish them. 
3. Use eigenvalues/eigenvectors to classify the fixed points of a 2D linear system as a stable/unstable node, saddle point, line of stable/unstable fixed points, center, stable/unstable spiral, stable/unstable star, or a stable/unstable degenerate node. 
4. Recognize slow and fast eigendeirections and stable and unstable manifolds. 
5. use pplane or some other computational method for drawing phase portraits. 

Links:
[[2D Linear System]]

#### Chapter 6: Phase plane (2D nonlinear systems)
1. Recognize that trajectories cannot cross the phase portrait. 
2. Find fixed points of a 2D nonlinear systems. 
3. Classify the fixed point using linear stability analysis
4. Recognized when linear stability analysis can be trusted and when it fails. 
5. Have a working definition of **basin attraction** and **seperatrix**. 
6. Define conservative system. 
7. Find a conserved quantify for a given system. 
8. use that a system is conservative to show that a fixed point is a center. 

Links: 
[[2D Non-Linear System]], [[Pendulum System]], [[Gradient System]], [[Conservative System (Hamiltonian)]], [[Lotka Volterra]]

---
#### Chapter 7: Limit Cycles
1. State the definition of a limit cycles
	1. A closed orbit, and for any other orbits infinitely close to it, they are not closed orbits. 
2. Construct examples of **stable, unstable, and semi-stable limit cycles**. 
	1. Using polar coordinates, this idea is demonstrated. 
	2. Phase spaces is just the x, y graph for trajectories. 
3. Check whether a system is **a gradient system**.
	1. A gradient system doesn't have a limit cycles. 
	2. The system $f(x)$ is a gradient of a scalar function. 
4. Find the potential function for **a gradient system**. 
	2. This is covered in amath 501, when recovering the scalar function from the gradient of the function. 
5. State and check the conditions of Bendixson's Theorem
	1. [[Bendixson's Theorems]]
6. Show that a given dynamical system has no **closed trajectories** (in some region) using **Bendisxon's Theorem** or the fact that it is **a gradient system**. 
7. State the conditions for the **Poincare-Bendixson Theorem**. 
	1. Closed region 
	2. No fixed points. 
	3. There exist a trajectory that is not escaping the region. 
8. Apply Poincare-bendixson to show that there is a closed trajectory by constructing a trapping region. 
9. Explain the consequences of the Poincare-Bendixson's Theorem in terms of the types of the behavior that are possible for 2D systems. 
10. Define weakly nonlinear oscillator.
11. Explain why **regular perturbation theory** fails for the damped harmonic oscillator with small damping (Example 7 in class)
	1. Harmonics addes and the long time scale behavior is not captured. 
12. Use two-timing to approximate limit cycles for **weakly non-linear** oscillators. 

Links: 
[[Limit Cycles]],[[Pertubations Theory (Intro)]], [[Method of Multiple Time Scale]], [[Method of Averaging]]

#### Chapter 8: 2D Bifurcations 
1. Identify the **saddle-node**, **transcritical**, and **pitchfork** bifurcations are **zero-eigenvalue bifurcations**. 
	* [[2D Bifurcation (Zero Eigenvalues)]]
	* In 2D, the type of bifurcation that happens have 2 types. If it happens along one of the manifold along 2, 3 fixed points, then its eigenvalues are set to be zero at the moment of bifurcation. 
1. Describe the eigenvalue behavior of a **Hopf Bifurcation**.
	* [[Hopf Bifurcation and Global Bifurcation]]
	* Eigenvalue crosses the Imaginary axis. Happens when the real part of the eigenvalues becomes zero as the parameters change.
2. Describe the qualitative changes that occur at a Hopf bifurcation (in terms of fixed points and limit cycles)
	* Stability of a center changed when eigenvalue cross the imaginary axis.
	* A limit cycle is created/destroyed (could be both at different value for the parameter), which can be hard to determined sometimes.
	* Note: The creation of limit cycles itself could be Global bifurcation, instead of Hopf bifurcation.
1. Classify Bifurcation points of 2D dynamical systems as saddle-node, **transcritical, supercritical pitchfork, subcritical pitchfork, supercritical Hopf, or subcritical Hoopf.**
	* Pitchfork Bifurcation type and transcritical bifurcation types are consistent with the 1D counter parts. But in the case of a Hopf bifurcation, a 
	* Supercritical bifurcation --> attractive limit cycle.
	* Subcritical Bifurcation --> unstable limit cycle.
2. Find the bifurcation point(s) for the types listed above for a given 2D dynamical system
	* [[2D Bifurcation (Zero Eigenvalues)#Example 2 Pitchfork Bifurcation]] --> A complicated example for the non-idea case where Taylor Series has to be used for it.
	* For Hopf bifurcation... EXAMPLE NEEDED

#### Chapter 10: Discrete-time Dynamical Systems
1. Find the fixed points of a map
	* $f(x) = x$
2. Determine the stability of the fixed points of a map. 
	* $|f'(x^*)| < 1$ --> Stable
1. Find periodic orbits of a map. 
	* $f^2(x) = x$ The fixed points of the nested map. 
1. Determine the stability of periodic orbits of a map 
    * $(f\circ f(x))'$ 
3. Identify transcritical or period-double bifurcations of a map. 
	* [[Periodic Orbit and Bifurcation (Logistic Map)]]
1. Draw a cobweb diagram. 
	* See code published by prof for the class. 
1. Infer properties of a dynamical system from its cobweb diagram. 
	* Done in HW 7
1. Explain important properties of the Logistic map including: 
	1. Period-Doubling of the orbit diagram.
	3. Self-similarity of the orbit diagram. 
	4. The period-3 window.
	5. Intermittency round to chaos.
		* [[Chaos]]
	1. The universality of the **Feigenbaum constant**: [[Universality, Lyapounov Exponent]]
1. Identify properties of chaotic dynamics (SDIC, aperiodic, transitive on a compact set).
2. Calculate the Lyapounov exponent of a map.
3. Use the Lyapounov exponent to determine whether a system is chaotic.

All relevant links: [[Discrete Time Dynamical System]]

#### Chapter 11: Fractals
1. Define the term cardinality, countable and uncountable
2. Determine whether two sets have the same cardinality
	* A bijective map must exist between the 2 sets. Enumerosity is a transitive relation. 
3. Explain the construction of the middle-third Cantor set and derive similar properties for other cantor sets.
	1. The set is uncountable 
	2. The set has Lebesgue measure zero, This is done by looking for the amount of "area" removed from the space and then compare it to the original space. 
4. Calculate the similarity dimension of self-similar fractals. 
	* [[The Cantor Set]]
5. Calculate the box-counting dimension of a fractal. 
	1. [[Box Counting Dimension]]

#### Chapter 12: Lorenz Equations 
1. Describe a physical system modeled by the Lorenz equations.
	1. Atmosphere. 
2. Show that the Lorenz system is dissipative and explain what the means.
	1. [[Lorenz Equation]]
	2. Volume Contraction --> Dissipative
3. Find the fixed points of the Lorenz equations.
	1. [[Lorenz Attractor]]
4. State important properties of the Lorenz attractor.
	1. Dissipative (invariant set), SDIC, and it's a fractal.

Extra links: [[Fractal]]

#### Chapter 13: Strange Attractors
1. Define strange attractor
	1. [[Strange Attractor]]: It's a fractal. 
2. List the processes involved in crating a strange attractor.
	1. Stretching and then curl it back onto itself. 
3. Find the invariant set of a map. 
	1. Take the limit and then see what is still remain after evolving the system for infinite amount of time. 

That was the plan, and here is what we actually did in class.