### **Intro**

Textbook where we are pulling stuff from: \<Large-Scale Convex Optimization Algorithms and Analyses via Monotone Operators\>. 

A great starting point from a historical point of view on this topic would be **Rockafellar's seminal paper** on it: ![](References/Monotone_Operators_and_the_Proximal_Point_Algorithm.pdf)

The method of iterating through the resolvent of the subgradient operator becomes a way of finding the fixed points of the operator $(I + \alpha\partial f)^{-1}$, assuming it converges to $x$, then it produces $0\in \partial f(x)$. That is the major exploit and it's rooted somewhere in PDEs and scientific analysis. 

Another foundational paper is: **\<SURVEY PAPER: Multiplier and Gradient Methods\>** by AGNUS R. HESTENES, the same people behind conjugate gradient method. A link to Springer [here](https://link.springer.com/content/pdf/10.1007/BF00927673.pdf). 