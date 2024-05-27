### **Intro**

Kido, we have some very important shit to go over. 
Here is a list of things we are learning so that they can be included into the thesis proposal. 

---
### **Chapters in Books**

There are a list of good books that we need to read. 

#### **Nesterov's Book**

Nesterov's writing is unique in the way it covers the topic of Optimal Method (common knows as Nesterov accelerations). 
It's also unique because of a computation perspective for algorithms, it's manifested as ample amount of derivations for the behaviors of algorithms, complexity and theoretical lower bounds. 
We will highlight content in bold if I hadn't read it carefully or the content is new and/or it gives interesting perspective on things that I already know. 

For Nesterov's Lecture on Convex Optimization, I think these chapters requires absolute mastery. 
- Chapter 2 | Smooth Convex Optimization 
  - Minimization of smooth functions
    - Lower complexity bounds for Lipschitz smooth function
    - Strongly convex function
    - Lower complexity bounds for strongly convex function
    - The Gradient Method
  - Optimal Methods
    - Estimating Sequences
    - Decreasing Norm of the Gradient
    - Convex Sets 
    - [ ] **The Gradient Mapping**
    - [ ] **Minimization of Simple Sets**
  - Minimization Problems with Smooth Components
    - The Minmax Problem
    - [ ] **The Gradient Mapping**
    - [ ] **Minimization Method for the Minmax Problem**
    - [ ] **Optimization with Functional Constraints**
    - [ ] **The Method for Constrained Minimization**
- Chapter 3 | Nonsmooth convex optimization 
  - General Convex Functions
    - Motivation and Definitions 
    - Operations with Convex Functions
    - Continuity and Differentiability
    - Separation Theorem
    - Subgradients
    - [ ] **Computing Subgradients**
    -  Optimality Conditions
    - [ ] **Minmax Theorem**
    - [ ] **Basic Elements of Primal Dual Methods **
  - Methods of Nonsmooth Minimization 
    - [ ] **General Lower Complexity Bounds**
    - [ ] **Estimating Quality of Approximate Solution **
    - [ ] The Subgradient Method 
    - [ ] Minimization of Functional Constraints 
    - [ ] Approximating the Optimal Lagrange Multpliers 
    - [ ] Strongly Convex Functions
    - [ ] Complexity Bounds in Finite Dimensions 
    - [ ] Cutting Plane Schemes
  - Methods with Complete Data
    - [ ] Nonsmooth Model of the Objective Functions 
    - [ ] Kelley's Method 
    - [ ] The Level Method 
    - [ ] Constrained Minimization

Lectures on Convex Optimizations ^[Y. Nesterov, _Lectures on Convex Optimization_, vol. 137. in Springer Optimization and Its Applications, vol. 137. Cham: Springer International Publishing, 2018. doi: [10.1007/978-3-319-91578-4](https://doi.org/10.1007/978-3-319-91578-4).]


#### Amir Beck's Book

Chapter 12, Frank Wolfe conditional Gradient descent. 

#### Rockafellar, Wets Book

Try understand these: 

 - Chapter 1: 
	 - F: Parametric Dependence
	 - G: Moreau Envelopes
 - Chapter 10: 
	 - G: Semiderivatives and Subsmoothness

---
### **Papers**

I plan on reading these papers. 

#### **Nesterov**
- Linear convergence of First order method for non-strongly convex optimization ^[I. Necoara, Yu. Nesterov, and F. Glineur, “Linear convergence of first order methods for non-strongly convex optimization,” _Math. Program._, vol. 175, no. 1, pp. 69–107, May 2019, doi: [10.1007/s10107-018-1232-1](https://doi.org/10.1007/s10107-018-1232-1).]
- Efficiency of Coordinate Descent Methods on Huge-Scale Optimization Problems ^[Y. Nesterov, “Efficiency of Coordinate Descent Methods on Huge-Scale Optimization Problems,” _SIAM Journal on Optimization_, vol. 22, no. 2, pp. 341–362, 2012, doi: [10.1137/100802001](https://doi.org/10.1137/100802001).]


#### **Sasha**

- Relax and Split for Nonconvex Inverse Problem ^[P. Zheng and A. Aravkin, “Relax-and-split method for Nonsmooth nonconvex problems.”]. 

#### **Jerome Bolte**
- <mark style="background: #FFB86CA6;">Optimal complexity and cerification of Bregman first-order methods</mark>^[R.-A. Dragomir, A. B. Taylor, A. d’Aspremont, and J. Bolte, “Optimal complexity and certification of Bregman first-order methods,” _Math. Program._, vol. 194, no. 1–2, pp. 41–83, Jul. 2022, doi: [10.1007/s10107-021-01618-1](https://doi.org/10.1007/s10107-021-01618-1).].

#### **Peter Osch**

- iPiano^[P. Ochs, Y. Chen, T. Brox, and T. Pock, “iPiano: Inertial Proximal Algorithm for Nonconvex Optimization,” _SIAM J. Imaging Sci._, vol. 7, no. 2, pp. 1388–1419, Jan. 2014, doi: [10.1137/130942954](https://doi.org/10.1137/130942954).]. 
	- Demonstrated the applications of Attouch, Jorem Bolte's KL, PPM convergence frameworks. 

#### **Siam Review | Education**

- Nesterov's Method of Convex Optimization^[W. Noel, “Nesterov’s method for convex optimization,” _SIAM Review_, vol. 65, no. 2, pp. 539–562, doi: [10.1137/21M1390037](https://doi.org/10.1137/21M1390037).]. 
- The Reflection Method for the numerical Solution of Linear Systems ^[M. Guida and C. Sbordone, “The Reflection Method for the Numerical Solution of Linear Systems,” _SIAM Rev._, vol. 65, no. 4, pp. 1137–1151, Nov. 2023, doi: [10.1137/22M1470463](https://doi.org/10.1137/22M1470463).].


#### **Theory Papers**

Nesterov Accelerations:
- <mark style="background: #FF5582A6;">Understanding Nesterov's acceleration via proximal point method. </mark>^[K. Ahn and S. Sra, “Understanding nesterov’s acceleration via proximal point method.” arXiv, Jun. 02, 2022. doi: [10.48550/arXiv.2005.08304](https://doi.org/10.48550/arXiv.2005.08304).]

Algorithmic Convergence of Nonconvex KL Functions
-  <mark style="background: #FFB86CA6;">Convergence of descent methods for semi-algebraic and tame problems: proximal algorithms, forward–backward splitting, and regularized Gauss–Seidel methods</mark> ^[H. Attouch, J. Bolte, and B. F. Svaiter, “Convergence of descent methods for semi-algebraic and tame problems: proximal algorithms, forward–backward splitting, and regularized Gauss–Seidel methods,” _Math. Program._, vol. 137, no. 1, pp. 91–129, Feb. 2013, doi: [10.1007/s10107-011-0484-9](https://doi.org/10.1007/s10107-011-0484-9).]. 
	- For PPM related algorithm,
	- in nonexonvex settings, 
	- with KL and semi-algebraic functions. 
- On the convergence of the proximal algorithm for nonsmooth functions involving analytic features ^[H. Attouch and J. Bolte, “On the convergence of the proximal algorithm for nonsmooth functions involving analytic features,” _Math. Program._, vol. 116, no. 1, pp. 5–16, Jan. 2009, doi: [10.1007/s10107-007-0133-5](https://doi.org/10.1007/s10107-007-0133-5).].
	- For PPM related algorithm in nonconvex settings, 
	- with KL and Semi-algebraic functions. 
- A universal catalyst for first order optimizations ^[H. Lin, J. Mairal, and Z. Harchaoui, “A Universal Catalyst for First-Order Optimization,” in _Advances in Neural Information Processing Systems_, Curran Associates, Inc., 2015. Accessed: May 17, 2024. \[Online\]. Available: [https://proceedings.neurips.cc/paper_files/paper/2015/hash/c164bbc9d6c72a52c599bbb43d8db8e1-Abstract.html](https://proceedings.neurips.cc/paper_files/paper/2015/hash/c164bbc9d6c72a52c599bbb43d8db8e1-Abstract.html)]. 
	- For PPM and Nestrov Accelerations. 
- <mark style="background: #FFB86CA6;">New Proximal Point Algorithms for Convex Minimizations</mark> ^[O. Güler, “New Proximal Point Algorithms for Convex Minimization,” _SIAM J. Optim._, vol. 2, no. 4, pp. 649–664, Nov. 1992, doi: [10.1137/0802032](https://doi.org/10.1137/0802032).]. 
- <mark style="background: #FF5582A6;">Monotone Operators and the Proximal Point Algorithm</mark>^[R. T. Rockafellar, “Monotone Operators and the Proximal Point Algorithm,” _SIAM J. Control Optim._, vol. 14, no. 5, pp. 877–898, Aug. 1976, doi: [10.1137/0314056](https://doi.org/10.1137/0314056).]


#### **Applications and Modeling**

- Statistical Problems. 
	- ????
- Forestry and machine learning. 
	- ????

