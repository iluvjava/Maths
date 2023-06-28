We formally introduce measure theory. This file will follow [Functional Analysis From MIT OCW](References/Functional%20Analysis%20From%20MIT%20OCW.pdf). 


---
### **Intro**

We introduce what we want for a measure. Why such a concept of measure can not be applied for everything in the reals, and what we do to characterize the sufficient conditions for measurable sets, and how they form an algebra, and then sigma-algebra. We then finally show, measurable spaces on the reals and acceptable measures. These ideas need to be constructed so that integral can make sense when we talk about it under different context. 

#### **What do we want**

A measure constructed on the set $\mathbb R$, is original thought to be a mapping from $2^{\mathbb R}$ the power set of $\mathbb R$. It's meant to measure how big a subset is, relative $\mathbb R$. To do that, there are several things that would, make intuitive sense for a measure to posses. Let $m$ denote the measure that we are about, then we would want: 
1. If we measure the interval (open, closed, or clopen), in the form of $(a, b)$, we should measure out its length, giving us $b - a$. 
2. If $E_n$ gives a sequence of measureable, disjoint subsets of $\mathbb R$, so that $m(\cup_{n\in \mathbb N}E_n) = \sum_{n \in \mathbb N }^{}m(E_n)$. 
3. If have the measure for the set $E\subseteq \mathbb R$, then translatingit will preserve the size on the line, hence, $m(E + x) = m(E)$ for all $x \in  \mathbb R$. 


#### **The fact that it's Impossible**

It's impossible to construct a measure on the set $2^{\mathbb N}$ while satisfying all 3 conditions. This is just the quirks of the real numbers. It's pointing at the illusion of nature of the real line. The counter example that was constructed to break the above concept is called the [Vatali Set](https://en.wikipedia.org/wiki/Vitali_set), it's construction is based on the Axiom of Choice. Therefore, to be able to use the idea, it's a requirement to characterize a subset of $2^{\mathbb R}$, such that a measure can be defined. 

Once a measure is defined, we will soon see that, the set of all measurable sets form a sigma-algebra. Which is justa fancy words for the set algebra we used for events when first learned about probability. And using this sigma-algebra, we can then defined a measure satisfying that conditions described above. To start, we define weaker sense of measure, the outer measure, to capture (1.), a weaker condition of (2.), and (3). 


#### **Def-1 | Outer Measure**

> Let $l$ be a function that only accepts intervals on $\mathbb R$, open, closed, or clopen, and it returns the length of the interval. Then, for any $A \subseteq \mathbb R$, the outer measure is defined to be 
> $$
> \begin{aligned}
>   m^*(A) = \inf \left\lbrace
>       \left.\sum_{n\in \mathbb N}^{} l(I_n) \right| 
>       \{I_n\}_{n\in \mathbb N} \text{ s.t: } A\subseteq \bigcup_{n\in \mathbb N} I_n
> \right\rbrace. 
> \end{aligned}
> $$
> Simply put, it's trying to measure the open interval that cover the any set $A$, and the smallest possible length interval, gives us the outer measure of the set. 

#### **Quick Facts**

1. If $A$ is a subset of $\mathbb R$, then the outer measure of the set $A$, is $m(A) = 0$. (Countable sets are measured zero)
2. $m^*(\cup_{n\in \mathbb N}A_n)\le \sum_{n\in \mathbb N}^{}m^*(A_n)$, for any countable sequence of $A_n$. (Countable Subadditivity)
3. If, $I\subseteq  \mathbb R$, is an interval, then $m^*(I) = l(I)$. The outer measure of an interval is still an interval. 
4. If $A\subseteq B$, then $m^*(A)\le m^*(B)$. 

Take these facts for granted. All the proofs for the above facts can be found in [Functional Analysis From MIT OCW](References/Functional%20Analysis%20From%20MIT%20OCW.pdf) for more information. 


---
### **Charathedory Criterion**

Carathedory Criterion is the necessary and sufficient conditions. This conditions helps with narrowing the set of all measurable sets. We won't show why, for more information, see [here](https://en.wikipedia.org/wiki/Carath%C3%A9odory's_criterion) for more details. We won't show why we in this file. 


#### **Def | A Measurable sets**

> $E\subseteq \mathbb R$ is a measurable set, if, $\forall A\subseteq \mathbb R$, $m^*(A) = m^*(A\cap E) + m^*(A\cap E^C)$. 

**Observations**
1. Combining sub-addtivity property of outer measure, the measurable condition is equivalent to showing that for all $A\subseteq \mathbb R$, we have $m^*(A) \ge m^*(A\cap E) + m^*(A\cap E^C)$, because $m^*(E) = m^*((A\cap E)\cap (A\cap E^C))\le m^*(A\cap E) + m^*(A \cap E^C)$ by sub-additivity of the outer measure. 
2. The definition is symmetric wrt to parameter $E, E^C$. 
3. Trivially, $\mathbb R, \emptyset$ are measurable set. 

#### **Prop 67 | Zero Measure sets are measurable**

> $m^*(E) = 0$ then $E$ is measurable. 

**Proof**

$(A\cap E)\subseteq E$, then $m^*(A\cap E)\le m^*(E) = 0$, then 

$$
\begin{aligned}
    A\cap E^C\subseteq A &\implies m^*(A)\ge m^*(A\cap E^C)
    \\
    &\implies m^*(A)\ge 0 + m^*(A\cap E^C)
    \\
    &\iff 
    m^*(A)\ge m^*(A\cap E) + m^*(A\cap E^C). 
\end{aligned}
$$

Which is the equivalent to $E$ being  a measurable set. 



#### **Proposition-68 | Union of 2 measurable sets is measurable**

> If $E_1, E_2$ are measurable sets, the $E_1 \cup E_2$ is measurable. Let $A\subseteq 2^{\mathbb R}$ be arbitrary, 

**Proof**

Let $A$ be an arbitrary subset of $\mathbb R$, since $E_2$ is a measurable set, we have

$$
\begin{aligned}
    & m^*(A\cap E_1^C)  = m^*(A\cap E_1^C \cap E_2) + m^*(A\cap E_1^C \cap E_2^C)
    \\
    & \text{where }
    \\
    & \quad 
    A\cap E_1\cap E_2^C = A\cap (E_1\cup E_2)^C \leftarrow [(1)]
    \\
    & \quad 
    \begin{aligned}
        A\cap (E_1 \cup E_2) &= 
        (A\cap E_1)\cup (A\cap E_2) 
        \\
        &= (A\cap E_1)\cup (A\cap E_2\cap E_1^C) \leftarrow [(2)]
    \end{aligned} 
\end{aligned}
$$

By the property of an outer measure, we have 

$$
\begin{aligned}
    m^*(A\cap (E_1\cup E_2)) &\le 
    m^*(A\cap E_1) + m^*(A\cap E_2 \cap E_1^C) \quad\text{ by [(1)], [(2)]}
    \\
    &= 
    m^*(A) - m^*(A\cap E_1^C) + m^*(A\cap E_2 \cap E_1^C) \quad \text{ by } E_1 \text{ measurable}
    \\
    &= m^*(A) - (m^*(\textcolor{red}{A\cap E_1^C}) - m^*(\textcolor{red}{A\cap E_1^C} \cap E_2))
    \\
    &= m^*(A) - m^*(A\cap E_1^C \cap E_2^C) \quad \text{ by } E_2 \text{ measurable}
    \\
    &= m^*(A) - m^*(A\cap (E_1 \cup E_2)^C) 
    \\
    \iff 
    m^*(A\cap (E_1\cup E_2))  +  m^*(A\cap (E_1 \cup E_2)^C) &\le 
    m^*(A).
\end{aligned}
$$

The above condition is equivalent to $E_1\cup E_2$ being a measurable set. 

#### **Cor 68.5 | Pair-wise set diff Presevers Measuribility**

> If $E_1, E_2$ are both measurable sets, then $E_1\setminus E_2$ is also a measurable set. Because $E_1^C, E_2$ are measurable, so $E_1^C \cup E_2$ measurable, so $(E_1^C \cup E_2)^C$ measurable, so $E_1\cap E_2^C$ measruable which is equivalent to $E_1\setminus E_2$. 

The claim already proved itself. 

#### **Cor 69 | Finite Many Union of Measurable sets is still Measurable**

> It's not hard to just use the above theorem to show that, if $\{E_i\}_{i = 1}^n$ is a set of measurable sets, then their union is still a measurable set. 

**Remarks**

To continue further, we want to discuss the magic of disjoint set, and to do that, we need to construct the idea of a closure. Because, as far as what we showned here, we didn't show that the complement of a measurable set is still a measurable set. 

---
### **Algebra, Sigma Algebra**

Using 2 of the basic rules above, we can propagate measurable sets. The definition of an algebra capture a set of measurable sets satisfying Caratheodory criterion. They will be defined together in the most simplicity way, forming a sets of sets. 


#### **Def-2 | Algebra, Sigma-Algebra**

> Let $\mathcal A$ be an algebra (In our context it's based on $\mathbb R$), it is then, a subset of the power set of $2^{\mathbb R}$ such that, for all $E\in \mathcal A$, $E^C \in \mathcal A$, and for all finite collection of $\{E_i\}_{i = 1}^n$, their union is still $\in \mathcal A$. A sigma-aglebra is a type of algebra, where, countable union of elements is still in the algebra. 

**Observations**

The trivial algebra that is based on any set $\Omega$, has $\mathcal = \{\Omega, \emptyset\}$ as the trivial algebra, and $2^{\Omega}$ being another algebra. By the theorems proved before for measurable sets, the set of all measurable sets on $\mathbb R$ forms an algebra, but not all aglebra based on $\mathbb R$ is consisted of measurable set. As illterated before, $2^{\mathbb R}$ can't be measured, but, $2^{\mathbb R}$ is an example of an algebra as well. 


#### **Example | XOR Countable Sets**
> $\mathcal A = \{E\subseteq \mathbb R | E \text{ or } E^C \text{ is countable}\}$ is an sigma algebra. 

#### **Lemma 73 | Disjoint Sets from the Algebra**



