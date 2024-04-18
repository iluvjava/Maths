- [Monotone Operators Introduction](Monotone%20Operators%20Introduction.md)
- [Firmly Nonexpansive Operators](Firmly%20Nonexpansive%20Operators.md)
- [Lipschitz Operator in Euclidean Space](Lipschitz%20Operator%20in%20Euclidean%20Space.md)
- [Averaged Mapping](Averaged%20Mapping.md)
- [Resolvent Operators](Resolvent%20Operators.md)

---
### **Intro**

The saga starts with the properties for the maximally monotone operators. 
The maximal monotone operators posses certain amount of generality, and it can transform into other type of operators that process single-valued properties, which incubate the operators for potential in real life applications. 
We introduce a list of acronyms for explaining the relations between operators. 

**Acronyms for Operators**
1. MM: Maximal Monotone 
2. Mono: Monotone. 
3. Nexp: Nonexpansive. 
4. F.Nexp: Firmly Nonexpansive. 
5. $\alpha$-Avg: Alpha Averaged. 
6. $\beta$-SMono: Beta strongly monotone. 

Here is an illustration for how resolvent of maximal monotone operators: 

$$
\begin{equation*}
    \begin{array}{ccc}\\
        \text{World 1}&&\text{World 2}
        \\[1em]
        A\text{ max mono}&\longleftrightarrow & \mathcal J_A  
        \\
        \partial_f&\longleftrightarrow&\operatorname{prox}_f
        \\
        N_C&\longleftrightarrow&\operatorname{prox}_C
        \\
        S=-S^*&\longleftrightarrow& \mathcal J_S
    \end{array}
\end{equation*}
$$

Let $A: X \mapsto 2^X \in \{\text{MM}\}$, then we introduce notations 
1. $\mathcal J_A$, is the resolvent. 
2. $\mathcal R_A = 2 \mathcal J_A - I$ is the reflectant. 

For the same $A$, we list the following results to demonstrate its relations to other type of operators. 

**Maximal Monotone In Relations to Other types**

1. $A \in \{\text{MM}\}$. 
2. $\iff (I + A)^{-1} = \mathcal J_A \in \{\text{F.Nexp}\}$
3. $\iff \mathcal R_A = 2 \mathcal J_A - I\in \{\text{Nexp}\}$

**Firmly Nonexpansive In Relations to other Types**

1. $T \in \{\text{F.Nexp}\} = \{\frac{1}{2}\text{-Avg}\}$, full dom. 
2. $\iff I - T \in \{\text{F.Nexp}\}$
3. $\iff T^{-1} \in \{1\text{-SMono}\}$
4. $\iff 2T - I\in \text{\{NExp\}}$, consequence of $\frac{1}{2}$-Avg. 
5. $\iff T^{-1} - I \in \{\text{MM}\}$

**Nonexpansive In Relations to Other Types**
1. $N \in \{\text{Nexp}\}$, full dom. 
2. $\iff T = (1/2)(I \pm N) \in \{\text{F.Nexp}\}$
3. $\implies I + N \in \{\text{MM}\}$
4. $\iff -N \in \{\text{Nexp}\}$. 

**$\alpha$-avg In Relations to other Types**

1. $N \in \{\text{Nexp}\}$, $F_\alpha := (1 - \alpha)I + \alpha N \in \{\alpha\text{-Avg}\}$, for all $\alpha \in [0, 1)$. 
2. $\iff \alpha^{-1}(F_\alpha - (1 - \alpha)I) \in \{\text{Nexp}\}$. 
3. $F_{1/2} \in \{\text{F.Nexp}\} = \{1/2 \text{-Avg}\}$. 


**Remarks**

These relations are all just linear transformation on the graph of the operator. 
We observe that, the class of Firmly Nonexpansive operator seems to be very important. 