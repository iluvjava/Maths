---
alias: Subgradient Properties

---
[Subgradient Intro](Subgradient%20Intro.md)

---
**Intro**

We list everything that is directly related to subgradient in this file so that we have a place to refer to various concepts all at the same time. 

### **Properties of the Convex Subgradient**

Properties, and geometric interpretations of Subgradient. 

* [Subgradient is Convex](../CVX%20Analysis/Convex%20Subgradient%20is%20Convex.md). 
	* $\partial f(x)$ is a convex set. 
* [Bounded Subgradient Lemma](Bounded%20Subgradient%20Lemma.md)
	* In the interior of the domain of a convex proper function, the subgradient is always bounded. 
* [Nonempty Subdifferential Implies Convexity](Nonempty%20Subdifferential%20Implies%20Convexity.md)
	* If the subdifferential is nonempty throughout the domain of the function, then the function is convex. 
* [Subgradient and Level Sets](Subgradient%20and%20Level%20Sets.md)
	* The subgradient is in the normal cone at the level set of the function value at that point. 
* [Monotonicity of Subgradient](Monotonicity%20of%20Subgradient.md)
	* The subgradient operator is a monotone operator. Additionally it's also a maximally monotone operator when the function is proper and convex. 
* [Subdifferentials Subgradient Computations](Subdifferentials%20Subgradient%20Computations.md). 
	* Basic calculus rules for the convex subgradient. 
* [Subgradient and Subdifferential Examples](Subgradient%20and%20Subdifferential%20Examples.md),
	* Examples of subgradient for enlightenment and applications. 
* [Epigraphical Normal Cone Interpretation of Subgradient](Epigraphical%20Normal%20Cone%20Interpretation%20of%20Subgradient.md). 
	* Specifically offered from UW, by Jame Burkes and Sasha, and probably rooted in Rockafellar. 

### **Other Properties that I haven't had time to write**

* The gradient is a closed operator when the function $f$ is closed and convex (Closed Subgradient When Convex Proper). 
	* The graph of the subgradient operator for a closed convex function $f$ is also a closed set, meaning that the set $\{(x, v)\in \mathbb E \times \mathbb E: v \in \partial [f](v)\}$ is a closed set. 
	* **Source**: Exercise 3.14, AND 3.5.2, the introduction to directional derivatives for Dimitri's Notes on convex analysis: AMATH 516. **Source**, Prop 9.7, (For convex subgradient only, maybe be extended to regular subgradient), See for a brief proof, refer to: 


---
### **Variational Subgradient**

In this section, we expand some of the classic calculus rules for convex subdifferentials. We prove and cite their classics source. 

#### **Topics**
- [Fechet Regular Subgradient](Fechet%20Regular%20Subgradient.md) (Regular Subgradient)
- [Dini Hadamard Subderivatives](Variational%20Subderivatives.md) (Variational Subderivative)
- [Limiting Subgradient](Limiting%20Subgradient.md) (Mordukhovich Limiting Subdifferential)
