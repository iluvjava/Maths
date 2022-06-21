[[Cone]]
[[Polar Cone]]


---
### **Intro**


A normal cone is paramaterized by a set $Q\subseteq \mathbb{R}^n$ and a point $\bar{x}\in Q$ such that: 

$$
N_Q(\bar{x}) := \left\lbrace
    v \in \mathbb{R}^n: 
    \langle v, x - \bar{x}\rangle \le o(\Vert x - \bar{x}\Vert_2), x\rightarrow \bar{x}\in Q
\right\rbrace
$$

Where, the little $o$ notations denotes the limit that: 

$$
\lim_{x\rightarrow \bar{x}} \frac{o(\Vert x - \bar{x}\Vert_2)}{\Vert x - \bar{x}\Vert_2} = 0
$$

Another Equivalent Definition of the set is given as: 

$$
\underset{x\rightarrow \bar{x}\in Q}{\lim\sup} 
\frac{\langle v, x - \bar{x}\rangle}{\Vert x - \bar{x}\Vert_2}
$$


---
**Intuitively**:

Imagine any set of vector that is perpendicular to the velocity of a particle inside of the set $Q$ that is approaching the point $\bar{x} \in Q$. It's immediate that, if the point $\bar{x}$ is in the boundary, then the normal cone is not going to be $\text{affhull}(Q)$, if it's in the relative interior of the set, then the normal cone is going to be the whole space of $\text{affhull}(Q)$. 

