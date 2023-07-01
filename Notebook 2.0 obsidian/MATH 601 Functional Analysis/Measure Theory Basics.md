We formally introduce some measure theory. This file will follow [Functional Analysis From MIT OCW](References/Functional%20Analysis%20From%20MIT%20OCW.pdf). 


---
### **Intro**

We introduce what we want for a measure. Why such a concept of measure can not be applied for everything in the reals, and what we do to characterize the sufficient conditions for measurable sets, and how they form an algebra, and then sigma-algebra. We then finally show, measurable spaces on the reals and acceptable measures. These ideas need to be constructed so that integral can make sense when we talk about it under different context. Ultimately we want to understand the *Borel Sigma-Algebra*, which makes preprarations for probability spaces. 

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
3. If, $I\subseteq  \mathbb R$, is an interval, then $m^*(I) = l(I)$. The outer measure of an interval is the length. See [This](http://mathonline.wikidot.com/the-lebesgue-outer-measure-of-intervals) for more info we take this for granted. 
4. If $A\subseteq B$, then $m^*(A)\le m^*(B)$. 

Take these facts for granted. All the proofs for the above facts can be found in [Functional Analysis From MIT OCW](References/Functional%20Analysis%20From%20MIT%20OCW.pdf) for more information. 


---
### **Charathedory Criterion**

Carathedory Criterion is the necessary and sufficient conditions. This conditions helps with narrowing the set of all measurable sets. We won't show why, for more information, see [here](https://en.wikipedia.org/wiki/Carath%C3%A9odory's_criterion) for more about the criterion, see [here](https://math.stackexchange.com/questions/1366182/how-does-the-vitali-set-violate-the-definition-of-measurable-sets) for a discussion as to see how Vatali set from the intro is involved. We won't show why we in this file. A set is measurable here would mean that tha set is Lesbesgue measurable. 


#### **Def-2 | A Measurable sets**

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
    \\[1em]
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
    \iff &
    m^*(A\cap (E_1\cup E_2))  +  m^*(A\cap (E_1 \cup E_2)^C) \le 
    m^*(A).
\end{aligned}
$$

The above condition is equivalent to $E_1\cup E_2$ being a measurable set. 

#### **Cor 68.5 | Pair-wise set diff Preserves Measurability**

> If $E_1, E_2$ are both measurable sets, then $E_1\setminus E_2$ is also a measurable set. Because $E_1^C, E_2$ are measurable, so $E_1^C \cup E_2$ measurable, so $(E_1^C \cup E_2)^C$ measurable, so $E_1\cap E_2^C$ measurable which is equivalent to $E_1\setminus E_2$. 

The claim already proved itself. 

#### **Cor 69 | Finite Many Union of Measurable sets is still Measurable**

> It's not hard to just use the above theorem to show that, if $\{E_i\}_{i = 1}^n$ is a set of measurable sets, then their union is still a measurable set. 

**Remarks**

To continue further, we want to discuss the magic of disjoint set, and to do that, we need to construct the idea of a closure. Because, as far as what we showed here, we didn't show that the complement of a measurable set is still a measurable set.

---
### **Algebra, Sigma Algebra**

Using 2 of the basic rules above, we can propagate measurable sets. The definition of an *algebra* capture a set of measurable sets satisfying Caratheodory criterion. They will be defined together in the most simplicity way, forming a sets of sets.  Ultimately, in this section, we want to show that, $\mathcal M$, the set of all measurable sets form a *sigma algebra*, and we also define the *Borel Sigma-algebra*. 


#### **Def-3 | Algebra, Sigma-Algebra**

> Let $\mathcal A$ be an algebra (In our context it's based on $\mathbb R$), it is then, a subset of the power set of $2^{\mathbb R}$ such that, for all $E\in \mathcal A$, $E^C \in \mathcal A$, and for all finite collection of $\{E_i\}_{i = 1}^n$, their union is still $\in \mathcal A$. A sigma-aglebra is a type of algebra, where, countable union of elements is still in the algebra. 

**Observations**

The trivial algebra that is based on any set $\Omega$, has $\mathcal = \{\Omega, \emptyset\}$ as the trivial algebra, and $2^{\Omega}$ being another algebra. By the theorems proved before for measurable sets, the set of all measurable sets on $\mathbb R$ forms an algebra, but not all aglebra based on $\mathbb R$ is consisted of measurable set. As said before, $2^{\mathbb R}$ can't be measured, but, $2^{\mathbb R}$ is an example of an algebra as well. 

**Remarks**
The term semi-aglebra is a type of algebra where it's not closed under complement. 


#### **Example | XOR Countable Sets Sigma Algebra**
> $\mathcal A = \{E\subseteq \mathbb R : E \text{ or } E^C \text{ is countable}\}$ is an sigma algebra. 

**Proof**

The definition makes it clear that it's closed under set complement. In one case Let $E_n$ be a countable sequence of countable set, then $\bigcup_{n\in \mathbb N}E_n$ is still countable, hence it's complement is uncountable, which is stil in the algebra. In the second case, let $E_n$ be a countable sequence of countable or uncountable sets, then $\bigcup_{n\in \mathbb N}E_n$ would be uncountable, select any $E_N$ such that it's uncountable, then $E_N^C$ would be countable, hence we derive

$$
\begin{aligned}
    \left(
        \bigcup_{n\in \mathbb N}E_n
    \right)^C = \bigcap_{n\in \mathbb N}E_n^C \subseteq E_N^C, 
\end{aligned}
$$

which is countable, the union would still be in the algebra. Therefore, this indeed forms a sigma-algebra. 


#### **Lemma 73 | Disjoint Sets from the Algebra Is Measurable**

> Let $E_i$ be a countable collection of elements from the algebra $\mathcal A$, then there eixsts another countable list of $F_i$ that are all disjoint such that $\bigcup_{n\in \mathbb N}E_n = \bigcup_{n\in \mathbb N}F_n$. 

**Proof**

Define $E^\cup_n = \bigcup_{i = 1}^n E_i$, Then consider $F_1 = E_1, F_{n + 1} = E_{n + 1}\setminus E_n^\cup$, then an simple inductive argument will establish the that $\bigcup_{i = 1}^n F_i = E^\cup_n$, with $\{F_i\}_{i = 1}^n$ disjoint, taking the limit, we then had the closure that for any countable sequence of $E_i$, we have the $F_i$ being disjoint and their union are equaled to each other. 

**Remarks**:

Apply this theorem on an algebra of meausrable sets, then we have an disjoin set of measurable sets that partition any countable union of measurable sets. 


#### **Proposition 74 | Measuring with Disjoint Sets**
> Let $A\subseteq \mathbb R$ be arbitrary, let $\{E_i\}_{i=1}^n$ be a set of disjoint measurable sets, then
> $$
> \begin{aligned}
>     m^*\left(
>         A\cap \left(
>             \bigcup_{n\in \mathbb N} E_n
>         \right)
>     \right) = \sum_{ n\in \mathbb N}^{} m^*(A\cap E_n). 
> \end{aligned}
> $$


**Proof**

We prove by induction and the base case $n = 1$ is a trivial case by the definition of an outer measure. Assume that the statement holds true for up to $n$, strong inductive hypothesis. Denote $E_n^\cup = \bigcup_{k = 1}^n E_k$. The strong inductive hypotehsis is 

$$
\begin{aligned}
    m^*\left(
        A\cap E^\cup_n
    \right)&= \sum_{k = 1}^{n} m^*(A\cap E_k). 
\end{aligned}
$$

Consider

$$
\begin{aligned}
    &A\cap E^\cup_{n + 1} \cap E_{n +1} = A\cap E_{n + 1} \text{ by disjoin}
    \\
    & A\cap E^\cup_{n + 1} \cap E_{n + 1}^C = 
    A\cap (E^\cup_{n + 1}\setminus E_{n + 1}) = A\cap E^\cup_{n}. 
\end{aligned}
$$

From $E_{n + 1}$ still measurable, we have

$$
\begin{aligned}
    m^*(A\cap E^\cup_{n + 1}) &= 
    m^*(A\cap E^\cup_{n + 1}\cap E_{n + 1}) + m^*(A\cap E^\cup_{n + 1}\cap E_{n + 1}^C)
    \\
    &=
    m^*(A\cap E_{n + 1}) + m^*(A\cap E^\cup_n)
    \\
    \text{by IH} \implies &= 
    m^*(A\cap E_{n + 1}) + \sum_{k = 1}^{n} m^*(A\cap E_k). 
\end{aligned}
$$

And therefore, for finite amount of disjoin set, it can be used to spread the measure of any sets (Not just measurable iet seems). 


#### **Thm 75 | Collection of Measurable sets Form Sigma Algebra**
> The collection $\mathcal M$ we called earlier, can form a sigma-algebra. It's the set of all measurable sets of $\mathbb R$. 

**Observations**

From corollary 69, it's already clear that, the set $\mathcal M$ forms an algebra, but in addition to that, it's also forming a sig-algebra. Using lemma 73, it reamains to show that, measurability of sets hold after countable infinite union for disjoin set. 


**Proof**

It suffice to only show for $E_i$, a countable sequence of disjoin sets from algebra $\mathcal M$. Denote $E^\cup_n = \bigcup_{k = 1}^n E_k$, and we muse also assume that $E = \bigcup_{n\in \mathbb N}E_n$. From the previous lemma, we know that $E_N^\cup$ is still measurable for some $N\in \mathbb N$, and hence:

$$
\begin{aligned}
    \forall A\subseteq \mathbb R: m^*(A) &= m^*(A\cap E^\cup _N) + 
    M^*(A\cap (E_N^\cup)^C)
    \\
    \quad &
    {\scriptsize
    \begin{aligned}
        E^\cup_N \subseteq E\implies (E^\cup_N)\supseteq E^C, \text{ by property of outer measure}
    \end{aligned}
    }
    \\
    &\ge m^*(A\cap E^\cup_n) + m^*(A\cap E^C)
    \\& \ge \sum_{n = 1}^{N}m^*(A\cap E_n)
    + m^*(A\cap E^C)
    \\
    & \hspace{-1em} N\rightarrow \infty \text{ means}
    \\
    m^*(A) &\ge 
    \sum_{n = 1}^{\infty} m^*(A\cap E_n)
    + m^*(A\cap E^C)
    \\
    m^*(A) &\ge 
    m^*(E) + m^*(A\cap E^C)
    \\
    &= m^*(A\cap E) + m^*(A\cap E^C), 
\end{aligned}
$$


which is the equivalent condition for $E$ being a measurable set. 


---
### **Intervals, And Borel Sigma-Algebra on Reals**
There are many measurable sets on $\mathbb R$, but I think people like talking about intervals. 

#### **Prop 75 | Open Intervals Are Measurable**
> for all $a \in  \mathbb R$, the set $(a, \infty)$ is a measurable set. 

**Proof**

Let $A\subseteq \mathbb R$ be arbitrary. Split it using our interval we make $A-1 = A\cap (a, +\infty)$ and $A_2 = A\cap (-\infty, a]$, if $m^*(A) = \infty$, then it's trivial to show that $(a, \infty)$ is a measurable set. Other wise, consider $\{I_n\}_{n\in \mathbb N}$ be a collection of interval covering $A$, by the definition of the outer measure we have: $\sum_{ n \in \mathbb N}l(I_n) > m^*(A) + \epsilon$ for all $\epsilon > 0$, with $A\subseteq \bigcup_{n \in \mathbb N}I_n$. For each of the covering invertal $I_n$, split it and make interval (either empty, of an interval, which can be clopen...) $J_n  = I_n \cap (a, +\infty), K_n = I_n \cap (-\infty, a)$. Then

1. $A_1 = \bigcup_{n\in \mathbb B}J_n, A_2 = \bigcup_{n\in \mathbb N}K_n$. 
2. $l(I_n) = l(J_n) + l(K_n)$. 

By sub-additivity of the measure

$$
\begin{aligned}
    m^*(A_1) + m^*(A_2) &\le \sum_{ n\in \mathbb N}^{}m^*(J_n)
    \sum_{ n\in \mathbb N}^{}m^*(K_n)
    \\
    &= \sum_{n\in \mathbb N}^{} l(J_n) + l(K_n)
    \\
    &= \sum_{n\in \mathbb N}^{ }l(I_n) 
    \\
    & < m^*(A) + \epsilon, 
\end{aligned}
$$

Taking the limit on $\epsilon$ yield the results of measurability of $(a, \infty)$. 


**Remarks**

We discuss the consequence of the above theorem. Since open set of the form $(a, \infty)$ is measureble, and all measurable set form a sigma algebra, we can claim different type of intervals on $\mathbb R$ also to be measurable sets, consider 

$$
\begin{aligned}
    (-\infty, b)  &= 
    \bigcup_{n\in  \mathbb N}
    (-\infty, b + 1/n]
    \\
    &= \bigcup_{n\in  \mathbb N}
    (b + 1/n, +\infty)^C
    \\
    &= \left(
        \bigcup_{n\in \mathbb N}
        (b + 1/n, +\infty)
    \right)^C, 
\end{aligned}
$$


therefore, by sigma-algebra, $(-\infty, b)$ is also a measurable set, using more sigma-algebra we see

1. Open interval is also measurable because $(a, +\infty)\cap (-\infty, b) = (a,b)$ for all $a < b$. 
2. Closed interval is measurable too due $[a, b] = ((-\infty, a)\cup(b, \infty))^C$ for all $a \le b$, and this would alos include singleton. 
3. $(-\infty, a) = (a, +\infty)^C$, is also measurable. 
4. $[b, +\infty) = (-\infty, b)^C$, is also measurable. 
5. Using 3, 4, it's not hard to see that all bounded clopen intervals are also measurable. 

---
### **Borel-Sigma Algebra**


The borel sigma-algebra is a subset of all measurable sets on $\mathbb R$. To get it we have to generate the sigma algebra for it, or we can defined it in a simpler way using the concept of minimum sigma algebra. 


### **Def-3 | Borel Sigma-Algebra**
> Consider the set $\mathcal S = \{\mathcal A : \mathcal A \text{ is a sigmaalgebra containing all open subsets of } \mathbb R\}$, (for example, $2^{\mathbb R}$ is one element of the set for sure), Then 
> $$
> \begin{aligned}
>     \mathcal B = \bigcap_{\mathcal A \in \mathcal S} \mathcal A, 
> \end{aligned}
> $$
> denotes the smallest sigma-aglebra containing all of the open subsets of $\mathbb R$, this is the *Borel-sigma-algebra*. 


This tutorial ends here. I wrote it intend to understand the high ground of probability spaces. 