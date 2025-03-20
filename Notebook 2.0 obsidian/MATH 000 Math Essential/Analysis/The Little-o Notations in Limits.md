- [Real Analysis Basics](Real%20Analysis%20Basics.md)

---
### **Intro**

The little-o notation is used in expressing intermediate form of limits with involving fractions between two diminishing functions. 

#### **Def | Little-o Notation**
> Let $g(x)$ be a function such that $\lim_{x \rightarrow a} g(x) = 0$. 
> Then the notation $o(g(x))$ indicates the existence of a function $f(x)$ such that it satisfies $\lim_{x \rightarrow a} f(x)/g(x) = 0$ in place of where the notation appears in the algebraic expression. 

**Observations**

Obviously $\lim_{x\rightarrow 0}f(x) = 0$ too. 


#### **Examples**

Let $f: \R \rightarrow \R$ be continuous. 
Consider the expression: 

$$
\begin{aligned}
    f(x) - f(a) - (x - a) = o(x - a). 
\end{aligned}
$$

Then it means: 

$$
\begin{aligned}
    \lim_{x \rightarrow a} \frac{f(x) - f(a) - (x - a)}{x - a}
    = \lim_{x \rightarrow a} \frac{o(x - a)}{x - a} = 0. 
\end{aligned}
$$

Observe that it essentially means $f'(a) = 1$. 


