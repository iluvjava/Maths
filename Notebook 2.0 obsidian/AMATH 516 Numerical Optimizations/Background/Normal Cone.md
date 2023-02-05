* [[Cone]]
* [[Polar Cone]]

---
### **Intro**


A normal cone is parameterized by a set $Q\subseteq \mathbb{R}^n$ and a point $\bar{x}\in Q$ such that: 

$$
N_Q(\bar{x}) := \left\lbrace
    v \in \mathbb{R}^n: 
    \langle v, x - \bar{x}\rangle \le o(\Vert x - \bar{x}\Vert_2), x\rightarrow \bar{x}\in Q
\right\rbrace
$$

Where, the little $o$ notations denotes the limit that: $\lim_{x\rightarrow \bar{x}} \frac{o(\Vert x - \bar{x}\Vert_2)}{\Vert x - \bar{x}\Vert_2} = 0$. Another Equivalent Definition of the set is given as: 

$$
\left\lbrace
    v\in \mathbb E: 
    \underset{x\rightarrow \bar{x}\in Q}{\lim}
    \frac{\langle v, x - \bar{x}\rangle}{\Vert x - \bar{x}\Vert_2} \le 0 \;\forall x \in Q: x \rightarrow \bar x
\right\rbrace
$$

However, if $x \not\in Q$, for consistency we define $N_Q(x) = \emptyset$. 

**Remarks**

Finally, reader please observe that when with $x\in \text{int}(Q)$ (The relative interior), we would have $N_Q(x) = \{\mathbf 0\}$ which is a singleton, and when $Q$ is just our traditional linear subspaces: $L$, then the normal cone is $L^\perp$. 

Observe that, the normal cone of a cone is just the polar of that cone. see [[Polar Cone]] for more information.

**Intuitively**: Imagine any set of vector that is perpendicular to the velocity of a particle inside of the set $Q$ that is approaching the point $\bar{x} \in Q$. Imagine such a particle in the form point that defines a half space of all the vector making obtuse angle with all elements from the set $Q$. Now imagine infinitely many particles approaching the point $\bar x\in Q$ in all possible continuous paths where their limit of velocity approaching $\bar x$ is $v$, then the intersection of their headlights will form the normal cone $N_Q(\bar x)$. (This interpretation is based on the $\lim\inf$ set convergences)

Under the convex optimization, this normal cone is enough, but there are other types of normal cones, and this one in particular is referred to as the *regular normal cones*, denoted as $\hat N_Q(\bar x)$. 

**References**

Dimitry's 516 textbook, definition 2.34 page 38.  

---
### **Basic Properties**

* Normal cone addition, see [[Normal Cone Addition]]. 
