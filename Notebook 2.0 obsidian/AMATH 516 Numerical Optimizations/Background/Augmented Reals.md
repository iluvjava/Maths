---
alias:Augmented Arithmetic

---
### **Intro**

The use of augmented reals were heavily involved in measure theory and Optimizations. The augmented reals are real number with infinity, denoted and defined as $\overline{\mathbb R} = \mathbb R\cup \{\pm \infty\}$. Summarized by part E of Rockafellar and Wets in their variational analysis, the augmented arithmetic has the rules 

1. $\alpha \in \mathbb R$, $\alpha \pm \infty = \pm \infty$
2. $0(\pm \infty) = 0$
3. $(-\infty) + \infty = \infty + (-\infty) = \infty$, this is chosen for the minimization focus for variational analysis under the context of Rokafeller Wets, it's undetermined in other context of discussion. 
4. As a consequence of previous (3.), $\alpha - \alpha \neq 0$ with $\alpha = \pm \infty$, then $\lambda(\infty - \infty) \neq (\lambda\infty - \lambda \infty)$ when $\lambda < 0$, we prevent the attempts at dividing $\infty - \infty$. 


**Context**

In the definition of the augmented real system, we set it up so that it models the behaviors of constraint optimization problem. Additionally, under $\overline{\mathbb R}$, the set of clusters points for all sequence is in $\overline{\mathbb R}$, the set is closed under subsequential limit! See Exercise 1.15 in Rock.Wets. k