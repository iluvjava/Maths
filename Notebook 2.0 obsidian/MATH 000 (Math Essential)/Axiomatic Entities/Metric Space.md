### **Intro**


Metric space is a function defines over a set $S$ and returns a non-negative real number that gives a sense of distance between any 2 elements in the set. For any 2 elements $x, y, z$ from $S$ the following must be true for the definition of a metric $d$: 

$$
\begin{aligned}
    & d(x, y) = 0 \iff x = y
    \\
    & g(x, y) = g(y, x)
    \\
    & g(x, z) + g(z, y) \ge g(x, y)
\end{aligned}
$$


---
### **Completeness**

> A metric space is complete if for all Cauchy Sequence in the set, the limit of the sequence is in the set itself. 

$\mathbb Q$  Let the metric space be the absolute value. Then the set would not be complete because a sequence of rational can converge to an irrational after a limit, however, it's not in the set. 

$\mathbb R$ Let the metric space be the absolute value, then this set is complete. 