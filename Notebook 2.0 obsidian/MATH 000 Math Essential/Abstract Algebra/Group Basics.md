[Equivalence Relations, Class](Equivalence%20Relations,%20Class.md)

---
### **Intro**

We introduced the concept of a binary operations that is generic in the context of abstract algebra, and then we zoom in and see how it specializes to group operations. 

#### **Def 1 (3.1.1) | Binary Operator**
> Let $*$ be a binary operator, then it's a function $S\times S \mapsto S$, then let $a, b, c \in S$, the function satisfies: 
> 1. Associativity, $(a*b)*c = a*(b*c)$. 
> 2. Identity element. which might, or might not exists, might be unique, or it might not. An element is an identity element for the binary operation is an element $e\in S$ such that $e*a = a*e \; \forall a \in S$. 
> 3. An inverse element, which might exists or it might not, which it might be unique or it might not. The element $a \in S$ has an inverse $b$ if $a*b=e= b*a$, requiring the existence of identity for the binary operator first. 

**Note**

1. This definition of binary operations is generic to Field, Rings, and Groups. In groups, some of these properties will be strengthened. We will see that later. 
2. <mark style="background: #FF5582A6;">THIS OPERATION IS NOT SYMMETRIC!</mark>

**Observations**

The logical operator $\implies$, is not an associative binary operations (for the set $\{0, 1\}$)! 

**Remarks | Well Defined Binary Operations**

Sometimes when a binary operations is applied on a set of elements, for example the equivalent class of some equivalence relations induced on the set, then it must be verified that the function maps all element in the equivalent set to the same output, or else, that won't be a binary operation. For example, all $q \in \mathbb Q$ have different representations, but all of the fractions are the same, hence, a binary operations on $\mathbb Q$ will have to be consistent regardless of how a fraction is represented in $\mathbb Q$, $2/2, 3/3$ should be the same number under the binary operator. 

#### **Prop (3.1.3) | Constraints of Identities and Inverses of Binary Opt**

> Let $*$ be an binary operator on the set $S$, then 
> 1. The operation has at most one identity element. 
> 2. If $*$ has the identity element, then the any element in $S$ has at most one inverse. 

**Note**: 

These 2 properties of the bnary operations are also generic to field, rings, or group

**Proof**

Let $e', e$ be 2 identity element in the set $S$, then 
$$
\begin{aligned}
    & ee' = e'
    \\
    & e'e = e
    \\
    \implies &e = e',
\end{aligned}
$$

Assuming that $e$ is the unique identity element for the Binary operation on $S$, then consider $b, b'$ be the inverses for element $a \in S$, then 
$$
\begin{aligned}
    b' = eb' = (ba)b' = b(ab') = be = b, 
\end{aligned}
$$
therefore, if there exists inverses, then the inverse will be unique as well. 


#### **Def 3 (3.1.4) | A Group, or Abelian Group**
> Let $(G, >)$, be a tuple where $G$ is none empty and $>$ is a binary operation on the set $G$, then this is group when the following is satisfied: 
> 1. Closure. 
> 2. Associative Binary operation $>$. 
> 3. Identity. There exists an identity element. 
> 4. Inverses, there exists an inverse for each element in $G$. 
> 
> Additionally, when the binary operations on the set $G$ is symmetric, meaning that $ab = ba$, then it's an Abelian group. 

**Note**

We use $>$ to denote the binary operations to emphasize the detail that, a group doesn't have to have a symmetric binary operation. 

#### **Proposition (3.1.7) | The cancelation property**: 
> Let $(G, >)$ be a group, and $a, b, \in G$, then 
> 1. $a>b = a>c \iff b = c$
> 2. $a>c = b>c \iff a = b$

#### **Def (3.1.10) | The order of a Group**
> The order of a group is just the number of elements in the set $G$, denoted as $|G|$. The order of a group can be infinite. 

---
### **Conjugacy Relations On Group**

We can construct requivalence relations directly from the group definiton. 

#### **Def | Conjugacy Element**
> For element $x, y$ of group $G$, define $x\sim y$ if there exists an element $a\in G$ such that $y = a xa^{-1}$. In this case, we say that $y$ is a *conjugate* of $x$. Then $\sim$ is an equivalence relation on the set $G$. 

**Proof**

Skipped, see example (3.1.7) in the brown book. 


---
### **Illustrative Examples**

#### **Example (3.1.4) | The group of Integers Modulo n**
> Let $n\in \Z$, then the set $Z_n$ is the set of integers modulo $n$, under addition of congruence classes (induced by the n-modulo equivalence relations on $\Z$. ) The group is finite and has $|Z_n| = n$. 

To see that this is indeed a group, we observe that, elements from the equivalence classes are consistent under the addition operations $+$ for $\Z$. For all $x\in [a]_n, y\in [b]_n$, $[x + y]_n = [x]_n + [y]_n = [a]_n + [b]_n$, and hence the binary operation is consistent. Next, we see that this forms a group because $+$ is associative on the equivalence classes obviously. And $[0]_n$ is the identity element for the group, and $[-a]_n$ is the inverse of $[a]_n$. 

#### **The Symmetric Group**

> Symmetric group, denoted as $S_n$ is defined as all bijective functions that maps $[n]$ to $[n]$ $[n] = \{0, 1, 2, \cdots, n - 1\}$). Let $\circ$ be the binary operator of the group, then $S$ defines a set of all functions $f_i : S_n\mapsto S_n$. This group has order $n!$. 

**Observations**
1. $id$ exists and it's the identity mapping on the set $[n]$. 
2. $f^{-1}$ exists for any $f\in S_n$ because it's a bijection. 
3. Functional composition is associative (obvious!), because each function doesn't know whether the input comes directly into the function or it's being passed as an output of another function. 

Symmetric groups for countable and uncountable sets exist too. 


#### **The Generalized Linear Group**

All the square invertible matrices creates an isomorphism between 2 subspaces, and all of these linear mapping creates a group under matrix multiplications. 