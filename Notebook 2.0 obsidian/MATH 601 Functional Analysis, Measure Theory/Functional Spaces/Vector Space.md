[Group Basics](../../MATH%20000%20Math%20Essential/Abstract%20Algebra/Group%20Basics.md)

---
### **Vector Space**

A vector space is a set $V$ that are a set of vectors, and **a scalar field** $F$. 
There are a list of axioms that satisfy for the choice of $F, V$. 

#### **Def | Vector Spaces**

> Let $x,y,z$ and $r, s$ be any members of the set $V, F$. 
> Define a multiplications between vectors and scalar, addition between vector and vector, such that the following must be all true: 
> 1. The addition operator for the vectors a group operator and it's abelian. This makes 
> 	1. $x + y = y + x$. Symmetric. 
> 	2. $(x + y) + z = x + (y + z)$. Associative. 
> 	3. $\mathbf 0 + x = x + \mathbf 0 = x$. Additive identity. 
> 	4. $\exists (-x): x + (-x) = \mathbf 0$. Additive inverse. 
> 2. The multiplication between the vector space and the scalar field is compatible so that 
> 	1. $r(sx) = (rs) s$. Associative. 
> 	2. $(r + s)x = rx + sx$. Distributive. 
> 	3. $r(x + y) = rx + ry$. Distributive too. 
> 	4. $1(x) = x$. Scalar identity works. 
> 
> Where, the set $V$ contains the additive identity $\mathbf 0$, and $F$ is strictly a field. 

**Remarks**

Using the language of group theory, for vector space, we anticipate that it's firstly an abelian group under the addition operations, then we also need a scalar field to complement the multiplications operations such that: 
1. Distributive
2. Multiplication Identity
are satisfied for the vector space. 
A generalization where a vector space has a ring instead of a scalar field is a: Module. 

A field itself is a vector space. 
The reader should verify that by considering $F = V$ where both sets are the same field. 
The direct product of same field can provides a vector field. 
Consider $V = F \oplus F$ and $. 
This would give us a vector space as well. 




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