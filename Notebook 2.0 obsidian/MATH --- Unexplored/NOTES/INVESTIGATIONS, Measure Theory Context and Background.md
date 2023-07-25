### **Intro**

We give an overview of the topics for the start of Measure Theory. More specifically, all the topics relevant to measures for sets in $\mathbb R, \mathbb R^n$, and sets for all measurable sets. As we already saw in [Measure Theory Basics](../../MATH%20601%20Functional%20Analysis,%20Measure%20Theory/Measure%20Theory%20Basics.md), some topics had already been introduced, here, we will clarify the structures of things and make everything clear from above. We are interesting in, what problems we are addressing and how things are related to each other. We list the major references and index them. 

**References**
1. [Measure, Integration & Real Analysis - Sheldon Axler](../../MATH%20601%20Functional%20Analysis,%20Measure%20Theory/References/Measure,%20Integration%20&%20Real%20Analysis%20-%20Sheldon%20Axler.pdf). For a web version of the book, linked [here](https://measure.axler.net/MIRA.pdf). 

**Overview**
1. We motivate the idea of a measure of volume via shortcoming of Riemann integrations. 
2. We focus on the measure of sets in $\mathbb R$. We show it's impossible to have an ideal type of measure defined for all subsets of the reals. 
3. We consider the outer measure, a weaken version of the ideal volume measure. 
4. We state $\sigma$-algebra and its properties, this forms the domain of our measure function. A measure will be defined on this space for compatibility of sets limit. 
5. We state Lebesgue Measure and state the fact that, a sigma algebra on the Borel sets, and the outer measure is able to form a measure space, giving us a safe place where, outer measure adhere to the property of an ideal volume measure. 

---
### **Motivating via Riemann Integrations**

Riemann integrals are not ideal type of integrations. Recall Riemann Integral from your undergraduate introduction to real analysis. It fails under some cases. In chapter 1 of \[1\], examples are used to demonstrate that 
1. [The Dirichlet Function](https://en.wikipedia.org/wiki/Dirichlet_function) is not Riemann integrable even though it should have an area of 1 under the curve. Example 1.14 in \[1\]
2. It doesn't work with unbounded function, the type of improper integral. Example 1.15 in \[1\]
3. Example 1.16 in \[1\]. A series of Riemann Integrable functions failed to converge despite the area of the infinite series make sense. 
4. Point wise limit of a sequence of Riemann integrable function bounded by 1 is not Riemann integrable. Example 1.17. 

**Remark**

(4.) means that, taking the limit of a sequence of functions inside of the integral requires knowing in prior that the limit of the function is in fact, Riemann integrable. To derive a better tool for integrations, which has the ability to: 
* take things more abstractly, 
* allows better compatibility of limits, modern measure theory was made. 

The goal is 2 folds. 

---
### **Ideal Volume Measures**

The abstract approach for Riemann integration is to assign weights to bars by the value of the functions and sum them up, taking the limit to yield the result. Following a similar approach, one can use the function itself to induce an equivalence relation between the domain and codomain to partition the domain of the functions into sets, and assign weights to then by partitioning the codomain of a function. One crucial problem is to assign an abstract sense of "width", or "volume" for the said partitions in the domain. <mark style="background: #FFB86CA6;">This approach has profound complications</mark>. 

#### **Def-1 ([1] 2.1) | The Length**
> We define a sense of volume for any type of open interval in $\mathbb R$
> $$
> l(I) = 
> \begin{cases}
>     b - a & \text{if } I = (b - a) , b > a
>     \\
>     0 & \text{else if } I = \emptyset
>     \\
>     \infty & \text{else if } a, b \in \{\pm\infty\}, b > a
>     \\
>     \text{undef}  & \text{else}
> \end{cases}
> $$

#### **Thm-1 ([1] 2.22) | Non-Existence of a Ideal Volume Measure for $2^{\mathbb R}$**

> There doesn't exist a function $\mu$ satisfying the properties: 
> 1. $\mu: 2^{\mathbb R}\mapsto \mathbb [0, \infty]$. 
> 2. $\mu(I) = l(I)$ for every open interval $I = (a, b)$. 
> 3. $\mu(\bigcup_{i\in I} A_i) = \sum_{i\in I}^{}\mu(A_i)$, where, $(A_i)_{i\in I}$ is a sequence of disjoin set. 
> 4. $\mu(t + A) = \mu(A)$ for every $A\subseteq \mathbb R$, and every $t\in \mathbb R$. 

**Context**

These things are absolutely true for the intervals that partitioning a function of type $\mathbb R\mapsto \mathbb R$, to extend, we want the sense of volume for an interval $(a, b)\subseteq R$ to be extended in an abstract way, hence, the above criterion is considered. 

**Proof**: 

For a proof, see 2.22 in ref \[1\] for more information. The proof highlight the fact that, with conditions (1.), (2.), (4.) true, then the Vatali Set can be constructed to break condition (3.), the disjoin additivity property of the measure function. An important note is that, the existence of this counter example is the result of [Zorn's Lemma](../../MATH%20601%20Functional%20Analysis,%20Measure%20Theory/Zorn's%20Lemma.md), or Axiom of Choice. 


#### **Def-2 ([1] 2.2) | The Outer Measure, A Promising Candidate** 
> The outer measure $m^*$ is defined as the infimum of all the open covers for a set $\in 2^{\mathbb R}$. Mathematically being 
>
> $$
> \begin{aligned}
>       m^*(A) &= \inf \left\lbrace
>       \left.\sum_{n\in \mathbb N}^{} l(I_n) \right| 
>       \{I_n\}_{n\in \mathbb N} \text{ s.t: } A\subseteq \bigcup_{n\in \mathbb N} I_n
> \right\rbrace. 
> \end{aligned}
> $$
> We emphasizes that, the open cover for the set is a countable summation. 

**Context**

This candidate for a measure, have the following properties:
1. It's defined for all set in $2^{\mathbb R}$. This is mentioned in [wikipedia](https://en.wikipedia.org/wiki/Outer_measure). 
2. The length of an open interval is the same as its outer measure. This result is not trivial in $\mathbb R$ and requires the use of [Heine Borel](../../MATH%20000%20Math%20Essential/Analysis/Heine%20Borel.md). 
3. It's sub-additive. However this is strictly weaker than the conditions wanted for the ideal volume measure. 
4. It's translational invariant. 

However, this candidate doesn't satisfy the disjoin union property for the idea volume measure. In fact, the Vatali set is proven to make the outer measure violate the equality of the measure of the whole set, and the sum of measure on all its disjoin part. The proof only made use of property (1.), (2.), (4.), implying that any clever measure we made won't make this counter example go away. 

**Remarks**

For proofs on these claims about the definitions, see \[1\] pg 14-24. 

#### **Closing Remarks**

An ideal type of volume measure for $\mathbb R$ is now impossible. If we still want to use volume measure, there is a need to characterize all sets that allow for condition (3.) for the volume measure. More on that later. 


---
### **Sigma Algebra and an Abstract Sense of Measure** 

We want to stick with the outer measure, and characterizes the subset that makes the sub-additive property of the outer measure having an equality, when dealing with the disjoin unions of sets in $\mathbb R$. Motivate by the fact that we want the theory to work for limits, we define the following concepts for assistance. 


#### **Def-3 ([1] 2.23) | Sigma-Algebra**
> A type of set algebra that is closed under countable complement and union. 

**Context**

This definition helps with capturing the set of all measurable sets. It also extend the simple set of measurable sets into a much larger class of measurable sets. Additionally, limit of sets (or even liminf, limsup) are well defined once a $\sigma$-algebra is defined over the space, this is paramount to discuss limit of integrals for functions, forming the foundations for probability theory. 

**Important Properties**
1. Closed under countable intersections via the use of Demorgan's Law.

#### **Def-5 ([1] 2.54) | A Measure**
> Let $X$ be a set and $\mathcal S$ be a $\sigma$-algebra on $X$. A measure on $(X, \mathcal S)$ is a function $\mu : \mathcal S\mapsto [0, \infty]$ with $\mu(\emptyset) = 0$ and $\mu(\bigcup_{i\in \mathbb N}E_i) = \sum_{i \in \mathbb N}^{} \mu(E_i)$ where $(E_i)_{i\in \mathbb N}$ is a disjoin sequence of sets. 

#### **Def-6 ([1] 2.56) | A Measure Space**
> A measure space is $(X, \mathcal S, \mu)$, it contains a measure, a sigma algebra for the set $X$. 

**Context**

The definition of a measure is very abstract. It has nothing to do with the length of the interval of the volume of something in $\mathbb R^n$ (what we introduced earlier). But it characterizes the missing property of the outer measure as defined before, and the introduction of sigma-algebra allows us to talk about limit of sets for the measure. 

**Observations**

The introduction of this definition allows us to talk about the measure of a limiting sequence of sets. This is possible due to the fact that, the measure is based on $\mathcal S$, the $\sigma$-algebra of some set. 

**Properties**
1. It preserves partial order created by set $\subseteq$ relations. (thm 2.57)
2. It has countable sub-additivity, one of the properties of outer measure. (thm 2.58)
3. Monotone convergence of sets means monotone convergence of measure of the sequence of sets. (thm 2.59, 2.60)


----
### **Lebesgue Measure, A Sanctuary for All in the Reals**

Previously, it's emphasized that, outer measure won't be a measure on $2^{\mathbb R}$, the largest $\sigma$-algebra on $\mathbb R$. 

#### **Def-7 ([1] 2.29) | Borel Set**
> The smallest $\sigma$-aglebra of $\mathbb R$ containing all the open subsets of $\mathbb R$ is the *Borel set*. 

**Observations**

The definition is descriptive and it's not constructive. The existence of such a minimal $\sigma$-algebra that accomplish has details that are unclear. For our purposes, its existence should be assumed. The set where the $\sigma$-algebra that is based on, is the set of all open sets of $\mathbb R$. 


#### **Thm-2 ([1] 2.68) | Outer Measure is a Measure on all Borel Sets**
> Outer measure is a measure on $(\mathbb R, \mathcal B)$, where $\mathcal B$ is the sigma-algebra of the Borel Subsets on $\mathbb R$. 

**Context**

This theorem is crucial for the definition of the Lebesuge measurable, and it's rooted in Borel Measure. 

**Observations**

Borel sets are elements of the $\sigma$-algebra generated on all open sets of $\mathbb R$, and now, all these borel sets, are used again to form a $\sigma$-algebra. As a surprising consequence, the outer measure forms a measure (The legit measure we always wanted) on this set. 

**Remarks**

Borel sets are restrictive compare to all subsets of $\mathbb R$, see Theorem 2.67 in \[1\] for more information on a set that a subset of $\mathbb R$, but not Borel. 

#### **Def-8 ([1] 2.70) | Lebesgue Measurable Sets**
> A set $A\subseteq \mathbb R$ is Lebesgue measurable if there exists a Borel set $B \subseteq A$ such that $m^*(A\setminus B) = 0$. 

**Context**

All Borel sets are Lebesgue measurable. But some Lebesgue measurable sets are not Borel Measurable. 

**Remarks**

There are a lot of equivalences between for a Lebesgue measurable sets as specified above. The list of equivalence is in 2.71 of ref \[1\]. Additionally, the [Caratheodtory Criterion](https://en.wikipedia.org/wiki/Carath%C3%A9odory%27s_criterion) that is not listed there is also equivalent to the definition as above, see [This math stack exchange discussion](https://math.stackexchange.com/questions/2064678/proving-the-caratheodory-criterion-for-lebesgue-measurability) for more information on this claim. The sets that are Lebesgue measurable but not Borel measurable are all sets with measure zero. This fact is stated later in the definition for the Lebesgue measure. 

#### **Thm-2 ([1] 2.72) | Outer Measure is a Measure on Lebesgue Measure Set**
> The set of all, Lebesgue Measurable sets form a $\sigma$-algebra and outer measure on this $\sigma$-algebra is indeed, a legit measure that we desired. 


#### **Def-9 ([1] 2.73)  | Lebesgue Measurable**
> Lebesgue Measure is the outer measure defined on the $\sigma$-algebra of all Lebesgue measurable sets. 


**Remarks**

The Lebesgue measure is not the same thing as the Borel Measure. The Lebesgue measure is that people called: "A completion" of the Borel Measure. For more details about this claim, see this [blog post](https://www.math3ma.com/blog/lebesgue-but-not-borel#:~:text=The%20Basic%20Idea&text=Such%20a%20set%20exists%20because,open%20sets%20and%20zero%20sets.) for more information. Without knowing the details, one should remember the fact that Borel measurable sets are strictly smaller than Lebesgue measure set, and the sets that are L-Measurable but not B-Measurable has an outer measure of zero. 

