- [Bregman Divergence](Bregman%20Divergence.md)

---
### **Intro**

2-Norm is a type of Bregman divergence. 
The 2-Norm is is used in the proximal mapping. 
Hence, in this file we investigate the generalization of a proximal mapping when the 2-Norm inside of the proximal mapping is a Bregman Divergence instead of just a regular 2-Norm. 
We will faithfully follow Chapter 9 of Amir Beck's First-Order Method textbook[^1], and complement it with a paper by Heinz et al.[^2], and some Rockafellar classics. 


---
### **Mirror Descent from Amir Beck**

Amir Beck introduced theories about Bregman proximal mapping as a generalization of the proximal point method[^1] and applied it to the Mirror Proximal method. 
For more about proximal point method visit [Proximal Point Method, Interpretations](Proximal%20Point%20Method,%20Interpretations.md). 
Given a set $C$, for $\omega$ to be a function that introduces the Bregman distances, recall that it will be 
1. Essentially Smooth. 
2. Strictly convex and differentiable on the set $C$. 

These conditions belongs to the characterizations  [Simply Legendre Type](Simply%20Legendre%20Type.md). 
The strict convexity condition is necessary. 
To generalize the famous properties of [Moreau Envelope and Proximal Mapping](Moreau%20Envelope%20and%20Proximal%20Mapping.md), Amir Beck constructed assumption 9.3 and we quote 

#### **Assumption 9.2 | Favorable Assumptions for Bregman Divergence on Mirror Descent**
> For the Bregman prox operator to possess favorable conditions that generalize the Euclidean based proximal mapping, we propose the following conditions for the function $\omega$ and the domain $C$ of our interest: 
> 1. $\omega$ is proper closed and convex. 
> 2. $\omega$ is differentiable over $\text{dom}(\partial \omega)$. Recall the fact that $\text{ri.dom}(f)\subseteq \text{dom}(\partial f)\subseteq \text{dom}(f)$. 
> 3. $C \subseteq \text{dom}(\omega)$. 
> 4. $\omega + \delta_C$ is $\sigma$-strongly convex with $\sigma > 0$. 

**Importance**

Consider the Bregman proximal mapping ${\text{argmin}}_{x\in C}(\psi(x) + \omega(x))$ such that $\text{dom}(\psi) \cap \text{dom}(\partial \omega)$. 
The above conditions are sufficient to retain these properties of the Proximal mapping when $\omega$ is just $\Vert \cdot\Vert^2/2$. 
1. Unique minimizer exists for the Bregman proximal mapping. 
2. The third proximal lemma. 

We formalize these consequences in the following lemmas. 

#### **Lemma 9.7 | Uniquness of Bregman Proximal Mapping**
> Let $\omega$ be proper closed and convex, differentiable over $\text{dom}(\partial \omega)$. 
> Let $\psi$ be convex proper and closed satisfying $\text{dom}(\psi)\subseteq \text{dom}(\partial\omega)$. 
> Let $\omega + \delta_{\text{dom}(\psi)}$ be strongly convex with $\sigma > 0$. 
> Then the minimizer of $\text{argmin}_{x\in \mathbb E}\{\psi(x) + \omega(x)\}$ is unique and belongs to $\text{dom}(\partial \omega)$. 

**Proof**

Let $\phi = \psi + \omega$ then $\phi$ is strongly convex on $C$. 
By strong convexity there exists an unique minimizer $x^*$ for $\psi + \omega$. 
The unique minimizer has $x^*\in \text{dom}(\phi) = \text{dom}(\psi)$ because $\text{dom}(\psi)\cap \text{dom}(\omega)  = \text{dom}(\psi)$. 
Fermat's theorem has $\mathbf 0\in \partial[\psi + \omega](x^*)$. 
Recall that if $\omega$ is differentiable on $\text{dom}(\partial \omega)$ and we have 

$$
\begin{aligned}
    \partial \omega(x) &= \{\nabla \omega(x)\} \; \forall x \in \text{dom}(\partial \omega)
    \\
    \text{dom}(\partial \omega)&= 
    \text{ri.dom}(\omega). 
    \\
    \text{dom}(\psi) &\subseteq \text{dom}(\partial \omega)
    \\
    &= \text{ri.dom}(\omega)
    \\
    \implies \text{ri.dom}(\psi) &\subseteq \text{ri.dom}(\omega)\quad \triangleright \text{ri.dom}(\psi) \subseteq \text{dom}(\psi). 
\end{aligned}
$$

Therefore, we use the sum rule for gradient obtaining $\mathbf 0\in \partial \psi(x^*) + \partial \omega(x^*)$. So $x^*\in \text{dom}(\partial\psi)\cap \text{dom}(\partial \omega) = \text{dom}(\partial \omega)$. 



**Remark**

I feel like Amir's Beck proof is not showing why the subgradient sum rule can be used here to get to the Fermat's rule. 
This part of the proof is modified. It may be replaced with other theorems. 



[^1]: A. Beck, First-Order Methods in Optimization | SIAM Publications Library. in MOS-SIAM Series in Optimization. SIAM. Accessed: Oct. 19, 2023. [Online]. Available: https://epubs.siam.org/doi/book/10.1137/1.9781611974997
[^2]: H. H. Bauschke, J. Bolte, and M. Teboulle, “A Descent Lemma Beyond Lipschitz Gradient Continuity: First-Order Methods Revisited and Applications,” Mathematics of OR, vol. 42, no. 2, pp. 330–348, May 2017, doi: 10.1287/moor.2016.0817.


