### **Intro**

Here is a an aggregations on what I studied for my master thesis. 

**The basics of Iterative methods**
1. [[Krylov Subspace]]
2. [[Krylov Matrix QR and Arnoldi Iterations]]
3. [[Projector Minimizations]]
4. [[Fields of Values]], [[Numerical Fields of Values]]
5. [[Stationary Iterative Methods]]

**How Are Iterative Methods Made**: 
1. [[Taxonomy of Subspace Projection Method]]

**Iterative Methods**
1. [[Steepest Descend for Matrix Vector]]
2. [[Conjugate Gradient for Dummy]], [[Conjugate Gradient for Advanced Readers]], [[Conjugate Gradient Anne's Version]]
3. [[GMRes]]
4. [[MINRes]]
5. [[Ortho Min]]
6. [[Ortho Min 2]]
7. [[Ortho Min J]]

**The Engine Behind Subspace Methods: Eigen Decompositions**
1. [[Iterative Lanczos and Ortho Polynomials]]
2. [[Hessenberg Transform with Arnoldi Iterations]]
3. [[Bi-Lanczos]]

**Detailed Look into Conjugate Gradient**
1. [[Conjugate Gradient and Lanczos]]
2. [[Conjugate Gradient with Krylov Subspace]]
3. [[From Lanczos to Conjugate Gradient]]
4. [[From Conjugate Gradient to Lanczos]]
5. [[Exact Conjugate Gradient Convergence]]
6. [[Conjugate Gradient Convergence Statmemt of Results]]
7. [[Floats Conjugate Gradient Convergence]]

**Detailed Look into Lanczos Algorithm**
1. [[Ritz Vectors from Lanczos]]
2. [[Lanczos Projection onto Ritz Under Floats]]


----
### **Master Thesis Plan 1: Survey Paper of Iterative Methods**

A paper that focuses on the fundations of iterative methods. Made with the intention of conveying important ideas used for constructing iterative methods and analysis of properties. The paper should cover the following: 
1. State the algorithms 
2. State the important mathematical entities that are useful for undestanding iterative methods; eg: Krylov Subspace, Galerkin Conditions, Iterative Decomposition of Matrices. 
3. Derive the Algorithms: Conjugate Gradient, GMRes, and one other Algorithm Based on the Galerkin's Condition. With code implementations. 
4. Analyze the Algorithms, Place special importance to the relation between Lanczos and Conjugate Gradient. Write code to demonstrate the behaviors of the algorithm under floating point arithetmatic. Address the problems and state how they are overcome with the use of preconditioners and other potential methods. 

### **Master Thesis Plan 2: Go into Connections Between Iterative Methods**
Derive the Methods using norm minimization and Galerkin framework and state the connection between each algorithms. State the connections between these iterative methods. State the Faber Manteuffel theorem at the end. 

1. The Frameworks for Norminimizing and Galerkin Iterative Methods. 
2. Derive All Iterative methods I know well: CG, GMRES, MINRES, QMR; FOM, BiCG. The process of deriving it will show the relations between iterative algorithms and other Eigen system algorithm. Show off some code. 
3. Compare the Norm of Galerkin Based Method and Norm Minimizing Method. 
4. State the new Research Results in Faber Manteuffel Theorem and it's Consequences. 

---
### >> **Master Thesis Plan 3: Full On CG and Lanczos**

Just CG, Just Lanczos, this topic goes deep, dragging in everything I learn along the way with it and demonstrate it with code. 

1. State CG, conceive it, don't prove it. 
	1. Conceive it only from first principal, in a way that leads to the Lanczos Algorithm and short term recurrence naturally. 
	2. Put it under the context of iterative method and states it's importance for conceiving the algorithms in certain ways. 
2. State its relations to Lanczos. 
3. Analyze the convergence rate of the algoritm with exact arithematic (With Numerical Experiment, using Full orthogonalizations). 
	1. Uniform Eigenvalues
	2. With repeated Eigenvalues
	3. Clustered Eigenvalues
4. Analyze the convergence under floating points. Demonstrate it with code. 
	1. Convergence Anaysis and Paige Theorem
	2. Numerical Experiments to demonstrate the lost of orthogonality
5. Use Lanczos to demonstrate the reasons for delayed convergence. Show the spectrum of the intermediate tridiagonal matrix and state how it affects the convergence. Show how loss of orthogonality occured for lanczos orthogonalization. Demonsrate it with code and math. 
6. State some of the way of addressing the issues, such as the preconditiners, or using the converged rizt vectors. Demonsrate it with code (Still in Progress)
7. Non-Linear CG: Just a brief overview. 


---
### **Example Master Thesis**

![[Example_Master_Thesis.pdf]]

The above thesis is an example of what a master thesis looks like. It's a reference for the standards that we should be hitting. 