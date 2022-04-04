[[Master Thesis]]
This is one of the plans I decided to deploy for the master thesis. 

---
### **A More Concrete Plan**

**Part I: Setting Up The Stage**
This part set up the stage for Iterative methods and its analysis in general. It consists of 2 parts. We aim to derive the conjugate gradient algorithm from the ground up. 

**Mathematical Entities (Theorems and Stuff):**
1. Projector (For iterative methods in general), Orthogonal Projector.
	* [[Deeper Look into Projector]], [[Projector Minimizations]]; <span style="color:green">Done</span>
2. Matrix Polynomials, Cayley's Hamilton's Theorem, Minimal Polynomial of a matrix, Chebyshev Polynomials (As an Inf Norm Minimization Property)
	* [[Krylov Subspace]], [[Minimal Polynomial]]; <span style="color:green">Done</span>

**Ideas and Frameworks: **
1. Minimizations of some norms of system of linear functions by choosing a vector from some affine spaces. Derive using calculus, or the idea of projectors (They are the same of course). 
	* [[Taxonomy and Frameworks of Subspace Projection Method]];<span style="color:green">Done</span>
2. Stating the Galerking Frameworks for Subspace methods and observe that these 2 ideas can exactly the same if additional assumptions are added. 
	* The same content as the previous list item, and the additional assumption is about the conjugate gradient algorithm's assumptions. 
3. Derive the Conjugate Gradient Method. Predict its properties, predict the usefulness if some short term recurrence of orthogonalization of conjugate exists. 
	* The proof is here: [[Conjugate Gradient and Oblique Projectors]]; <span style="color:orange">Full orthogonalization discussion missing. Mostly done</span>
4. Add the mention the derivation for Ortho Min and GMRes, which appears at the last section of the paper, and say something interesting about them, cite the sources. 
	* [[GMRes]] <- Optional
	* [[Ortho Min J]] <- Optional <span style="color:green">Done</span>

**Part II:CG and Lanczos*

Go through the details about the relations between the Lanczos Algorithm, Arnoldi Algorithm, and the Conjugate Gradient Algorithms. By details we include the proof for the algorithm, the convergence analysis of the algorithm, code and numerical evidence. 

**State the Lanczos Algorithms**
1. State it it as an Arnoldi Method and then simply show it for the symmetric case. 
	* [[Hessenberg Transform with Arnoldi Iterations]]
	* [[Krylov Matrix QR and Arnoldi Iterations]]: Stating that the $Q_k$ from the iterative anoldi method is the same as performing $Q_k$ on the matrix whose columns are the Krylov Subspace vector. <span style="color:orange">Clearer, organized proof would be neat</span>
	* [[Lanczos Algoritm]]: Simply Transpose and get the Lanczos Algorithm, and Lanczos consquently inhert all properties of Arnoldi Method
2. Use it to connect to ideas developed from the previous parts and show its relations to the conjugate gradient algorithm. Match as many parameters as possible to show how they are related. 
	* [[From Conjugate Gradient to Lanczos Remastered]];The proof is now comleted and filled with detailed explainations. <span style="color:green">DONE!</span>
	* [[From Lanczos to Conjugate Gradient]]:<span style="color:green">Theory is done</span>; <span style="color:orange">~~Code it too Maybe?~~</span>
3. ~~Connect it to the Krylov Subspace analyze it using Krylov Subspace.~~
	* ~~[[Iterative Lanczos and Orthogonal Polynomials]]; Incomplete not sure how to incoperate it for the thesis yet. <span style="color:orange">Maybe adopt this for floating point analysis as well?</span>~~
4. State its lost of orthogonality behaviors under floating points with Numiercal Experiments.
	* <span style= "color:orange;"></span>

**Convergence of Conjugate Gradient**
1. Use Matrix Polynoials and Chebyshev and the grade of the krylov subspace to bound its convergence and the maximum number of iterations before the terminations of the algorithm, assume exact arithmetic. 
	* [[Exact Conjugate Gradient Convergence]]: <span style="color:green">Done</span>. <span style="color:orange">
2. State some special cases where the bound can be improved
	1. Repeated Eigenvalues; discussion in the previous item's bullet point. 
	2. Eigenvalues Clustered Differently on the real line. discussion in the previous item's bullet point. 
3. Numerically Show it using my Julia code (With and without Full Orthogonalizations). <span style="color:green;">DONE</span>
	* Show the exact convergence. 

**Part III: Floating Point Convergence**

We set up and show the analysis for CG under floating point arithemtic. And when we also show how Lanczos loses orthogonality is related for another bound the residual. We demonstrate it with code and numerical evidence. 

1. State the Paige Theorem and use that to bound the convergence of CG over floating point arithemtic. Predict how the spectrum smeared out because of the floating point error. 
	* [[Floats Conjugate Gradient Convergence]] <span style="color:orange">Please add more details for Greenbaum's proof. </span>; 
2. Demonsrate it with code and plots. 
	* <span style="color:green">Done</span>
3. Show exactly how they lose orthogonality. Consider the ritz vectors and the projection of Lanczos Vector onto the ritz vectors. Proof it with help from the references. Cite sources. 
	* [[Lanczos Projection onto Ritz Under Floats]]; <span style="color:orange">Proof read and refine the proof please</span>
4. Demonstrate it with code. 
	* <span style="color:orange">$Q^TQ$ error is done, ghost eigenvalues are done, missing: Ritz Vector Projections</span>
5. State some of the attempts at improving the iterative lanczos process without losing too much speed and precisions under floating point. 
	1. Ritz Vectors orthogonalization Via Lanczos. 
	* <span style="color:pink">!!! Don't work on this until a good draft is out.</span>
