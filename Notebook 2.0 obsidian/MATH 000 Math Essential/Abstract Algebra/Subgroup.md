[[Group]]

---
### **Intro**

**Definition**
> Let $G$ be a group and if $H\subseteq G$ also forms a group under the same binary operations defined for $G$ then we call it a subgroup. It's denoted as $H\le G$. 

**Trivial subgroup and sharing the identity**

$G$ is a subgroup of itself and $\{e\}$ is a trivial subgroup of any group. Note that since the group $H$ must also contain the identity element, but by uniqueness of identity element, the same $e$ are used for both $H, G$. 

---
### **Intersections and Unions of Subgroup**

**Theorem: Intersction of subgroups is a subgruops**

> Let $H_1, H_2$ be 2 distinct subgroups of group $G$, equipped with operator $\triangleleft$, then $H_1\cap H_2$ is still a subgroup. 

choose any elements $a, b, c\in H_1\cap H_2$ that is not necessarily distinct, then: 
1. $a \triangleleft b \triangleleft c = (a\triangleleft b) \triangleleft c = a\triangleleft (b \triangleleft c)$, this is direct because both $H_1, H_2$ are groups.
2. $e$ the identity element is shared to $H_1, H_2$ from $G$. 
3. $a$ has $a^{-1}$ provided by group $H_1$, $\bar a^{-1}$ provided by $H_2$, since inverses are unique, they are the same and hence the inverse is also in both $H_1, H_2$. 


**Union subgroups are not subgroups**

> Let $H_1, H_2$ be 2 subgroups that has element are not subset of any other, then $H_1\cup H_2$ are not going to be a subgroup in general. 

