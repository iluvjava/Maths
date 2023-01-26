### **Vector Space**

A vector space is a set $V$ that are of what we call vectors, and **a scalar field** $F$. There are a list of axioms to satisfy for the choice of $F, V$. Let $x,y,z$ and $r, s$ be any members of the set $V, F$, define a multiplications between vectors and scalar, addition between vector and vector, then the following must be true: 

$$
\begin{aligned}
    & x + y = y + x
    \\
    & (x + y) + z = x + (y + z)
    \\
    & \mathbf 0 + x = x + \mathbf 0 = x
    \\
    & \exists (-x): x + (-x) = \mathbf 0
    \\
    & (r)(sx) = (rs)x
    \\
    & (r + s)x = rx + sx
    \\
    & r(x + y) = rx + ry
    \\
    & 1(x) = x
\end{aligned}
$$

Where, the set $V$ contains the additive identity $\mathbf 0$. 

**Remarks**

Using the language of group theory, for vector space, we anticipate that it's firstly an abelian group under the addition operations, then we also need a scalar field to complement the multiplications operations such that: 
1. Distributive
2. Multiplication Identity
are satisfied for the vector space. A generalization where a vector space has a ring as its scalar field is a "Module". 


---
### **Technical Subtleties**

**Complete And Incomplete**: 

> The set of vector space can be complete if all Cauchy sequence converges to a given element in the set, else the set is incomplete. 

**Finite Fields**:

> Take note that the set $F$ is a scalar field, and it can be a finite field too. 

**Lacks of Inner Product**:
> The definition above lacks the requirement for an inner product for the vectors. 


---
### **Examples**

**Linear Operator**
* A linear transformations that links between 2 vector spaces is itself, in a vector space. 

**Euclidean Space**
* Finite dimension real vectors are in Euclidean space, which is an instance of a vector space. 