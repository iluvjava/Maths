---
alias: Subgradient Properties

---
[[Subgradient Introduction]]

---
**Intro**

We list everything that is directly related to subgradient in this file so that we have a place to refer to various concepts all at the same time. 
* [[../Convex Subgradient is Convex]], $\partial f(x)$ is a convex set. 
* [[Bounded Subgradient Lemma]]
	* In the interior of the domain of a convex proper function, the subgradient is always bounded. 
* [[Nonempty Subdifferential Implies Convexity]]
	* If the subdifferential is nonempty throughout the domain of the function, then the function is convex. 
* [[Subgradient and Level Sets]]
	* The subgradient is in the tangent cone at the level set of the function value at that point. 
* [[Monotonicity of Subgradient]]
	* The subgradient operator of a proper convex is a monotone operator, which is just a reinterpretation of the positive definiteness of the Hessian in the smooth case. 
	* The general monotonicity of convex functions can be directly derived by consider 2 inequalities: $f(y) - f(x) \ge \langle \partial f(x), y - x\rangle$, and $f(x) - f(y)\ge \langle \partial f(x), x - y\rangle$ and summing them up. 
* [[Subdifferentials Subgradient Computations]]
* [[Subgradient and Subdifferential Examples]]
* [[Epigraphical Normal Cone Interpretation of Subgradient]] 

Other Properties that I gather but doesn't have the time to write about them yet: 

* The gradient is a closed operator when the function $f$ is closed and convex (Closed Subgradient When Convex Proper). 
	* The graph of the subgradient operator for a closed convex function $f$ is also a closed set, meaning that the set $\{(x, v)\in \mathbb E \times \mathbb E: v \in \partial [f](v)\}$ is a closed set. 
	* **Source**: Exercise 3.14, AND 3.5.2, the introduction to directional derivatives for Dimitri's Notes on convex analysis: AMATH 516. **Source**, Prop 9.7, (For convex subgradient only, maybe be extended to regular subgradient), See for a brief proof, refer to: 
