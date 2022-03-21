[[Master Thesis]]
This is one of the plans I decided to deploy for the master thesis. 

---
### **A More Concrete Plan**

**Part I: Setting Up The Stage**
This part set up the stage for Iterative methods and its analysis in general. It consists of 2 parts, the first parts focus on the mathematical entities and the second parts focus on the idea. The objective of this section attempts to conceive the Conjugate Gradient as an iterative method. The goal is to derive it from first principles, predict it's properties and potential behaviors, and put it under the context as one specific instance for a vast assortments of iterative methods. Proof for the algorithm will be given, but it's not in the first part of the paper. 

**Mathematical Entities (Theorems and Stuff):**
1. Projector (For iterative methods in general), Orthogonal Projector.
2. Matrix Polynomials, Cayley's Hamilton's Theorem, Minimal Polynomial of a matrix, Chebyshev Polynomials

**Ideas and Frameworks: **
1. Minimizations of some norms of system of linear functions by choosing a vector from some affine spaces. Derive using calculus, or the idea of projectors (They are the same of course). 
2. Stating the Galerking Frameworks for Subspace methods and observe that these 2 ideas can exactly the same if additional assumptions are added. 
3. Derive the Conjugate Gradient Method (I am still investigating). Predict it's properties, predict the usefulness if some short term recurrence of orthogonalization  of conjugate exists. 
4. Add the mention the derivation for Ortho Min and GMRes, which appears at the last section of the paper, and say something interesting about them, cite the sources. 

**Part II: Lanczos And CG**

Go through the details about the relations between the Lanczos Algorithm, Arnoldi Algorithm, and the Conjugate Gradient Algorithms. By details we include the proof for the algorithm, the convergence analysis of the algorithm, code and numerical evidence. 

**State the Lanczos Algorithms**
1. State it it as an Arnoldi Method and then simply show it for the symmetric case. 
2. Use it to connect to ideas developed from the previous parts and show its relations to the conjugate gradient algorithm. Match as many parameters as possible to show how they are related. 
3. Connect it to the Krylov Subspace analyze it using Krylov Subspace. 
4. State its lost of orthogonality behaviors under floating points. 

**Convergence of Conjugate Gradient**
1. Use Matrix Polynoials and Chebyshev to bond its convergence, assume exact arithmetic. Becareful about some of the details for the proof. 
2. State some special cases where the bound can be improved
	1. Repeated Eigenvalues. 
	2. Eigenvalues Clustered Differently on the real line. 
3. Numerically Show it using my Julia code (With Full Orthogonalizations). 
4. Show the floating points results. 

**Part III: Floating Point Convergence**

We set up and show the analysis for CG under floating point arithemtic. And when we also show how it Lanczos loses orthogonality. We demonstrate it with code and numerical evidence. 

1. State the Paige Theorem and use that to bound the convergence of CG over floating point arithemtic. Predict how the spectrum smeared out because of the floating point error. 
2. Demonsrate it with code and plots. 
3. Show exactly how they lose orthogonality. Consider the ritz vectors and the projection of Lanczos Vector onto the ritz vectors. Proof it with help from the references. Cite sources. 
4. Demonstrate it with code. 
5. State some of the attempts at improving the iterative lanczos process without losing too much speed and precisions under floating point. 
	1. Ritz Vectors orthogonalization Via Lanczos. 
