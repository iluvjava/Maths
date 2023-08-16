- [Bayes Theorem for Baby](Bayes%20Theorem%20for%20Baby.md), 
- [Conditional Probability, Expectations](Conditional%20Probability,%20Expectations.md), 

---
### **Intro**

Probability Independence, is extremely important. We also derive the Naive Bayes classifier based on the assumptions of independent events. Some of these materials will be based on [here](http://faculty.washington.edu/fm1/394/Materials/2-3indep.pdf), notes from UW math 394. Throughout this file, we use $P$ to denote the probability measure of events. 

### **Def | Independence Between 2 Events**
> 2 events, $A,B$ are independent, denoted using $A\perp B$ means that $P(A\cap B) =  P(A) P(B)$. 

**Observations**

Observe that this generates a lot of consequences when combined with the results from Bayes Theorem and conditional probability. 

1. $A\perp B$ means $P(A|B) = P(A\cap B)/P(B) = P(A)P(B)/P(B) = P(A)$. 
2. The converse of above is also true, if $P(A|B) = P(A)$, then $A\perp B$. 
3. By a similar token from Bayes theorem, $A\perp B$ means $P(A\cap B|C) = P(A|C)P(B|C)$
4. We may also make a simple multi-class Bayes theorem, let $C\perp D$, consider: 
    $$
    \begin{aligned}
        P(A|C\cap D) &= \frac{P(C\cap D|A)P(A)}{P(C)P(D)}
        \\
        &= \frac{P(C|A)P(D|A)P(A)}{P(C)P(D)}.
    \end{aligned}
    $$
    Which can be generalized to more than 2 independent events.
4. Independence also allow us to split on the conditional part of the probability. Let $A\perp B, A'\perp B$, and $A\cap A' \perp B$, then we have
    $$
    \begin{aligned}
        P(A|A'\cap B) &= \frac{P(A\cap A'\cap B)}{P(A'\cap B)}, \text{by Bayes}
        \\
        &= \frac{P(A\cap A')P(B)}{P(A')P(B)}= P(A|A'),  \text{by Indep}
    \end{aligned}
    $$
    so we can condition only on the events that it's not independent. 


#### **Def | Mutually Independent**
> For a sequence of events $(A_i)_{i=1}^n$, they are mutually independent when $P\left(\bigcap_{i\in I}^nA_i\right) = \prod_{i\in I}P(A_i)$, for all $I\subseteq \{1, \cdots, n\}$. 

**Observations**: 

Obviously, this is a much stronger condition than pair-wise independent. For counter examples, 
see [here](http://faculty.washington.edu/fm1/394/Materials/2-3indep.pdf) for more. Additionally, $A\perp B, A\perp C\not\implies (A\perp B\cup C) \vee (A\perp B\cap C)$ is true in general. 


#### **Thm | Sufficient Conditions for Mutual Independent Events**

> Let $\{E_i\}_{i=1}^n$ denotes a sequence of events, then the set of events are mutually independent if and only if we have 
> $$
> \begin{aligned}
>     P\left(\bigcap_{i = 1}^n A_i\right) &= \prod_{i = 1}^{n} P(A_i) \quad \forall A_i \in \{E_i, E_i^C\}, i \in \{1, \cdots, n\}. 
> \end{aligned}
> $$

**Proof**

Let $I\subseteq [n]$ be arbitrary subsets, where $[n] = \{1, \cdots, n\}$, then let $A_i = E_i$ whenever $i \in I$, and $A_i = E_i^C$ whenever $i\in I^C$. Then consider 

$$
\begin{aligned}
    P\left(
        \bigcap_{i\in I} E_i
    \right) &= 
    P\left(
        \left(
            \bigcap_{i\in I}E_i
        \right)\cap 
        \left(
            \bigcap_{i\in I^C} E_i
        \right)
        \dot\cup
        \left(
            \bigcap_{i\in I}
            E_i
        \right)\cap 
        \left(
            \bigcap_{i\in I^C} E_i^C
        \right)
    \right)
    \\
    &= 
    P\left(
        \left(
            \bigcap_{i\in I}E_i
        \right)\cap 
        \left(
            \bigcap_{i\in I^C} E_i
        \right)
    \right) + 
    P\left(
        \left(
            \bigcap_{i\in I}
            E_i
        \right)\cap 
        \left(
            \bigcap_{i\in I^C} E_i^C
        \right)
    \right)
    \\
    &= 
    \prod_{i = 1}^{n} P(E_i) + 
    \prod_{i\in I}^{} P(E_i) \prod_{i \in I^C}^{} 1 - P(E_i)
    \\
    &= 
    \left(
        \prod_{i \in I}^{}P(E_i)
    \right) \left(
        \prod_{i \in I^C}^{} P(E_i)
        + 
        \prod_{i\in I^C}^{} 1 - P(E_i)
    \right)
    \\
    &\quad  {\scriptsize
        \text{ Note that:}
        \left(
            \bigcap_{i\in I^C}^{}E_i
        \right)\dot\cup \left(
            \bigcap_{i\in I^C}^{}E_i^C
        \right) = \Omega, \text{ The entire event space}
    }
    \\
    \implies &= 
    \prod_{i \in I}^{} P(E_i), 
\end{aligned}
$$

by the fact that $I\subseteq [n]$ is arbitrary, this condition is equivalent to the definition of mutually independent events. 


---
### **Multi-Class Bayes Theorem**

A bayes classifier is the simplest form of machine learning ideas, it relates the probability dependence between discrete classes of random variables. To derive a formula for it, we consider that there are 2 types of events, the labels, and attributes. Let $\mathcal A_1\times \mathcal A_2\times \cdots \times \mathcal A_n$ be a cross product of discrete atrributes, finite, denoting all possible observations for the sequence of attributes (They are random variables) $(A_1, A_2, \cdots, A_n)$. Similary, let $\mathcal L_1\times \mathcal L_2, \cdots, \mathcal L_m$ be the space for class of labels for the data, discrete and finite, let the labels be a list of random variables in the form of $(L_1, L_2, \cdots, L_m)$. We also assume that the events of observing these attributes are complete independent of each other. To clarify, I mean that let $I\subseteq [n]$ be arbitrary, and let $\mathcal A_i'\subseteq \mathcal A_i$ for $i\in I$, then 

$$
\begin{aligned}
    P\left(
        \bigcap_{i\in I} \{A_i\in \mathcal A_i'\}
    \right) = \prod_{i\in I}^{} P(A_i \in \mathcal A'_i). 
\end{aligned}
$$

With this assumption, we derive the probability of observing some specific set of labels, given the probability of observing some specific set of atrributes. We now denote the events of observing spcific labels given a list of specific attributes. 
Define $L_i' = \{L_i = l_i\}, A_i' = \{A_i = a_i\}$, then the conditional probability of observing some specific labels given some specific attributes can be computed by

$$
\begin{aligned}
    P\left(
        \left.\bigcap_{i = 1}^m L_i' \right| 
        \bigcap_{i=1}^n A_i'
    \right)
    &= 
    \frac{\prod_{i = 1}^m \mathbb P
    \left(
        L_i' \cap \left(
            \bigcap_{j = 1}A_j'
        \right)
    \right)}{
        P\left(
            \bigcap_{i = 1}^n A_i'
        \right)
    }
    \\
    &= 
    \frac{\left(
        \prod_{i = 1}^m 
        P\left(
            \left.\bigcap^{n}_{j = 1}A'_j \right| 
            L_i'
        \right)
        P(L_i')
    \right)}{
        \prod_{i = 1}^{n} P(A_i')
    }
    \\
    &= 
    \frac{\prod_{i = 1}^{m} \prod_{j = 1}^{n}
        P(A_j'| L_i')P(L_i')}{\prod_{i = 1}^{n} P(A_i')}, 
\end{aligned}
$$

Where, the conditional probability has been decomposed into estimating the probability of $P(A'_j | L_i), P(A_j'), P(L_i')$, which is much easier since they are all higher probability events to observe the conditioning on any specific combinations of labels, or attributes, and this can be directly gotten in the data, as long as, we had at least, observed occurrences of data between at least, each pair of $a_j, l_i$. 


---
### **Independent Random Variables**

It's best to illustrate some of the properties of mutually independent random variables from what we discussed above. Recall [Random variable Distribution function](../../AMATH%20561%20Probability%20Theory/Probability%20Basics/Random%20Variables%20as%20Measurable%20Functions.md) for a basic coverage of a random variable. Additionally, we need [Probability Spaces](../../AMATH%20561%20Probability%20Theory/Probability%20Basics/Probability%20Spaces.md) as well. 

#### **Def | Independent Random Variables**
> Two random variables $X, Y$, Let $\mathcal R$ be a sigma algebra such that for all $A\in \mathcal R, B \in \mathcal R$, we have $P(X\in A, Y\in B) = P(X\in A)P(Y\in B)$. For this section, we follows Rick Durrett's Probability, Theories and Applications, chapter 2. 

#### **Def | Sigma Algebra Independence**
> Two $\sigma$-algebra, $\mathcal F, \mathcal G$ are independence if for all $A\in \mathcal F, B\in \mathcal G$, we have $A\perp B$. The events are independent of each other. 



