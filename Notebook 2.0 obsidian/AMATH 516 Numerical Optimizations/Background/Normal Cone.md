* [[Cone]]
* [[Polar Cone]]

---
### **Variational Normal Cone**

A <span style="color:red">variational normal cone</span>  is parameterized by a set $Q\subseteq \mathbb{R}^n$ and a point $\bar{x}\in Q$ such that: 

> $$
> N_Q(\bar{x}) := \left\lbrace
>     v \in \mathbb{R}^n: 
>     \langle v, x - \bar{x}\rangle \le o(\Vert x - \bar{x}\Vert_2), x\rightarrow \bar{x}\in Q
> \right\rbrace
> $$

Where, the little $o$ notations denotes the limit that: $\lim_{x\rightarrow \bar{x}} \frac{o(\Vert x - \bar{x}\Vert_2)}{\Vert x - \bar{x}\Vert_2} = 0$. Another Equivalent Definition of the set is given as: 

> $$
> N_Q(\bar x):= 
> \left\lbrace
>     v\in \mathbb E 
>     \left|
>       \underset{x\rightarrow \bar{x}\in Q}{\lim\sup}
>       \frac{\langle v, x - \bar{x}\rangle}{\Vert x - \bar{x}\Vert_2} \le 0 \;\forall x \in Q: x \rightarrow \bar x
>       \right.
> \right\rbrace
> $$

However, if $x \not\in Q$, for consistency we define $N_Q(x) = \emptyset$. 

**Remarks**

Finally, reader please observe that when with $x\in \text{int}(Q)$ (The relative interior), we would have $N_Q(x) = \{\mathbf 0\}$ which is a singleton, and when $Q$ is just our traditional linear subspaces: $L$, then the normal cone is $L^\perp$. 

Observe that, the normal cone of a cone is just the polar of that cone. see [[Polar Cone]] for more information.

**Intuitively**: Imagine any set of vector that is perpendicular to the velocity of a particle inside of the set $Q$ that is approaching the point $\bar{x} \in Q$. Imagine such a particle in the form point that defines a half space of all the vector making obtuse angle with all elements from the set $Q$. Now imagine infinitely many particles approaching the point $\bar x\in Q$ in all possible continuous paths where their limit of velocity approaching $\bar x$ is $v$, then the intersection of their headlights will form the normal cone $N_Q(\bar x)$. (This interpretation is based on the $\lim\inf$ set convergences)

Under the convex optimization, the convex normal cone is enough (Which will be introduced later), the above definition is from Jame burkes and Demitri's textbook, in other literatures such as Boris monograph, we refers to the *regular normal cones*, denoted as $\hat N_Q(\bar x)$, and it's not exactly the same as the above definition. I am unsure whether they are exactly the same or not. 

**References**

Dimitry's 516 textbook, definition 2.34 page 38.  

---
### **Convex Normal Cone**

> Under certain conditions, it suffice to understand the matter using just the convex normal cone to reduce the scope of things. We define a convex normal cone for a subset $C$ of the Euclidean space to be the following: 
> 
> $$
> \begin{aligned}
>     N_C(\bar x) = 
>     \begin{cases}
>         \emptyset & x\not\in C
>         \\
>         \{u| \langle y - \bar x, u\rangle \le 0\;\forall y\in C\} & \text{else}, 
>     \end{cases}
> \end{aligned}
> $$

when the set $C$ is a convex set, the variational normal cone reduces to the convex normal cone. 

**References**

Heinz's 563 convex optimization class. 

---
### **Convex Normal Normal Cone on the Interior Points**

> Let $C$ be a *convex subset* of $X$, an let $x\in \text{int}(C)$. Then $N_C(x) = \{\mathbf 0\}$. 

**Proof**

Get $\delta > 0$ such that $\mathbb B_\delta[x]\subseteq C$. Now let $u \in N_C(x)$. Then $0 \ge \sup \langle \mathbb B_\delta[x] - x, u\rangle = \sup\langle \mathbb B_\delta[\mathbf 0], u\rangle = \delta\Vert u\Vert \ge 0$. This would imply that $\Vert u\Vert = 0$ so that $u = \mathbf 0$. 

**References:** Exercise 2.39 in Dimitri's textbook, Heinz's 563 course notes Prop 10.7. 

**Remarks**

The same holds for the variational normal cone. The proof is not here yet. The convex normal cone is exactly the same as the variational normal cone whenever $C$ is a convex set. #UNFINISHED . 

---
### **Convex Normal Cone for Points Outside a Convex Set**

#UNFINISHED


**References**: I thought of it myself. 

---
### **Basic Properties**

* Normal cone addition, see [[Normal Cone Addition]]. 
