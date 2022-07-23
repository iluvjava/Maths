[[Subgradient and Subdifferential Definition]]


---
**Intro**

We explored some of the properties with the multi-value functions that is the subgradient. And we will list the results here: 

* [[Bounded Subgradient Lemma]]
	* In the interior of the domain of a convex proper function, the subgradient is always bounded. 
* [[Nonempty Subdifferential Implies Convexity]]
	* If the subdifferential is nonempty throughout the domain of the function, then the function is convex. 
* [[Subgradient and Level Sets]]
	* The subgradient is in the tangent cone at the level set of the function value at that point. 
* [[Monotonicity of Subgradient on a Line]]
	* The subgradient operator is a monotone operator, which is just a reinterpretation of the positive definiteness of the Hessian in the smooth case. 

Other Properties that I gather but doesn't have the time to prove them yet: 

* The gradient is a closed operator when the function $f$ is closed and convex (Closed Subgradient When Convex Proper). 
	* The graph of the subgradient for a closed convex function $f$ is also a closed set, meaning that the set $\{(x, v)\in \mathbb E \times \mathbb E: v \in \partial [f](v)\}$ is a closed set. 
	* Source: Exercise 3.14, AND 3.5.2, the introduction to directional derivatives for Dimitry's Notes on convex analysis: AMATH 516. 
