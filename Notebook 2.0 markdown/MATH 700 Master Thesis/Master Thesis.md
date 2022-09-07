### **Intro**

Here is a an aggregations on what I studied for my master thesis. 

**The basics of Iterative methods**
1. [Krylov Subspace](Krylov%20Subspace.md)
2. [Krylov Matrix QR and Arnoldi Iterations](../AMATH%20584%20Numerical%20Linear%20Algebra/Hessenberg%20Form/Krylov%20Matrix%20QR%20and%20Arnoldi%20Iterations.md)
3. [Projector Minimizations](../AMATH%20584%20Numerical%20Linear%20Algebra/Projector%20Minimizations.md)
4. [Fields of Values](../AMATH%20584%20Numerical%20Linear%20Algebra/Matrix%20Theory/Fields%20of%20Values.md), [Numerical Fields of Values](../AMATH%20584%20Numerical%20Linear%20Algebra/Matrix%20Theory/Numerical%20Fields%20of%20Values.md)
5. [Stationary Iterative Methods](../AMATH%20585%20Numerical%20Analysis%20of%20BVP/Stationary%20Iterative%20Methods.md)

**How Are Iterative Methods Made**: 
1. [Taxonomy and Frameworks of Subspace Projection Method](Taxonomy%20and%20Frameworks%20of%20Subspace%20Projection%20Method.md)

**Iterative Methods**
1. [Steepest Descend for Matrix Vector](../AMATH%20515%20Optimization%20Fundamentals/Steepest%20Descend%20for%20Matrix%20Vector.md)
2. [Conjugate Gradient for Dummy](../AMATH%20515%20Optimization%20Fundamentals/Conjugate%20Gradient%20for%20Dummy.md), [Conjugate Gradient for Advanced Readers](Conjugate%20Gradient%20for%20Advanced%20Readers.md), [Conjugate Gradient Anne's Version](Conjugate%20Gradient%20Anne's%20Version.md)
3. [GMRes](GMRes.md)
4. [MINRes](MINRes.md)
5. [Ortho Min](Ortho%20Min.md)
6. [Ortho Min 2](Ortho%20Min%202.md)
7. [Ortho Min J](Ortho%20Min%20J.md)

**The Engine Behind Subspace Methods: Eigen Decompositions**
1. [Iterative Lanczos and Orthogonal Polynomials](Iterative%20Lanczos%20and%20Orthogonal%20Polynomials.md)
2. [Hessenberg Transform with Arnoldi Iterations](../AMATH%20584%20Numerical%20Linear%20Algebra/Hessenberg%20Form/Hessenberg%20Transform%20with%20Arnoldi%20Iterations.md)
3. [Bi-Lanczos](Bi-Lanczos.md)

**Detailed Look into Conjugate Gradient**
1. [Conjugate Gradient and Lanczos](Conjugate%20Gradient%20and%20Lanczos.md)
2. [Conjugate Gradient with Krylov Subspace](Conjugate%20Gradient%20with%20Krylov%20Subspace.md)
3. [From Lanczos to Conjugate Gradient](From%20Lanczos%20to%20Conjugate%20Gradient.md)
4. [From Conjugate Gradient to Lanczos](From%20Conjugate%20Gradient%20to%20Lanczos.md)
5. [Exact Conjugate Gradient Convergence](Exact%20Conjugate%20Gradient%20Convergence.md)
6. [Conjugate Gradient Convergence Statmemt of Results](Conjugate%20Gradient%20Convergence%20Statmemt%20of%20Results.md)
7. [Floats Conjugate Gradient Convergence](Floats%20Conjugate%20Gradient%20Convergence.md)

**Detailed Look into Lanczos Algorithm**
1. [Ritz Vectors from Lanczos](Ritz%20Vectors%20from%20Lanczos.md)
2. [Lanczos Projection onto Ritz Under Floats](Lanczos%20Projection%20onto%20Ritz%20Under%20Floats.md)


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
### **Master Thesis Plan 3: Full On CG and Lanczos**

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

See: [Master Thesis Outline](Master%20Thesis%20Outline.md) for a more detailed plan. 


---
### **Example Master Thesis**

![Example_Master_Thesis](References/Example_Master_Thesis.pdf)

The above thesis is an example of what a master thesis looks like. It's a reference for the standards that we should be hitting. 