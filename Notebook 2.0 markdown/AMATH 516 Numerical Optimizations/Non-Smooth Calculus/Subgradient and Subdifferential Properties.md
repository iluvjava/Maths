[Subgradient and Subdifferential Definition](Subgradient%20and%20Subdifferential%20Definition.md)


---
**Intro**

We explored some of the properties with the multi-value functions that is the subgradient. Here is some useful properties if we assume $f$ to be a convex function. 

* [Bounded Subgradient Lemma](Bounded%20Subgradient%20Lemma.md)
	* In the interior of the domain of a convex proper function, the subgradient is always bounded. 
* [Nonempty Subdifferential Implies Convexity](Nonempty%20Subdifferential%20Implies%20Convexity.md)
	* If the subdifferential is nonempty throughout the domain of the function, then the function is convex. 
* [Subgradient and Level Sets](Subgradient%20and%20Level%20Sets.md)
	* The subgradient is in the tangent cone at the level set of the function value at that point. 
* [Monotonicity of Subgradient on a Line](Monotonicity%20of%20Subgradient%20on%20a%20Line.md)
	* The subgradient operator of a proper convex is a monotone operator, which is just a reinterpretation of the positive definiteness of the Hessian in the smooth case. 
	* The general monotonicity of convex functions can be directly derived by consider 2 inequalities: $f(y) - f(x) \ge \langle \partial f(x), y - x\rangle$, and $f(x) - f(y)\ge \langle \partial f(x), x - y\rangle$ and summing them up. 

Other Properties that I gather but doesn't have the time to write about them yet: 

* The gradient is a closed operator when the function $f$ is closed and convex (Closed Subgradient When Convex Proper). 
	* The graph of the subgradient for a closed convex function $f$ is also a closed set, meaning that the set $\{(x, v)\in \mathbb E \times \mathbb E: v \in \partial [f](v)\}$ is a closed set. 
	* **Source**: Exercise 3.14, AND 3.5.2, the introduction to directional derivatives for Dimitry's Notes on convex analysis: AMATH 516. 