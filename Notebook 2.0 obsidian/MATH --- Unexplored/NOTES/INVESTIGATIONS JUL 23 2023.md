---
alias: Measurability of convex sets in Rn


---
### **Intro**

Looking into measure theory, topologies and and various other stuff. This is a statement of investigations. We want to know why convex sets are measurable in $\mathbb R^n$. 

**Major References**: 

1.  [Math stack exchange discussion](https://math.stackexchange.com/questions/207609/the-measurability-of-convex-sets) on the measurability of convex sets. This is **the Most Promising Route**. Here is a summary of the proof
	> We show the boundary of a convex set has to have a measure of zero. By the dilation of the interior of the convex set and the interior of the convex set, both an open set, we can bound the measure of the boundary, and show that it has zero. 
	
	This proof requires the following ingredient to present 
	1. An open sets in $\mathbb R^n$ is a measurable set. 
		1. [x] 2.6 Borel Sets from the UC Davis's Notes. 
	2. Accessibility lemma for convex set. 
		1. [x] see [Accessibility Lemma](../../AMATH%20516%20Numerical%20Optimizations/CVX%20Analysis/Accessibility%20Lemma.md) for a full proof. 
	3. The completeness of a Lebesgue Measure is used. 
		1. [x] What is completeness and how are the measure we are using in $\mathbb R^n$ is a complete measure? The Lebesgue measure is complete, if a set has measure zero, then all of its subset is measurable. On the other hands, the Borel sets are not complete. 
	1. How to prove that a set is measurable? 
		1. [x] See (1.2) in the auxiliary resource. 

**Auxiliary Resources**: 
1. [Chapter 2 of a lecture notes of UC Davis](https://www.math.ucdavis.edu/~hunter/m206/ch1_measure.pdf) talks about measures in $\mathbb R^n$. [Here](https://www.math.ucdavis.edu/~hunter/measure_theory/measure_notes.pdf) is the entire notes from the professors for the class. We summarize important theorems that are relevant to the convex measurability proof. 
	1. All open sets in $\mathbb R^n$ real measurable is in Proposition 2.20
	2. Theorem 2.24 tells us how to prove that a set in $\mathbb R^n$ is measurable! And it's exactly the proof technique used in (1.) of Major references. 
2. [UBC Math 420 Course Notes](https://personal.math.ubc.ca/~feldman/m420/) for measure theory and integrations.
3. [Measure, Integrations and Real analysis](https://measure.axler.net/MIRA.pdf) by Sheldon Axler is a nice textbook for starting measure theory in $\mathbb R$. 
	1. Heine Borel Theorem about outer measure of intervals on reals. A missing piece for my notes on Measure theory in the reals. 
	2. Sets with zero outer measure are Borel Measurable. 
4. [Waterloo, Math 451](https://www.math.uwaterloo.ca/~krdavids/MT/PMath451Notes.pdf), a complete course notes for measure theory. 
5. [Real Analysis by Stein](http://home.ustc.edu.cn/~matchbox/Real%20Analysis%20Stein.pdf), Stanford series on analysis. 

**Deemed Not Directly Useful**:
1. [Lebesgue Density Theorem](https://en.wikipedia.org/wiki/Lebesgue%27s_density_theorem), partial density sets for measurable sets in the Lebesgue space has measure zero. This is related to the fact that the boundary of the convex set is going to have a fractional measure. Which is not directly useful for our purposes. 
2. [A note](https://link.springer.com/content/pdf/10.1007/BF01202504.pdf) on measurability of convex sets, springer. The argument is way too general for beginners. 

We discuss some of the facts and theorems in details, cite their references and stuff. 

---
### **Measurability of Open Sets on Reals**

We want to show that, all open and closed sets on reals are measurable sets. Require [Measure Theory Basics](../../MATH%20601%20Functional%20Analysis,%20Measure%20Theory/Measure%20Theory%20Basics.md) to understand. This part allows for proving the theorem in $\mathbb R$. 

#### **Thm-1 | All Open and Closed Sets on Reals Are Measurable**
> All open, and closed sets on $\mathbb R$ are Lebesgue measurable sets. 

**Context**

For this theorem, read, [Open Sets are Measurable](https://mathcs.org/analysis/reals/integ/proofs/propmsr.html)

**Proof**

We summarize the main argument. An open set is the union of countably many open intervals in $\mathbb R$, open intervals are measurable and has an outer measure equals to its Lebesgue Measure, intersections of countably many Lebesgue measurable sets are measurable (The Caratheodory Characterizations explained in [Measure Theory Basics](../../MATH%20601%20Functional%20Analysis,%20Measure%20Theory/Measure%20Theory%20Basics.md) thm75), therefore, any open sets in $\mathbb R$ are measurable. 

**Remarks**: 

The proof is not generalizable to outer measure in $\mathbb R^n$. For more information, see the 2.6 Borel Sets section from the UC Davis course notes.  


#### **Thm-2 | Countable Open Covers for All Open sets on Reals**
> All closed, and open sets on $\mathbb R$ can be covered by countably many open intervals that are disjoin. 

**Context**

- This theorem is required for the above theorem. 
- This theorem also made use of the partitioning of sets into equivalence classes using an equivalence relations. See [Equivalence Relations, Class](../../MATH%20000%20Math%20Essential/Abstract%20Algebra/Equivalence%20Relations,%20Class.md) for more information. The second answer for the stack exchange is not using the equivalence classes partition theorem. 

**Proof**

The proofs for the theorem is discussed in [this stack exchange post](https://math.stackexchange.com/questions/318299/any-open-subset-of-bbb-r-is-a-countable-union-of-disjoint-open-intervals). 

---
### **Measurability of Sets in Rn** 

It's not true that theory in $\mathbb R^n$ generalizes directed to $\mathbb R^n$. 


#### **Def-1 | Lebesgue Measurable Sets**
> The set $A$ is measurable when $\mu^*(A\cap E) + \mu^*(A\cap E^C) = \mu^*(A)$ for all $E\subseteq A$. 

**Context**

There are many equivalent definitions for a Lebesgue measurable sets. I am not sure about how to talk about this yet. This is the Caratheodory characterizations of Lebsgue measurable sets. 

### **Thm-5 | Rectangles are Measurable**
> Rectangles in $\mathbb R^n$ are measurable sets. 


#### **Thm-3 | All Open Sets in $\mathbb R^n$ are Measurable**
> Every open set in $\mathbb R^n$ is measurable. 

See page 16 of Stanford series in analysis, (5.) for auxiliary Resources, property 1. The idea is to show that open sets are finite union of rectangles from the set. 


#### **Thm-4 | Zero Outer Measure Are Measurable**
> Sets in $\mathbb R^n$ with a zero outer measure are measurable sets. 

---
### **Convex Sets are Measurable**

Convex sets are measurable in $\mathbb R^n$. 

#### **Thm-0 | Measurability of Convex Sets**
> Convex sets in $\mathbb R^n$ are measurable sets. 

**Proof Summary**

Let $C\subseteq \mathbb R^n$ be a convex set, it can be decomposed into 2 disjoin set $C = C^\circ \sqcup \partial C$, the interior of a set is an open set, hence it's measurable, we show that, the boundary of the set, must have a measure of zero, hence, a measurable sets. Therefore, the whole set is measurable. In this proof, the following proven facts are utilized: 

1. $C = C^\circ \sqcup \partial C$. This should be done with basic topology. 
2. Open sets in $\mathbb R^n$ are measurable sets. Prop 2.20 in \[1\]. 
3. Sets with zero outer measure in $\mathbb R^n$ are measurable sets. (<mark style="background: #FFF3A3A6;">True in $\mathbb R$, but not sure where is this theorem in $\mathbb R^n$</mark>). The proof in $\mathbb R$ seems to be generalizable. 
4. The disjoin union of 2 measurable sets $\subseteq \mathbb R^n$ is a measurable set. 

To prove, combine claim-1 from below, and all the facts from above, both $C^\circ, \partial C$ are measurable, therefore their union is also a measurable set. 


#### **Claim-1 | The Boundary of Convex Sets Has Measure Zero**
> The boundary of the convex sets in $\mathbb R^n$ has a measure of zero, hence, it's a measurable set. 

**Proof**

To prove, we need to assume without loss of generality that the set contains the zero point $\mathbf 0$. This can be done for any non-empty sets via a translation. Next, we assume that the set is bounded. The set is bounded, then the set $\overline C$ has a finite outer measure. This is necessary for bounding the measure. Let $C^\circ$ be the interior of $C$. The set $C = C^\circ \sqcup \partial C$. 

#### **Claim-2 | Squeezing the Boundary with Dilated Interior**

> Consider $1 >\epsilon > 0$, assuming $\mathbf 0 \in C^\circ$, then $C^\circ \subseteq 1/(1 - \epsilon)C^\circ$. 

**WLOG**
1. If the set doesn't have interior and bounded, then it lies in a sub-dimensional space with measure zero. To show that, make 2 $\mathbb R^{n-1}$ affine subspace that is $\epsilon$ apart to contain the set, and since the affine subspace are boundary of this convex set, they have measure zero. The outer measure is a countable union of zeros, which is what we are going to prove. 
	
	> Let $S_\epsilon$ be maximal rectangle the contains the convex set with width of $\epsilon$,then the volume of the set has $\lim_{\epsilon\rightarrow \infty} S_\epsilon = 0$. By $C\subseteq S_\epsilon \forall \epsilon >0$, the set $C$ will have measure zero. 
	>
	> Another approach is to show that subspaces in $\mathbb R^n$ has a zero measure in general. 
1. else If the set is not bounded, then partition the whole space $\mathbb R^n$ into countable many unions to intersect the set, every piece of it will be a convex set, and then go back to (1.)
	
	> A direct way to partition is to use the square $\prod_{i=1}^{n} (k, k + 1], k\in \mathbb N$, and their countable union makes up the entire $\mathbb R^n$. 
3. else, the set must have an interior. Then take any $x_0 \in C^\circ$, then consider $\mathbf 0 \in C^\circ - \{x_0\}$, which is a set with an interior containing $\mathbf 0$. 
We now included all the cases. 

**Proof**

This is a direct consequence from [Accessibility Lemma](../../AMATH%20516%20Numerical%20Optimizations/CVX%20Analysis/Accessibility%20Lemma.md). Next, to show claim-1, using the sub-additivity of outer measure, and the fact that $C^\circ$ has a finite measure, we have 

$$
\begin{aligned}
	\partial C &\subseteq (1 - \lambda)^{-1}C^\circ \setminus C^\circ 
	\\
	m^*(\partial C) &\le 
	m^*((1 - \lambda)^{-1}C^\circ) - m^*(C^\circ)
	\\
	&= (1-\lambda)^{-n}m^*(C^\circ) - m^*(C^\circ)
	\\
	&= ((1 - \lambda)^{-n} - 1)m^*(C^\circ)
	\\
	\implies \lim_{\lambda \searrow 0} m^*(\partial C) 
	&\le 
	m^*(C^*) \lim_{\lambda \searrow 0}((1 - \lambda)^{-1} - 1) = 0,
\end{aligned}
$$

therefore, the boundary of the convex sets has a measure of zero. And hence, it's a measurable set by (3.). By (2.), open sets are measurable sets, hence $C^\circ \sqcup \partial C$ gives a measurable sets by disjoin union of 2 measurable sets are still measurable. 


---
### **A New Proof** 

We summarize a new proof that can lead to nicer handling of the edge cases that we assumed WLOG. This new approach is far more involved, see [Measurability of Convex Sets](../References/Measurability%20of%20Convex%20Sets.pdf) for more information. 

