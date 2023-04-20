[Group Basics](Group%20Basics.md)

---
### **Intro**

**Definition**
> Let $G$ be a group and if $H\subseteq G$ also forms a group under the same binary operations defined for $G$ then we call it a subgroup. It's denoted as $H\le G$ (Sometimes people use $\preceq$ too). 

**Trivial subgroup and sharing the identity**

$G$ is a subgroup of itself and $\{e\}$ is a trivial subgroup of any group. Note that since the group $H$ must also contain the identity element, but by uniqueness of identity element, the same $e$ are used for both $H, G$. 

---
### **Intersections and Unions of Subgroup**

The rigid structure of group doesn't permit much ways subgroups can interact with each other arbitrarily. 

**Theorem: intersections of subgroups is a subgroups**

> Let $H_1, H_2$ be 2 distinct subgroups of group $G$, equipped with operator $\triangleleft$, then $H_1\cap H_2$ is still a subgroup. 

choose any elements $a, b, c\in H_1\cap H_2$ that is not necessarily distinct, then: 
1. $a \triangleleft b \triangleleft c = (a\triangleleft b) \triangleleft c = a\triangleleft (b \triangleleft c)$, this is direct because both $H_1, H_2$ are groups.
2. $e$ the identity element is shared to $H_1, H_2$ from $G$. 
3. $a$ has $a^{-1}$ provided by group $H_1$, $\bar a^{-1}$ provided by $H_2$, since inverses are unique, they are the same and hence the inverse is also in both $H_1, H_2$. 


**Theorem: Union subgroups are not subgroups**

> Let $H_1, H_2$ be 2 subgroups that has element are not subset of any other, then $H_1\cup H_2$ are not going to be a subgroup in general. 

By the assumption that neither of which is a subset of the other, we have $h_1 \in H_1\setminus H_2; h_2 \in H_2\setminus H_1$, then we consider $h_1\triangleleft h_1$ by cases. $h_1\triangleleft h_2$ cannot be in $H_1\setminus H_2$, because if that is the case, then $\exists \; \bar h_1 = h_1\triangleleft h_2 \implies \bar h_1\triangleleft h_1 = h_2$, and by closure we have $h_2 \in H_1$, which is a contradiction. Similarly, $h_1\triangleleft h_2 \not\in H_2\setminus H_2$. Finally assume $h_1\triangleleft h_2 \in H_1\cap H_2$ then

$$
\begin{aligned}
    h_2 \triangleleft h_2 &\in H_1 \cap H_2
    \\
    h_2^{-1}\triangleleft h_2 &\triangleleft h_1 \in H_1\cap H_2
    \\
    h_1 &\in H_1\cap H_2, 
\end{aligned}
$$

which is a contradiction. At one 2 we can multiply by $h_2^{-1}$ because $h_2 \in H_1\cap H_2$. 


---
### **Examples of Subgroups**


