### **Celestia AI**
$$
\max_{\forall x_i} \left\lbrace
    \sum_{j = 1}^{n}h_i(x_i): \text{via consent} \wedge \text{Friendship and Ponies}
\right\rbrace
$$

* $x_i$: All human subjective experiences described in a vector, either through the digital interface of ponypad, but it's actually all the parameters describing the human neuralogical behaviors. 


* $h_i$: The satisfaction of human about its own set of values, measured by the score, and probably relates the reward system inside of the brain and the parts relevavnt to motivations. 


* $n$: All "living" human, a good enough simulation of the entity still counts as living. 


* "Consent": Some neural activation patterns in the cortex that controls the human to agree, in any languages. 


* "Friendship and Ponies": Cute ponies stuff and friends ^w^


---
$$
\arg\min_x \left\lbrace
    \Vert Aw - b\Vert_2^2 + \lambda \Vert w\Vert_1
\right\rbrace
$$

$$
\lambda_{\max} = 
\max_{k=1,...,d} \left\lbrace
    2 \left|
        \sum_{i = 1}^{n} A_{i, k}
        \left(
            b_i - \left(
                \frac{1}{n} \sum_{j=1}^{i} b_i
            \right)
        \right)
    \right|
\right\rbrace
$$

$$
\arg\min_x \left\lbrace
    \lambda \mathbf{1}^T\eta + \Vert Ax - b\Vert : 
    -\eta \le x \le \eta
\right\rbrace
$$

$$
g(x) + h(x) \le g(x) +  (y - x)^T\nabla g(x) + \frac{\beta}{2}\Vert y - x\Vert_2^2 + h(x)
$$


---

$$
\begin{aligned}
& \mathbb{E}\left[\mathbb{I}_A\left(\frac{j}{j + i + c}\right)| 
    \mathcal{F}_n
\right] + 
\mathbb{E}\left[\mathbb{I}_B\left(\frac{j + c}{j + i + c}\right)| 
    \mathcal{F}_n
\right]
\\
=& 
\left(\frac{j}{j + i + c}\right)
\mathbb{E}\left[\mathbb{I}_A|\mathcal{F}_n\right] + 
\left(
    \frac{j + c}{j + i + c}
\right) \mathbb{E}\left[\mathbb{I}_B|\mathcal{F}_n\right]
\\
=&
\left(\frac{j}{j + i + c}\right)
\mathbb{P}\left(A\right) + 
\left(
    \frac{j + c}{j + i + c}
\right) \mathbb{P}\left(B\right)
\end{aligned}
$$


$$
a_n = \frac{2}{L} \sum_{j = 0}^{1/\Delta x}
F_j\sin\left(
    j\Delta x \pi
    \right)
$$

$$
\begin{aligned}
    y &= (1 + \delta)x - \delta \bar{x}
    \\
    \frac{1}{1 + \delta} y &= x - \frac{\delta}{1 + \delta} \bar{x}
    \\
    x &= \frac{1}{1 + \delta y} + \frac{\delta}{1 + \delta} \bar{x}
    \\
    x &= \frac{1}{1 + \delta}y + \left(
        1 - \frac{1 + \delta}{\delta}
    \right)\bar{x}
\end{aligned}
$$

Ok. 

$$
\begin{aligned}
    x = \frac{-b \pm \sqrt{b^2 - 4ac}}{2}
\end{aligned}
$$

$$
\begin{aligned}
    \sum_{n = 0}^{\infty}x^n &= \frac{1}{1 - x} \quad \forall x \in (0, 1)
    \\
    \partial_x \sum_{n = 0}^{\infty}x^n &= \frac{1}{(1 - x)^2} \quad \forall x \in (0, 1)
    \\
    \implies \sum_{n = 1}^{\infty} n x^{n} &= \frac{1}{(1 - x)^2} \quad \forall x \in(0, 1)
    \\
    \int_{0}^{x} 
        \sum_{n = 0}^{\infty} \xi^n
    d\xi &= 
    \ln(x + 1)
    \\
    \implies
    \sum_{n = 0}^{\infty} \frac{x^{n + 1}}{n + 1} &= -\ln(1 - x) \quad \forall x\in (0, 1)
\end{aligned}
$$


$$
\mathcal{O}(k\log(k))
$$

$$
AB = \begin{bmatrix}
\sqrt{10} & \sqrt{10} & \sqrt{10}\\
\sqrt{10} & 5\sqrt{2} & 2\sqrt{5}\\
\sqrt{10} & 2\sqrt{5} & 5\sqrt{2}
\end{bmatrix}
$$


$$
\begin{cases}
    W(\xi) \rightarrow \bar{x} + \alpha - a  
    &
    \xi \rightarrow - \infty
    \\
    W(\xi) \rightarrow \bar{x} + \beta - b  
    &
    \xi \rightarrow \infty
\end{cases}
$$

Testing mermaid in Obsidian. 
```mermaid
graph TD;
A-->B;
A-->C;
B-->D;
C-->D;
```

$$
\overline{\overline{\overline{\overline{\overline{\overline{\overline{\overline{\overline{\overline{\overline{\overline{\overline{\overline{\overline{\overline{\overline{\overline{\overline{\overline{\overline{\overline{\overline{\overline{\mathbb{B}}}}}}}}}}}}}}}}}}}}}}}}}
$$

$$
\reflectbox{2} 
$$




$$
a ∈ A, B ⊆ A
$$


I think the textbook mean: 

$$
\begin{aligned}
    \lambda_1 + \cdots + \lambda_m = 1
\end{aligned}
$$

Cause that is how affine linear span is define, and certainly affine linear dependence and independence should have a definition that is based on affine linear span first. 

$$
\pm, \mp, \overline{\pm}, \overline{\pm}^-, \overline{\pm}^+, \overline{\mp}_{-}^{+}, \cdots
$$

$$
\underline{\overline{\overline{\overline{\overline{\pm^+_{-}}^+_{-}}^+_{-}}^+_{-}}_{-}}
$$

$$
a\pm b \mp c = \begin{cases}
    a + b - c
    \\
    a - b + c
\end{cases}\quad \text{correlated}
$$

$$
a\pm b \mp c = \begin{cases}
    a + b - c
    \\
    a - b - c
    \\
    a - b + c
    \\
    a + b + c
\end{cases}\quad \text{uncorrelated}
$$

Suppose $f:\mathbb E\mapsto \mathbb{\bar R}$, mapping from some euclidean space to augmented real with well-defined gradient defined everywhere and it has the property

$$
\exists L > 0 \text{ s.t: }
|f(y) - f(x) - \langle \nabla f(x), y - x\rangle| \le \frac{L}{2}\Vert x - y\Vert^2 
\quad \forall x, y\in \mathbb E. 
$$

Then, is it possible that the gradient of the function is globally Lipschitz? 

> [!Proofs]-
> Here's a callout block.



Testing links conversion: 
* [Convex Conjugation Introduction](AMATH%20516%20Numerical%20Optimizations/Duality/Convex%20Conjugation%20Introduction.md)
* [Basic Machine Learning](AMATH%20582%20Data%20Science/Basic%20Machine%20Learning.md)
* [Introduction to Operators for Optimizations](Introduction%20to%20Operators%20for%20Optimizations.md)
* [2D Bifurcation with Zero Eigenvalues](2D%20Bifurcation%20with%20Zero%20Eigenvalues.md)


The toString function for big int. 

```python 
digits = '0123456789'
def bigint(n, d=10):
    s = ''
    l = [(n,None)]
    while l:
        m, k = l.pop(0)
        if m < d:
            if k:
                s += '0'*(k-1)
            s + = digits[m]
        else:
            ll = []
            while d <= m:
                a = b = c = d
                sb = 1
                sc = 1
                while (a := a*a) < m:
                    c = b
                    b = a
                    sc = sb
                    sb *= 2
                ll.append((m//c, (k - sc) if k else None))
                m = m%c
                k = sc
            ll.append((m,k))
            l = ll + l
    return s
```


Metaheuristic algorithms do local searches near the current found optimal, for example, the evolutionary algorithm and particle swarms. They assume the fact that underlying optimals are close to some of the current solutions found with good objective values. This is not surprising if we assume Lipschitz continuity for the functions as the level set of the true optimal is always a subset of the sub-optimal. Suppose current optimal solution $\bar x$ is found, then the true optimal $x^+$ satisfies $x^+ \in \{x: f(x)\le f(\bar x)\}=:\text{lev}_{f(\bar x)}(f)$, therefore, reducing the search spaces, further assume $\text{lev}_{f(\bar x)}(f)$ has non empty interior, then there exists some value $x$ in the set that is smaller than $\bar x$ and it's right next to it. Additionally the set $\text{lev}_{f(\bar x)}(f)$ has to contain $x^+$. Whether $x^+$ is contained within the same connected components (topology term not graph theory term) cannot be easily determined. And this, is what the mutation part of the genetic algorithm addresses. 

When search space is uncountable and not close, it might be possible (Still thinking about this part.) to design a black box for each claimed algorithm that has a given convergence rate worse than what it claims, hence contradicting itself. 

The paper cited in the wiki for that section criticizes the low quality of research, insufficient proof, and reinventing the wheels for ad hoc algorithms. This is believable because there are only a few frameworks for metaheuristics that made their names out from the field. The canonical algorithms were: Simulated Annealing, Genetic Evolutionary Algorithm, Ant Colonies, and Particle Swarms. 
It would be lovely to research their theoretical properties because "Black Box" functions can be physical experiments, computer simulations, or other types of evaluations that are impossible to know the gradient of. It is also interesting to see how relaxing the functions and oracles leads to a different approach in optimizations, in this case, the lack of gradients and derivative information.

The paradigms differ entirely from the deterministic NP-Hard algorithm for discrete problems, which uses branches and bounds. These algorithm DOES use heuristics, but they are well-defined lower bounding functions that produce partial solutions. In the case of these canonical BBOs algorithms, there are no apparent proofs or specific exploits on problem structures. And that is why mathematicians are unlikely to work on it too much. One would need to at least assume something about the function, something stronger to prove convergence or expected convergence in the stochastic case. However this is not the case as explained in the paper cited in the wiki. 

$$
f(
A\overset{
    \overbrace{.\;\cdots \;.}^{\text{n times}}
    }{x} + b, y
):= \partial_x^n f(Ax + b, y)
$$

$$
{\cdot}^{{.\cdot}^3}
$$


