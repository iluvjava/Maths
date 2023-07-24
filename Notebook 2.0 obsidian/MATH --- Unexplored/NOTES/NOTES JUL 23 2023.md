Looking into measure theory, topologies and and various other stuff. This is a statement of investigations. 

**References**: 
1. [A note](https://link.springer.com/content/pdf/10.1007/BF01202504.pdf) on measurability of convex sets, springer. 
2.  [Math stack exchange discussion](https://math.stackexchange.com/questions/207609/the-measurability-of-convex-sets) on the measurability of convex sets. This is **the Most Promising Route**. 
	1. An open sets in $\mathbb R^n$ is a measurable set. 
	2. Accessibility lemma for convex set. 

**Auxiliary Resources**: 
1. [UC Davis](https://www.math.ucdavis.edu/~hunter/m206/ch1_measure.pdf), is a class in measure theory from U.C Davis. It talks about the basics of measurability in $\mathbb R^n$. 
2. [Lebesgue Density Theorem](https://en.wikipedia.org/wiki/Lebesgue%27s_density_theorem), partial density sets for measurable sets in the Lebesgue space has measure zero. This is related to the fact that the boundary of the convex set is going to have a fractional measure. 

We discuss some of the facts and theorems in details next. 

---
### **Measurability of Open Sets on Reals** 

We want to show that, all open and closed sets on reals are measurable sets. 

### **Thm | All Open and Closed Sets on Reals Are Measurable**
> All open, and closed sets on $\mathbb R$ are Lebesgue measurable sets. 

**Context**

For this theorem, read
- [Open Sets are Measurable](https://mathcs.org/analysis/reals/integ/proofs/propmsr.html)

**Proof**

We summarize the main argument. An open set is the union of countably many open intervals in $\mathbb R$, open intervals are measurable and has an outer measure equals to its Lebesgue Measure, intersections of countably many Lebesgue measurable sets are measurable (The Caratheodory Characterizations explained in [Measure Theory Basics](../../MATH%20601%20Functional%20Analysis/Measure%20Theory%20Basics.md) thm75), therefore, any open sets in $\mathbb R$ are measurable. 


### **Thm | Countable Open Covers for All Open sets on Reals**
> All closed, and open sets on $\mathbb R$ can be covered by countably many open intervals that are disjoin. 

**Context**

- This theorem is required for the above theorem. 
- This theorem also made use of the partitioning of sets into equivalence classes using an equivalence relations. See [Equivalence Relations, Class](../../MATH%20000%20Math%20Essential/Abstract%20Algebra/Equivalence%20Relations,%20Class.md) for more information. The second answer for the stack exchange is not using the equivalence classes partition theorem. 

**Proof**

The proofs for the theorem is discussed in [this stack exchange post](https://math.stackexchange.com/questions/318299/any-open-subset-of-bbb-r-is-a-countable-union-of-disjoint-open-intervals). 