Optimization, especially non-linear optimization

---
### **Prereq:** 
* Linalg
* Calculus (Vector Calc)
* Helpful: Stats 
* Helpful: Python 
* Helpful: Exposure to Optimization

**What is the thing I learned from this class?** 

> To solve a bigger optimization problem efficiently, we have to solve a lot of little optimizations problems and make a lot of assumption. 

---
### **General Intro to the Course.** 

Optimization has 3 legs. 
1. Based on the model and the data. 
2. Iterative algorithm development.
3. Theory and the analysis of the above things. 

It answers the questions from science that involves some set of observation, and then that is pushed into a minimization problem. We solve that data problem with iterative algorithm. And then we need the theory and analysis to understand the algorithms that are used for the data .

> "Optimization gives us the language we can use to formulate a wide range of problems"

**Frameworks**

* Take all the information about a given problem. 
	* Goals
	* Data
	* Mechanistic Models 
	* Error Models 
	* Domain Specific Knowledge
* Convert all of the above information into a mathematical problem. The problem is phrase in the form of a: 
* > $$\min_{x\in \mathcal{X}} f(x)$$

Where $f(x)$ is a function that captures the goals, and the $x$ will be the decision variables that describes the parameters we seek. 

$\mathcal{X}$: Represents the set of feasible domain that the parameters will reside. 

The **Challenging** part is the modeling part and the solving part. 
1. Making the model for the problem.
2. Designing the algorithms and understand how they behave for the problem. 
	* Converge? 
	* Speed? 
	* Stability?

---
### **Course Overview**
#### Problem Types
* Smooth (have derivative)
* Non-smooth (Piecewiese Linear like L1 Norm)
* Convex Model (Guassian)
* Non-Convex (Cauchy)

#### Algorithms
* Smooth Problems Algorithms: 
	* Gradient descent 
	* Newton's method 
	* Wishlist: 
		* Gauss-Newton
		* Quasi-Newton
* Non-smooth convex Problems Algorithms: 
	* Prox-Gradient
	* Splitting/ADMM 
* Non-smooth, non-convex problems algorithms: 
	* DAM/PALM

#### Theories: 
* Convex Analysis: 
	* Sets + Functions
* Algorithm Analysis: 
	* Rate of Convergence

#### Modeling Examples
* Generalized Linear models 
* Sparsity & related ideas
* Low Rank structures in Data
* Wishlist: 
	* Kalman Smoothing
	* Trimming & Clustering


---

### **Fundamentals**
* Calculus and Optimality
	* [Jacobian and Hessian](Smooth%20Calculus/Jacobian%20and%20Hessian.md)
	* [Optimality Conditions, Jacobian Hessian](Smooth%20Calculus/Optimality%20Conditions,%20Jacobian%20Hessian.md)
	* [Derivatives with Jacobian](Smooth%20Calculus/Derivatives%20with%20Jacobian.md)

* Functions: 
	* [Introduction to Convexity](Basic%20Convexity/Introduction%20to%20Convexity.md) 
		* Convex Set
		* Convex Functions
		* [Gradient, Hessian Characterization of Convexity](../AMATH%20516%20Numerical%20Optimizations/CVX%20Analysis/Gradient,%20Hessian%20Characterization%20of%20Convexity.md)
	* Good to optimize functions: 
		* [Closed, Proper, Level Bounded, Strong Convex](Basic%20Convexity/Closed,%20Proper,%20Level%20Bounded,%20Strong%20Convex.md)
		* [Beta Smoothness](Basic%20Convexity/Beta%20Smoothness.md)
	* Non-Smooth
		* [Nonsmooth Convex Optimization Intro](Proximal%20Gradient%20Descend/Nonsmooth%20Convex%20Optimization%20Intro.md)
		
* Algorithms and Analysis: 
	* [Gradient Descend, Smoothness](Gradient%20Descend/Gradient%20Descend,%20Smoothness.md)
	* [Gradient Descend 2](Gradient%20Descend/Gradient%20Descend%202.md)
	* [Gradient Descend 3](Gradient%20Descend/Gradient%20Descend%203.md)
    * [Measuring Rate of Convergence](Gradient%20Descend/Measuring%20Rate%20of%20Convergence.md)
    * [Proximal Gradient Method](Proximal%20Gradient%20Descend/Proximal%20Gradient%20Method.md)
    * [Proximal Gradient 2](Proximal%20Gradient%20Descend/Proximal%20Gradient%202.md)
    Newton's Iterations are the inspirations for Accelerated Gradient Descend. 
	* [Newton Method](Gradient%20Descend/Newton%20Method.md)
	Here is an overview: 
	* [Steepest Descend for Matrix Vector](Steepest%20Descend%20for%20Matrix%20Vector.md)

* Problems
	* [Intro to MLE Robust Fit](Intro%20to%20MLE%20Robust%20Fit.md)
	* [Generalized Linear Model](Generalized%20Linear%20Model.md)


End of Quarter Theory: 

* Duality: Arise from perturbation theory 
* [Duality Preparation](Duality/Duality%20Preparation.md), [Duality Prepraration 2](Duality/Duality%20Prepraration%202.md)
* [Duality (Dualization)](Duality/Duality%20(Dualization).md), [Duality (Dualitzation More Examples)](Duality/Duality%20(Dualitzation%20More%20Examples).md), [Duality (Example Transformation)](Duality/Duality%20(Example%20Transformation).md)
* The Interior Points Method: 
	*  [Interior Points](Interior%20Points.md)



--- 
**Frontiers**: 

* Smitedefinite programming 
* None Smooth Optimizations
* Large Scale Unconstrained Optimizations