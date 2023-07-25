### **Intro**

Functional analysis is just calculus and linear algebra but in generalized spaces such as the normed spaces and Hilbert spaces. The theories goes deep and establishes theorems for spaces such as $C[a, b]$, continuous function over an interval, and $L^2[a, b]$, all Lesbesgue Integral functions over the interval $[a, b]$.

The whole course is kinda based on: 
1. Kryzig's Introduction to Functional analysis. 
2. Notes from Professor Wang for the Math 328 that teaches Analysis II at UBCO. 
3. Various sources on the internet. 
4. A bit of Heinz, Combette's Monotone operator book where more advanced topics were introduced under the context of optimizations in Hilbert spaces. 

Functional analysis has 2 foundations. Vector spaces and metric spaces. The first is of interests because many functions and sequences form a vector space. The second is of interest because it's a generalized norms. From these theories, we build up to wards more useful spaces such as the Hilbert spaces and linear operators in Hilbert spaces. 

---
### **Metric Spaces** 

Metric space describes distance between 2 elements. It's useful because we can talk about relations between any 2 elements, and sequences of elements for any abstract space using the metric. The distance is a positive real number, allowing us to use the power of real analysis to analyze sequences in metric space. We list files for different topics in order for the depth of their discussion. 

- [Metric Space Introduction](Functional%20Spaces/Metric%20Space%20Introduction.md)
	- Metric. 
	- Simple Examples. 
- [Convergence, Completeness in Metric Space](Functional%20Spaces/Convergence,%20Completeness%20in%20Metric%20Space.md)
	- Convergence of a sequence in metric space. 
	- Cauchy sequence. 
	- Accumulation point, completeness and closure of subspaces. 
- [Continuous Mapping in Metric Spaces](Functional%20Spaces/Continuous%20Mapping%20in%20Metric%20Spaces.md)
	- Continuous mapping via epsilon boundedness. 
	- Pre-image of a continuous mapping preserves an open set. 
- [Topology of Metric Space](Functional%20Spaces/Topology%20of%20Metric%20Space.md): 
	- Epsilon Ball, open/closed set. 
	- Separability. 
	- Completeness. 
	- Examples. 
	- Compactness [Compactness in Metric Spaces](Functional%20Spaces/Compactness%20in%20Metric%20Spaces.md), generalized from finite dimensional vector spaces. 
- [Banach Contraction in Metric Space](Functional%20Spaces/Banach%20Contraction%20in%20Metric%20Space.md)
	- Contractive mapping. 
	- Completeness. 
	- Fixed point iterations. 
	- Banach Fixed Point Theorem. 
- [Examples for Metric Space](Functional%20Spaces/Examples%20for%20Metric%20Space.md)
	- A lot of Examples. With proofs and demonstrations. 
	- Focusing on completeness of metric space. Examples are not strictly a metric space, a lot of them are Banach, or the Hilbert space. 
- [Baire Category, Metric Topologies](Baire%20Category,%20Metric%20Topologies.md)
	- A lot more topologies facts and theorems
	- Proved the Baire Category theorem under the context of a metric space. 

---
### **Banach Spaces**

Banach space is a vector space with a norm. The vector space should be quipped with scalar $\mathbb C, \mathbb R$. The norm generalizes the metric from the metric space. 

- [Banach Space Introduction](Functional%20Spaces/Banach%20Space%20Introduction.md)
	- Norm as a metric
	- A complete space
	- Basic brief examples 
- [Completeness, Convergence in Banach Space](Functional%20Spaces/Completeness,%20Convergence%20in%20Banach%20Space.md)
	- Converging norm series criteria for completeness
- [Linear Mapping in Banach Space](Linear%20Mapping%20in%20Banach%20Space.md)
	- Introducing Linear mapping, bounded linear mappings
		- Null space
		- Inverse 
		- Domain
		- Ranks
	- Continuity and Boundedness are the same
	- Closure of domains of linear mapping
	- Null space is closed 
	- Dual spaces, Linear Functionals. 
- [Linear Functionals and Dual Spaces](Linear%20Functionals%20and%20Dual%20Spaces.md)
	- Bounded linear functionals on Banach space
	- The space of linear functionals is also a Banach space
	- Dual space examples with demonstrations

---
### **Hilbert Spaces**

Hilbert space is a type of complete, inner product space. It has to be complete. It has to have an inner product that induces the norm (which consequently creates the Parallelogram law). In this space, inner product strength results about dual spaces, and it allows for certain type of ortho basis to exists for the space. The inner(or Sesquilinear-inner) product is continuous, as demonstrate by the Cauchy Swartchz inequality, and induces euclidean geometry into the space, as demonstrated by the unique projection onto subspace, or convex sets, and the obtuse angle characterization of such a projection point within the space. 

- [Inner Product Space](Functional%20Spaces/Inner%20Product%20Space.md)
	- Parallelogram laws 
	- Inner product induced Norm. 
	- Cauchy Schwarts
	- Continuity of inner product. 
	- Orthogonality. 

- [Hilbert Space Introduction](Functional%20Spaces/Hilbert%20Space%20Introduction.md)
	- Projection Theorem
	- Obtuse angle and orthogonality characterization of subspace projections
	- Complete inner product space
	- Orthonormal basis and Orthonormal sequence
	- Bessel's inequality
	- Total Basis
- [Bilinear Form, Rietz Representations](Bilinear%20Form,%20Rietz%20Representations.md)
	- Rietz representation theorem for bounded linear functionals
	- Bilinear form definition and its norm
- [Linear Mapping in Hilbert Space](Linear%20Mapping%20in%20Hilbert%20Space.md)
	- Hilbert Adjoint and their properties
	- Unitary, Normal, operators
	- Inverses of Adjoint operators
	- Subspace Projection is an Hilbert adjoint operator 

---
### **Important Results**
- [Finite Dimensional Normed Space](Functional%20Spaces/Finite%20Dimensional%20Normed%20Space.md)
	- Important lemmas regarding lower boundedness of basis by coefficients. 
	- The norms are equivalent.
	- All subspaces are closed and complete if the subspace is complete.  
	- Compact Norm ball means finite dimensional spaces. 
	- Sequential Compactness.
- [Strong and Weak Convergences Introduction](Strong%20and%20Weak%20Convergences%20Introduction.md)
	- Motivations. 
	- Theorems in Banach Spaces, Hilbert spaces, and theorems for finite dimensional spaces. 
- [Hahn Banach Theorem and its Corollaries](Hahn%20Banach%20Theorem%20and%20its%20Corollaries.md)
	- A Very important theorem in functional analysis. 
	- Make use the Zorn's lemma. 
- [Baire Category, Metric Topologies](Baire%20Category,%20Metric%20Topologies.md)
	- Attempts to show how much of the topologies can be translated from the Reals to any metric space. Showing that if the metric space 
- [Uniform Boundedness, Open Mapping](Uniform%20Boundedness,%20Open%20Mapping.md)
	- ?????

---
### **Measure Theory**

Some amount of measure theory is required to put the theory of functional analysis into context. 

- [Measure Theory Basics](Measure%20Theory%20Basics.md), introduces the idea of a measure and the measure of sets in the reals, with motivations for context. 

