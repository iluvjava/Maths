[[Master Thesis]]
This is one of the plans I decided to deploy for the master thesis. 

---
### **A More Concrete Plan**

**Part I: Setting Up The Stage**
This part set up the stage for Iterative methods and its analysis in general. It consists of 2 parts. We aim to derive the conjugate gradient algorithm from the ground up. 

**Mathematical Entities (Theorems and Stuff):**
1. Projector (For iterative methods in general), Orthogonal Projector.
	* [[Projector]], [[Projector Minimizations]]
2. Matrix Polynomials, Cayley's Hamilton's Theorem, Minimal Polynomial of a matrix, Chebyshev Polynomials (As an Inf Norm Minimization Property)
	* [[Krylov Subspace]], [[Minmal Polynomial]]

**Ideas and Frameworks: **
1. Minimizations of some norms of system of linear functions by choosing a vector from some affine spaces. Derive using calculus, or the idea of projectors (They are the same of course). 
	* [[Taxonomy and Frameworks of Subspace Projection Method]]
2. Stating the Galerking Frameworks for Subspace methods and observe that these 2 ideas can exactly the same if additional assumptions are added. 
	* The same content as the previous list item, and the additional assumption is about the conjugate gradient algorithm's assumptions. 
3. Derive the Conjugate Gradient Method. Predict its properties, predict the usefulness if some short term recurrence of orthogonalization of conjugate exists. 
	* The proof is here: [[Conjugate Gradient and Oblique Projectors]]
4. Add the mention the derivation for Ortho Min and GMRes, which appears at the last section of the paper, and say something interesting about them, cite the sources. 
	* [[GMRes]] <- Optional
	* [[Ortho Min J]] <- Optional

**Part II: Lanczos And CG**

Go through the details about the relations between the Lanczos Algorithm, Arnoldi Algorithm, and the Conjugate Gradient Algorithms. By details we include the proof for the algorithm, the convergence analysis of the algorithm, code and numerical evidence. 

**State the Lanczos Algorithms**
1. State it it as an Arnoldi Method and then simply show it for the symmetric case. 
	* [[Hessenberg Transform with Arnoldi Iterations]]: 
	* [[Krylov Matrix QR and Arnoldi Iterations]]: Stating that the $Q_k$ from the iterative anoldi method is the same as performing $Q_k$ on the matrix whose columns are the Krylov Subspace vector. 
	* [[Lanczos Algoritm]]: Simply Transpose and get the Lanczos Algorithm, and Lanczos consquently inhert all properties of Arnoldi Method
2. Use it to connect to ideas developed from the previous parts and show its relations to the conjugate gradient algorithm. Match as many parameters as possible to show how they are related. 
	* [[From Conjugate Gradient to Lanczos]]: <span style="color:red">REFINE THE PROOF PLEASE!</span>
	* [[From Lanczos to Conjugate Gradient]]: <span style="color:orange">Code it too Maybe?</span>
3. Connect it to the Krylov Subspace analyze it using Krylov Subspace. 
	* [[Iterative Lanczos and Orthogonal Polynomials]]
4. State its lost of orthogonality behaviors under floating points with Numiercal Experiments.
	* <span style= "color:red;"> CODE REQUIRED </span>

**Convergence of Conjugate Gradient**
1. Use Matrix Polynoials and Chebyshev to bond its convergence, assume exact arithmetic. Becareful about some of the details for the proof. 
	* [[Conjugate Gradient Convergence Statmemt of Results]] <-- Proofs are linked in there. 
2. State some special cases where the bound can be improved
	1. Repeated Eigenvalues; discussion in the previous item's bullet point. 
	2. Eigenvalues Clustered Differently on the real line. discussion in the previous item's bullet point. 
3. Numerically Show it using my Julia code (With and without Full Orthogonalizations). <span style="color:red;">CODE REQUIRED</span>
	* Show the exact convergence. 
	* Show the Floating Point convergence as well 

**Part III: Floating Point Convergence**

We set up and show the analysis for CG under floating point arithemtic. And when we also show how it Lanczos loses orthogonality. We demonstrate it with code and numerical evidence. 

1. State the Paige Theorem and use that to bound the convergence of CG over floating point arithemtic. Predict how the spectrum smeared out because of the floating point error. 
2. Demonsrate it with code and plots. 
3. Show exactly how they lose orthogonality. Consider the ritz vectors and the projection of Lanczos Vector onto the ritz vectors. Proof it with help from the references. Cite sources. 
4. Demonstrate it with code. 
5. State some of the attempts at improving the iterative lanczos process without losing too much speed and precisions under floating point. 
	1. Ritz Vectors orthogonalization Via Lanczos. 
