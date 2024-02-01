---
alias:Regular Subgradient
---
- [Subgradient Intro](Subgradient%20Intro.md)

---
### **Intro**
Recall from the prerequisite document that the convex subgradient is not sufficient to describe the functions when it's non convex. 
Under simple cases where the function is non-convex, the convex subgradient doesn't reduces to the ordinary gradient for differentiable functions. 
This motivates the definition and discussion for regular subgradient. 

Let $f : \mathbb R^n \mapsto \mathbb{\bar R}$. 
Let $v \in \hat \partial f(\bar x)$. 
Suppose that we take some $x \in \bar x + \epsilon \mathbb B$, some point $x$ that is very close to the point $\bar x$ where we evaluated our regular subgradient. 
One interpretation on the definition of reggular subgradient is the inequality 

$$
f(x) - f(\bar x) - \langle v, x - \bar x\rangle  \ge o(\Vert x - \bar x \Vert). 
$$

This relaxes the definition of a convex subgradient by replacing $o(\Vert x - \bar x\Vert) = 0$. 
Obviously any function where convex $\partial f(\bar x) \neq \mathbf \emptyset$ would mean that $\hat \partial f(\bar x) \neq \emptyset$. 
The small $o$ term measures how far away is $f$ from a convex function locally. 
But this is not the full picture. 
Recall that 

$$
v \in \hat \partial f(\bar x) \iff 
\liminf_{x\rightarrow \bar x} 
\frac{f(x) - f(\bar x) - \langle v, x - \bar x\rangle}{\Vert x - \bar x\Vert} \ge 0. 
$$

The use of liminf allows for the choice of the smallest value of $f(x) - f(\bar x) - \langle v, x - \bar x\rangle$ around $\bar x$. 
For convex function however, the use of $\liminf, \lim, \limsup$ would all be equivalent. 
This part differs from the definition of a convex subgradient. 


#### **Claim | Simple Lower Model of Regular Subgradient**
> Let $v \in \hat \partial f(\bar x)$, let  $\phi(x | \bar x) = \min(f(x) - f(\bar x) - \langle v, x- \bar x\rangle, 0)$, then 

---
### **Testing out the Regular Subgradient** 

In this section let's just make sure that the definition of a regular subgradient is consistent with what we had learned from before. 


#### **Claim | Regular Subgradient Reduces to Convex Subgradient when Function is Convex**
> When $f$ is convex, proper and lsc, then $\hat \partial f = \partial f$ where $\partial f$ here denotes the convex subgradient. 

