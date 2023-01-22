[[Real Analysis Basics]]

### **Intro**

> If the function $f_n$ converges to $f$ uniformally on the region $D$, then the resulting function $f$, and the function $f_n$ is continuous for all $n\in \mathbb N$, then the resulting function $f$ will be a continuous function. 


**Proof**

The proof is direct. When $f_n\rightarrow f$ uniformally. We define $\Vert g\Vert_D = \sup_{x\in D}|g(x)|$, and considering the continuity of function $f$ using 2 points $x_1, x_2 \in A$ (We will specify the condition for the choice later): 

$$
\begin{aligned}
    |f(x_1) - f(x_2)| 
    &\le |f(x_1) - f_n(x_1)| + |f_n(x_1) - f(x_2)|
    \\
    &\le 
    |f(x_1) - f_n(x_1)| + |f_n(x_1) - f_n(x_2)| + |f_n(x_2) - f(x_2)|, 
\end{aligned}
$$

observe that the term $|f(x_1) - f_n(x_1)|, |f_n(x_2) - f(x_2)|$ can be arbitrary small by the fact that $f_n\rightarrow f$ uniformally, and for the term $|f_n(x_1) - f(x_2)|$ it can also be bounded by arbitrarily choice of $|x_1 - x_2|< \delta$ for some $\epsilon$ so $|f_n(x_1) - f_n(x_2)|$ is as small as we want to be, by the continuity of the function $f_n$. 

