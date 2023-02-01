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
	* [[Jacobian and Hessian]]
	* [[Optimality Conditions, Jacobian Hessian]]
	* [[Derivatives with Jacobian]]

* Functions: 
	* [[Introduction to Convexity]] 
		* Convex Set
		* Convex Functions
		* [[Gradient, Hessian Characterization of Convexity]]
	* Good to optimize functions: 
		* [[Closed, Proper, Level Bounded, Strong Convex]]
		* [[Beta Smoothness]]
	* Non-Smooth
		* [[Non smooth convex optimization]]
		
* Algorithms and Analysis: 
	* [[Gradient Descend, Smoothness]]
	* [[Gradient Descend 2]]
	* [[Gradient Descend 3]]
    * [[Measuring Rate of Convergence]]
    * [[Proximal Gradient Method]]
    * [[Proximal Gradient 2]]
    Newton's Iterations are the inspirations for Accelerated Gradient Descend. 
	* [[Newton Method]]
	Here is an overview: 
	* [[Steepest Descend for Matrix Vector]]

* Problems
	* [[Intro to MLE Robust Fit]]
	* [[Generalized Linear Model]]


End of Quarter Theory: 

* Duality: Arise from perturbation theory 
* [[Duality Preparation]], [[Duality Prepraration 2]]
* [[Duality (Dualization)]], [[Duality (Dualitzation More Examples)]], [[Duality (Example Transformation)]]
* The Interior Points Method: 
	*  [[Interior Points]]



--- 
**Frontiers**: 

* Smitedefinite programming 
* None Smooth Optimizations
* Large Scale Unconstrained Optimizations