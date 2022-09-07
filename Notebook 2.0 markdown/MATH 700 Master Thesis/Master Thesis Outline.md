[Master Thesis](Master%20Thesis.md)
This is one of the plans I decided to deploy for the master thesis. 

---
### **A More Concrete Plan**

**Part I: Setting Up The Stage**
This part set up the stage for Iterative methods and its analysis in general. It consists of 2 parts. We aim to derive the conjugate gradient algorithm from the ground up. 

**Mathematical Entities (Theorems and Stuff):**
1. Projector (For iterative methods in general), Orthogonal Projector.
	* [Deeper Look into Projector](../AMATH%20584%20Numerical%20Linear%20Algebra/Matrix%20Theory/Deeper%20Look%20into%20Projector.md), [Projector Minimizations](../AMATH%20584%20Numerical%20Linear%20Algebra/Projector%20Minimizations.md); <span style="color:green">Done</span>
2. Matrix Polynomials, Cayley's Hamilton's Theorem, Minimal Polynomial of a matrix, Chebyshev Polynomials (As an Inf Norm Minimization Property)
	* [Krylov Subspace](Krylov%20Subspace.md), [Minimal Polynomial](Minimal%20Polynomial.md); <span style="color:green">Done</span>

**Ideas and Frameworks: **
1. Minimizations of some norms of system of linear functions by choosing a vector from some affine spaces. Derive using calculus, or the idea of projectors (They are the same of course). 
	* [Taxonomy and Frameworks of Subspace Projection Method](Taxonomy%20and%20Frameworks%20of%20Subspace%20Projection%20Method.md);<span style="color:green">Done</span>
2. Stating the Galerking Frameworks for Subspace methods and observe that these 2 ideas can exactly the same if additional assumptions are added. 
	* The same content as the previous list item, and the additional assumption is about the conjugate gradient algorithm's assumptions. 
3. Derive the Conjugate Gradient Method. Predict its properties, predict the usefulness if some short term recurrence of orthogonalization of conjugate exists. 
	* The proof is here: [Conjugate Gradient and Oblique Projectors](Conjugate%20Gradient%20and%20Oblique%20Projectors.md); <span style="color:orange">Full orthogonalization discussion missing. Mostly done</span>
4. Add the mention the derivation for Ortho Min and GMRes, which appears at the last section of the paper, and say something interesting about them, cite the sources. 
	* [GMRes](GMRes.md) <- Optional
	* [Ortho Min J](Ortho%20Min%20J.md) <- Optional <span style="color:green">Done</span>

**Part II:CG and Lanczos**

Go through the details about the relations between the Lanczos Algorithm, Arnoldi Algorithm, and the Conjugate Gradient Algorithms. By details we include the proof for the algorithm, the convergence analysis of the algorithm, code and numerical evidence. 

**Convergence of Conjugate Gradient**
1. Use Matrix Polynoials and Chebyshev and the grade of the krylov subspace to bound its convergence and the maximum number of iterations before the terminations of the algorithm, assume exact arithmetic. 
	* [Exact Conjugate Gradient Convergence](Exact%20Conjugate%20Gradient%20Convergence.md): <span style="color:green">Done</span>.
2. State the exact number of iterations needed and connect it to the grade of the Krylov Subspace. 
	1. Repeated Eigenvalues and the grade ; discussion in the previous item's bullet point. Done
	2. Eigenvalues Clustered Differently on the real line. discussion in the previous item's bullet point. Done
3. Numerically Show it using my Julia code (With and without Full Orthogonalizations). <span style="color:green">DONE</span>
	* Show the exact convergence. 

**State the Lanczos Algorithms**
1. State it it as an Arnoldi Method and then simply show it for the symmetric case. 
	* ~~[Hessenberg Transform with Arnoldi Iterations](../AMATH%20584%20Numerical%20Linear%20Algebra/Hessenberg%20Form/Hessenberg%20Transform%20with%20Arnoldi%20Iterations.md)~~
	* ~~[Krylov Matrix QR and Arnoldi Iterations](../AMATH%20584%20Numerical%20Linear%20Algebra/Hessenberg%20Form/Krylov%20Matrix%20QR%20and%20Arnoldi%20Iterations.md): Stating that the $Q_k$ from the iterative anoldi method is the same as performing $Q_k$ on the matrix whose columns are the Krylov Subspace vector. <span style="color:orange">Clearer, organized proof would be neat</span>~~
	* [Lanczos Iteration](../AMATH%20584%20Numerical%20Linear%20Algebra/Hessenberg%20Form/Lanczos%20Iteration.md): Simply Transpose and get the Lanczos Algorithm, and Lanczos consquently inhert all properties of Arnoldi Method
2. Use it to connect to ideas developed from the previous parts and show its relations to the conjugate gradient algorithm. Match as many parameters as possible to show how they are related. 
	* [From Conjugate Gradient to Lanczos Remastered](From%20Conjugate%20Gradient%20to%20Lanczos%20Remastered.md);The proof is now comleted and filled with detailed explainations. <span style="color:green">DONE!</span>
	* [From Lanczos to Conjugate Gradient](From%20Lanczos%20to%20Conjugate%20Gradient.md):<span style="color:green">Theory is DONE!</span>; <span style="color:orange">~~Code it too Maybe?~~</span>
3. ~~Connect it to the Krylov Subspace analyze it using Krylov Subspace.~~
	* ~~[Iterative Lanczos and Orthogonal Polynomials](Iterative%20Lanczos%20and%20Orthogonal%20Polynomials.md); Incomplete not sure how to incoperate it for the thesis yet. <span style="color:orange">Maybe adopt this for floating point analysis as well?</span>~~


**Part III: Floating Point Convergence**

We set up and show the analysis for CG under floating point arithemtic. And when we also show how Lanczos loses orthogonality is related for another bound the residual. We demonstrate it with code and numerical evidence. 
1. State the Paige Theorem and use that to bound the convergence of CG over floating point arithemtic. Predict how the spectrum smeared out because of the floating point error. 
	* [Floats Conjugate Gradient Convergence](Floats%20Conjugate%20Gradient%20Convergence.md) <span style="color:orange">Please add more details for Greenbaum's proof. </span>;
2. Demonsrate it with code and plots. 
	* <span style="color:green">Done</span>
3. Show exactly how they lose orthogonality. Consider the ritz vectors and the projection of Lanczos Vector onto the ritz vectors. Proof it with help from the references. Cite sources. 
	* [Lanczos Projection onto Ritz Under Floats](Lanczos%20Projection%20onto%20Ritz%20Under%20Floats.md); <span style="color:orange">Proof read and refine the proof please</span>
4. Demonstrate it with code. 
	* <span style="color:orange">$Q^TQ$ error is done, ghost eigenvalues are done, missing: Ritz Vector Projections</span>
5. State some of the attempts at improving the iterative lanczos process without losing too much speed and precisions under floating point. 
	1. Ritz Vectors orthogonalization Via Lanczos. 


### **Misc**

[The Energy Norm and the 2-Norm](../AMATH%20584%20Numerical%20Linear%20Algebra/The%20Energy%20Norm%20and%20the%202-Norm.md) <- this theorem is needed for bounding the residual error for the conjugate gradient algorithm. 
	
---
### **Bibiography**



Papers, course notes: 

* FOM Method: [Krylov Subspace Method for Solving Large Unsymmetric System of Equations](References/Krylov%20Subspace%20Method%20for%20Solving%20Large%20Unsymmetric%20System%20of%20Equations.pdf), Y. Saad 

* SYMMQL Method: [Solution of Sparse Indefinite System of Equations](References/Solution%20of%20Sparse%20Indefinite%20System%20of%20Equations.pdf)

* CG: [Methods of Conjugate Gradient for Solving Linear Systems (1952)](References/Methods%20of%20Conjugate%20Gradient%20for%20Solving%20Linear%20Systems%20(1952).pdf)
	
* CG Without the Agonizing Pain: [Painless Conjugate Gradient](References/Painless%20Conjugate%20Gradient.pdf)
	
* Bi-Conjugate Gradient for Non-symmetric system [link](https://archive.org/details/isbn_3540111999/page/73/mode/2up)

---
### **Bibiolography with Summary**

#### Textbooks: 
* Iterative Methods for sparse linear systems
* Demmel's book on numerical linear algebra
* Trefethen's book on numerical linear algebra

[A SHIFTED BLOCK LANCZOS ALGORITHM FOR SOLVING SPARSE SYMMETRIC GENERALIZED EIGENPROBLEMS](References/A%20SHIFTED%20BLOCK%20LANCZOS%20ALGORITHM%20FOR%20SOLVING%20SPARSE%20SYMMETRIC%20GENERALIZED%20EIGENPROBLEMS.pdf)

> State of the art implementations of Lanczos for Symmetric eigenvalue problems in common mathematical software. 

```bibtex

@article{article:shifted_block_lanczos,
author = {Grimes, Roger G. and Lewis, John G. and Simon, Horst D.},
title = {A Shifted Block Lanczos Algorithm for Solving Sparse Symmetric Generalized Eigenproblems},
journal = {SIAM Journal on Matrix Analysis and Applications},
volume = {15},
number = {1},
pages = {228-272},
year = {1994},
doi = {10.1137/S0895479888151111},

URL = { 
        https://doi.org/10.1137/S0895479888151111
    
},
eprint = { 
        https://doi.org/10.1137/S0895479888151111
    
}
,
    abstract = { An “industrial strength” algorithm for solving sparse symmetric generalized eigenproblems is described. The algorithm has its foundations in known techniques in solving sparse symmetric eigenproblems, notably the spectral transformation of Ericsson and Ruhe and the block Lanczos algorithm. However, the combination of these two techniques is not trivial; there are many pitfalls awaiting the unwary implementor. The focus of this paper is on identifying those pitfalls and avoiding them, leading to a “bomb-proof” algorithm that can live as a black box eigensolver inside a large applications code. The code that results comprises a robust shift selection strategy and a block Lanczos algorithm that is a novel combination of new techniques and extensions of old techniques. }
}




```

[BEHAVIORS OF SLIGHTLY PERTURBED LANCZOS AND CONJUGATE GRADIENT](References/BEHAVIORS%20OF%20SLIGHTLY%20PERTURBED%20LANCZOS%20AND%20CONJUGATE%20GRADIENT.pdf)

> Showed by Greenbaum back in 1989 how the polynomial generated from the Lanczos iterations is still orthogonal under floating point, but it's in a different weighted measure in which we refers to as "the tiny intervals". 

```bibtex
@article{paper:greenbaum1989,
	title = {Behavior of slightly perturbed Lanczos and conjugate-gradient recurrences},
	journal = {Linear Algebra and its Applications},
	volume = {113},
	pages = {7-63},
	year = {1989},
	issn = {0024-3795},
	doi = {https://doi.org/10.1016/0024-3795(89)90285-1},
	url = {https://www.sciencedirect.com/science/article/pii/0024379589902851},
	author = {A. Greenbaum},
	abstract = {The Lanczos and conjugate-gradient algorithms use a three-term recurrence to generate polynomials orthogonal with respect to a certain set of weights on the eigenvalues of the matrix. The roots of these polynomials are taken as approximate eigenvalues, and the weighted deviation of the polynomials from zero on the set of eigenvalues is a measure of the error in the approximate solution to a linear system. If this recurrence is perturbed slightly, as, for example, by rounding errors, then the polynomials constructed will no longer be orthogonal with respect to the desired measure. It is shown, however, that the computed polynomials are orthogonal with respect to a slightly different measure—one with weights on a larger set of points, all of which lie very near to eigenvalues of the matrix. This analogy is exploited to gain information about approximate eigenvalues generated by a perturbed Lanczos recurrence and about the rate of convergence of the perturbed conjugate-gradient algorithm. In particular, it is shown that the Chebyshev error bound holds (to a close approximation) for slightly perturbed conjugate-gradient recurrences, and that a sharper error bound can be expressed in terms of the minimax polynomial on a set of small intervals about the eigenvalues of the matrix.}
}

```


[Krylov Subspace Method for Solving Large Unsymmetric System of Equations](References/Krylov%20Subspace%20Method%20for%20Solving%20Large%20Unsymmetric%20System%20of%20Equations.pdf)

> For solving linear system symmetric matrices when the matrix can be indefinite without using the norm equations. By Y. Saad 

[Methods of Conjugate Gradient for Solving Linear Systems (1952)](References/Methods%20of%20Conjugate%20Gradient%20for%20Solving%20Linear%20Systems%20(1952).pdf)

> The very first original paper going through everything about the conjugate gradient algorithms. 

[On Solving Indefinite Symmetric Linear Systems by Means of the Lanczos Methods](References/On%20Solving%20Indefinite%20Symmetric%20Linear%20Systems%20by%20Means%20of%20the%20Lanczos%20Methods.pdf)
> A paper that proves the fact that 2 consequence $T_k$ from the Lanzos iterations are not going to give zero ritz values (under certain conditions), it also give a predictions on floating point arithematic using Tiny Intervals. 

[ON THE RATES CONVERGENCE ON LANCZOS AND BLOCK LANCZOS METHODS](References/ON%20THE%20RATES%20CONVERGENCE%20ON%20LANCZOS%20AND%20BLOCK%20LANCZOS%20METHODS.pdf)
> A convergence bound for the Ritz values coming from the Lanczos iterations by Y. Saad. It improved another bound that is previously showed back in 1966.

```bibtex
@article{doi:10.1137/0717059,
	author = {Saad, Y.},
	title = {On the Rates of Convergence of the Lanczos and the Block-Lanczos Methods},
	journal = {SIAM Journal on Numerical Analysis},
	volume = {17},
	number = {5},
	pages = {687-706},
	year = {1980},
	doi = {10.1137/0717059},

	URL = { 
			https://doi.org/10.1137/0717059

	},
	eprint = { 
			https://doi.org/10.1137/0717059

	}
	,
    abstract = { Theoretical error bounds are established, improving those given by S. Kaniel. Similar inequalities are found for the eigenvectors by using bounds on the acute angle between the exact eigenvectors and the Krylov subspace spanned by \$x\_0 ,Ax\_0 , \cdots ,A^{n - 1} x\_0 \$, where \$x\_0 \$ is the initial vector of the process.All the results obtained are then extended to the block-Lanczos method, and it is shown that the bounds on the rates of the Block version are superior to those of the single vector process. The difference between the two methods is in many respects similar to the difference between the simultaneous iteration method and the single vector power method. Several numerical experiments are described in order to compare the actual rates of convergence with the theoretical bounds. }
}




```

[Painless Conjugate Gradient](References/Painless%20Conjugate%20Gradient.pdf)
> A course notes teaching about the Conjugate gradient methods by deriving it from the conjugate direction method. 

[PREDICTING THE BEHAVIOR OF FINITE PRECISION LANCZOS AND CONJUGATE GRADIENT COMPUTATIONS A. Greenbaum Z.Strakos](References/PREDICTING%20THE%20BEHAVIOR%20OF%20FINITE%20PRECISION%20LANCZOS%20AND%20CONJUGATE%20GRADIENT%20COMPUTATIONS%20A.%20Greenbaum%20Z.Strakos.pdf)
> Greenbaum's and Strakos tiny interval numerical experiments 

```bibtex
@article{doi:10.1137/0613011,
	author = {Greenbaum, A. and Strakos, Z.},
	title = {Predicting the Behavior of Finite Precision Lanczos and Conjugate Gradient Computations},
	journal = {SIAM Journal on Matrix Analysis and Applications},
	volume = {13},
	number = {1},
	pages = {121-137},
	year = {1992},
	doi = {10.1137/0613011},
	URL = {https://doi.org/10.1137/0613011},
	eprint = {https://doi.org/10.1137/0613011},
	abstract = { It is demonstrated that finite precision Lanczos and conjugate gradient computations for solving a symmetric positive definite linear system \$Ax = b\$ or computing the eigenvalues of A behave very similarly to the exact algorithms applied to any of a certain class of larger matrices. This class consists of matrices \$\hat{A} \$ which have many eigenvalues spread throughout tiny intervals about the eigenvalues of A. The width of these intervals is a modest multiple of the machine precision times the norm of A. This analogy appears to hold, provided only that the algorithms are not run for huge numbers of steps. Numerical examples are given to show that many of the phenomena observed in finite precision computations with A can also be observed in the exact algorithms applied to such a matrix \$\hat{A} \$. }
}
```

[Reliable Numberical Computations Chapter 1](References/Reliable%20Numberical%20Computations%20Chapter%201.pdf)
> Part of a text book \<Reliable Numerical Computations\> where it talks about the phenomena of misconvergence of ritz values during Lanczos Iterations

```bibtex
@book{cox1990reliable,
  title={Reliable Numerical Computation},
  author={Cox, M.G. and Cox, M.G. and Hammarling, S.J. and Wilkinson, J.H.},
  isbn={9780198535645},
  lccn={89026658},
  series={Oxford science publications},
  url={https://books.google.com/books?id=CBnvAAAAMAAJ},
  year={1990},
  publisher={Clarendon Press}
}


```

[Solution of Sparse Indefinite System of Equations](References/Solution%20of%20Sparse%20Indefinite%20System%20of%20Equations.pdf)
> The paper that developed SymLQ algorithm for indefinite symmetric systems. 

[The_Lanczos_and_conjugate_gradient_algorithms_in_finite_precision_arithmetic_](References/The_Lanczos_and_conjugate_gradient_algorithms_in_finite_precision_arithmetic_.pdf)
> A survey paper constructed late in the cetury in summary of everything related to CG and Lanczos Iterations.

[Accuracy and Effectiveness of the Lanczos Algorithm for the  Symmetric Eigenproblem](References/Accuracy%20and%20Effectiveness%20of%20the%20Lanczos%20Algorithm%20for%20the%20%20Symmetric%20Eigenproblem.pdf)
> The paper is cited by greenbuam to show the convergence rate for CG under floating point arithematic by bounding the condition number of the tridiagonal matrix. Expression (3.48) is the theorem we aer making use of. 
> At theorem 2.11, the recurrence of the finite precision Lanczos recurrence is stated. 

```bibtex
@article{PAIGE1980235,
	title = {Accuracy and effectiveness of the Lanczos algorithm for the symmetric eigenproblem},
	journal = {Linear Algebra and its Applications},
	volume = {34},
	pages = {235-258},
	year = {1980},
	issn = {0024-3795},
	doi = {https://doi.org/10.1016/0024-3795(80)90167-6},
	url = {https://www.sciencedirect.com/science/article/pii/0024379580901676},
	author = {C.C. Paige},
	abstract = {Eigenvalues and eigenvectors of a large sparse symmetric matrix A can be found accurately and often very quickly using the Lanczos algorithm without reorthogonalization. The algorithm gives essentially correct information on the eigensystem of A, although it does not necessarily give the correct multiplicity of multiple, or even single, eigenvalues. It is straightforward to determine a useful bound on the accuracy of every eigenvalue given by the algorithm. The initial behavior of the algorithm is surprisingly good: it produces vectors spanning the Krylov subspace of a matrix very close to A until this subspace contains an exact eigenvector of a matrix very close to A, and up to this point the effective behavior of the algorithm for the eigenproblem is very like that of the Lanczos algorithm using full reorthogonalization. This helps to explain the remarkable behavior of the basic Lanczos algorithm.}
}
```

[The Lanczos Algorithm with Selective Orthogonalizations](References/The%20Lanczos%20Algorithm%20with%20Selective%20Orthogonalizations.pdf)
> A very affective way of computing Lanczos iterations without the computational expense of full re-orthogonalizations. It seeks to assert the orthogonality of the Lanczos vectors, eliminating ghost eigenvalues. 

```bibtex
@article{article:lanso,
 ISSN = {00255718, 10886842},
 URL = {http://www.jstor.org/stable/2006037},
 abstract = {The simple Lanczos process is very effective for finding a few extreme eigenvalues of a large symmetric matrix along with the associated eigenvectors. Unfortunately, the process computers redundant copies of the outermost eigenvectors and has to be used with some skill. In this paper it is shown how a modification called selective orthogonalization stifles the formation of duplicate eigenvectors without increasing the cost of a Lanczos step significantly. The degree of linear independence among the Lanczos vectors is controlled without the costly process of reorthogonalization.},
 author = {B. N. Parlett and D. S. Scott},
 journal = {Mathematics of Computation},
 number = {145},
 pages = {217--238},
 publisher = {American Mathematical Society},
 title = {The Lanczos Algorithm with Selective Orthogonalization},
 urldate = {2022-05-16},
 volume = {33},
 year = {1979}
}


```