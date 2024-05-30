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
\begin{aligned}
    & \sum_{i =1}^{1}  1 &= 1
    \\
    & \sum_{i =1}^{2}  1/2 &= 1
    \\
    & \sum_{i =1}^{3}  1/3 &= 1
    \\
    & \quad \vdots & 
    \\ 
    & \sum_{i = 1}^n 1/n &= 1
    \\
    & \quad \vdots & 
    \\
    & \sum_{i = 1}^\infty 1/\infty &= ?
\end{aligned}
$$

Or like, $\lim_{n\rightarrow \infty}\sum_{k = 1}^{n} 1/n = ?$

You need
$$
\lim_{k\rightarrow\infty} \langle y_{n_{k}}, y-z\rangle 
= 
\lim_{k\rightarrow\infty} \langle z_{n_{k}}, y-z\rangle
$$
 
To get this
\lim_{k\rightarrow\infty}\langle x_{k},y-x\rangle existence make sure both quantities above the same.
 
Definte $\Pi_{(\cdot, y)}[u](x)=u(x, y)$, this operator fixes $y$ the second parameter and passes $x$, the first parameter. This is a linear transform on some (...?) functional space. We note that the condition $u(x, b) + u_x(x, b) = f(x)$ for all $x\in (0, a)$, is a lot like a linear constraint in linear algebra. I mean that by

$$
\begin{aligned}
    u(x, b) + u_x(x, b) &= f(x)
    \\
    [I + \partial_x]u(x, b) &= f(x)
    \\
    [\Pi_{(\cdot, b)}(I + \partial_x)]u(x, y) &= \Pi_{(\cdot, b)}f(x, \cdot).
\end{aligned}
$$
Which is infinitely many linear constraints. And it's not hard to see that, the projection $\Pi_{(\cdot, b)}u(x, y)$, is actually: 

$$
\begin{aligned}
    \Pi_{(\cdot, b)}[u](x) = \int_{-\infty}^{\infty} u(x, y)\delta(0, y - b)dy, 
\end{aligned}
$$

making use of the Dirac delta, and representing it in a more... savage way. And I think, the use of Dirac delta, is representing a sequence of function approaching a limit, in Hilbert space $L^2$. Which is probably, the theoretical foundations. This simplifies a lot for $1D$ boundary problem, creating just a single linear constraints. To not have this constraints as redundant, I think we need to use linear algebra to determine pre-image of $\Pi_{(\cdot, b)}(I + \partial_x)$ on $f$ is not in the null space of the Laplace operator $[\partial_x^2 + \partial_y^2]$, or any other existing boundary conditions. Since it's a linear operator, the pre-image is the solution plus the span of null space or something. 


What are the conditions on the gradient $\nabla f(x_0)$ at a point such that it's sufficient to say that the function is also Frechet Differentiable at that point $x_0$? 

There really should be one, I would say that, if there exists a continuous Hessian at that point, then it must be Frechet Differentiable, but is this the weakest condition we can get? I am just curious tho, I ask it here so if people have time they can tell me where to look.


> For millennials, humanity stumbles in the darkness, learning slowly. And then the God said: "Let there be statistical inference." 200 years later, science rules and humanity enlightened. A surreal glows of knowledge and science shines through the darkness. And then, the God retired. We had quantified our beliefs and related them to observations through rigorous mathematics. 

$$
\begin{array}{|c|c|c |c |c|}
\hline
    & \text{Rob} & \text{Lock} & \text{Drinks} & \text{Does nothing} \\ \hline
    \text{Rob} & &  &  &  \\ \hline
    \text{Lock}& &  &  &  \\ \hline
    \text{Drinks} &  &  &  \\ \hline
\end{array}
$$

$$
\begin{array}{|c|c|c|c|c|}
    \hline
    & \text{Rob} & \text{Lock} & \text{Drinks} & \text{Does nothing} \\
    \hline
    \text{Rob}&  &  &  & \\
    \hline
    \text{Lock} &  &  &  & \\
    \hline
    \text{Drinks} &  &  &  & \\
    \hline
     \text{Does nothing} &  &  &  & \\
    \hline
\end{array}
$$

$$
\vecu{t}, \e
$$


**The Ghoul Apocalypse.** 

You work for Princess Celestia under the Ministry of magic. Equestria is at crisis. A potent type of arcane magic turns ponies into ghouls, the infected has incubation period of about a month, they have absolutely no discernible symptoms. Currently we have 1000 ponies in our isolated facility, they are all asymptomatic. According to the design of our tests, it has type I error $\alpha$ and type II error $\beta$. We carried out the tests for our populations and have $100$ positive results. Please provide a distribution of our prior estimate $\theta$ representing the probability of a pony actually having the disease. This is crucial since it will determine our response strategies.

Let $\delta$ be the test function with type I, II error rate $\alpha, \beta$, then given prior hypothesis for the probability of any given pony from our facility of actually having the disease being $\theta$ and let $\Theta \sim \text{Bernoulli}(\theta)$. We directly have marginal distribution:

$$
\begin{aligned}
    \mathbb P(\delta = 1) &= \mathbb P(\delta = 1 | \Theta = 0)\mathbb P(\Theta = 0) + \mathbb P(\delta = 1 | \Theta = 1) \mathbb P(\Theta = 1)
    \\
    &= \alpha(1 - \theta) + (1 - \beta) \theta \sim \text{Bernoulli}(\tau). 
\end{aligned}
$$

We observe that the value of $\alpha, \beta$ restrict the value of $\tau$, forming a prior for our problem. With the assumption that $0 \le \alpha + \beta < 1$, we make prior assumption that variable $\tau$ is uniformly random, named it $\mathcal T$ is $(\alpha, 1 - \beta)$. Solving for $\theta$ we have $\theta = (\tau - \alpha)/(1 - \alpha - \beta)$. 


$$
\forall \epsilon > 0: \exists a_k  \in (\sup a_n - \epsilon, \sup a_n)
$$

By monotone increase, for all $a_{k}$, $k\in \mathbb N$, we have $a_{k}\le \lim_{n} {a_n}$. So $\sup_{n\rightarrow \infty}a_n \le \lim_{n\rightarrow \infty}a_n$. But for any sequence that has a limit $\sup_{n\in \mathbb N} a_n \ge \lim_{n\rightarrow \infty} a_n$, because it's literally the supremum of the sequence. So it's equal by being both $\le, \ge$. 


See [this stack exchange post](https://math.stackexchange.com/questions/1767674/prove-multidimensional-newtons-method-converge-at-least-quadratically) for a discussion on second order convergence of sequence $\Vert x^{(k)} - \bar x\Vert$, the constant is related to the lipscthiz constant $L$ of the Hessian AND the strong convex constant $\beta$, should be something like $L / \beta$. After that observe that from convexity and $L$-Lipz of Hessian, for all $y, x \in \mathbb R^n$

$$
\begin{aligned}
    f(y) - f(x) - \langle \nabla f(x), y - x\rangle \le \frac{L}{2}\Vert y - x\Vert^2
    \\
    f(y) - f(\bar x) - \langle \mathbf 0, y - \bar x\rangle \le \frac{L}{2}\Vert y - x \Vert^2
    \\
    f(y) - f(\bar x) \le \frac{L}{2}\Vert y - \bar x \Vert^2
\end{aligned}
$$

with $y$ being $x^{(k)}$, the objective value $f(x^{(k)}) - f(\bar x)$ is bounded by the normed error between the sequence and the root $\Vert x - \bar x\Vert^2$. 


$$
\overset{\overbrace{\cdots}^{\text{n times}} }
{x}
$$


$$
    {\scriptsize
    \begin{aligned}
        \mathrm{d}L 
        = 
        \int_{t_{0}}^{t_{1}} 
        \left[ 
            \left( 
            I_{\mathbf{u}}(\mathbf{x}(t),\mathbf{u}(t),t)
            + 
            \mathbf{\lambda}^{\mathsf{T}}(t) \mathbf{f}_{\mathbf{u}} 
            (\mathbf{x}(t),\mathbf{u}(t),t) 
            \right) 
            \mathrm{d}\mathbf{u}(t) + 
            \left( I_{\mathbf{x}}(\mathbf{x}(t),\mathbf{u}(t),t) + 
                \mathbf{\lambda}^{\mathsf{T}}(t) \mathbf{f}_{\mathbf{x}} 
            (\mathbf{x}(t),\mathbf{u}(t),t) + \dot{\mathbf{\lambda}}(t) 
            \right) \mathrm{d}\mathbf{x}(t) 
            \right]
        \mathrm{d}t 
        \\
        - \mathbf{\lambda}^{\mathsf{T}}(t_{1}) \mathrm{d}\mathbf{x}(t_{1}) + \mathbf{\lambda}^{\mathsf{T}}(t_{0}) \mathrm{d}\mathbf{x}(t_{0}) \leq 0
    \end{aligned}   
}
$$

Let $N_Y(y)$ be the normal cone of the set $Y$ at $y$. 

$$
\begin{aligned}
    & \argmin{x} f(x, y^+) \text{ s.t: } y^+ \in \argmin{y \in Y} g(x, y) 
    \\
    & \argmin{x} f(x, y^+) \text{ s.t: } \nabla[\cdot \mapsto g(x, \cdot)](y^+) + N_Y(y^+)\ni \mathbf 0
    \\
    & \argmin{x} f(x, y^+) \text{ s.t: } -\nabla[\cdot \mapsto g(x, \cdot)](y^+) \in N_Y(y^+)
\end{aligned}
$$

When $\nabla [\cdot \mapsto g(x, \cdot)](y)$ is strictly convex, there exists an inverse mapping (single valued) $\nabla [\cdot \mapsto g(x, \cdot)]^{-1}(z)$, with $z \in \text{rng }(\nabla g(x, \cdot))$. 
Hence we maybe able to say $y^+ \in \nabla [\cdot \mapsto g(x, \cdot)]^{-1}(-N_y(y^+))$, so $y$ belongs to the fixed point set of some multi-valued operators. Kinda scary. 

Why not consider $z = \nabla [\cdot\mapsto g(x, \cdot)](y^+)$, so then $y^+ = \nabla [\cdot\mapsto g(x, \cdot)]^{-1}(z)$ transforming the above problem into 

$$
\begin{aligned}
    & \argmin{x} f(x, \nabla [\cdot\mapsto g(x, \cdot)]^{-1}(z)) \text{ s.t: } -z 
    \in N_Y(\nabla [\cdot\mapsto g(x, \cdot)]^{-1}(z))
    \\
    &
    \argmin{x} f(x, \nabla [\cdot\mapsto g(x, \cdot)]^{-1}(z)) \text{ s.t: }
    \mathbf 0 \in [I + 
    N_Y\circ \nabla [\cdot\mapsto g(x, \cdot)]^{-1}]z
    \\
    & 
    \argmin{x} f(x, \nabla [\cdot\mapsto g(x, \cdot)]^{-1}(z)) \text{ s.t: }
    z \in [I + 
    N_Y\circ \nabla [\cdot\mapsto g(x, \cdot)]^{-1}]^{-1}(\mathbf 0). 
\end{aligned}
$$

If somehow, we can get the resolvent $[I + N_Y\circ M]^{-1}$ with $M = \nabla [\cdot \mapsto g(x, \cdot)]^{-1}$ for each value of $x$, then we have a convex constraints here. 
Because fixed point of the constraint seems to be convex. 
The inverse of the partial gradient of $g$ here is messing things up. 


Footnote ^[this is a footnote. ]


### **Genesis AI Stuff**

$$
\begin{align}
    \sum_{i = 1}^{K} y_i 
    &= 1,\quad 
    y_j \ge 
    0 \; 
    \forall\;  j \in \{1, \cdots, K\}
\end{align}
$$

so, we define the error matrix is defined as: 
$$
\begin{align*}
    E_f(\hat y, y  | \Theta)
    &= 
    \sum_{k = 1}^{K} 
        \mathbf {\hat e}_{\hat \sigma(k)} 
        \mathbf{\hat e}_{ \sigma(k)}^T
        \left.
        \begin{cases}
            (1 - |\hat y_{\hat \sigma(k)} - y_{\sigma(k)} |) & \text{if } \hat \sigma(k) = \sigma(k), 
            \\
            1 & \text{else }. 
        \end{cases}
        \right\rbrace
\end{align*}
$$

where 
1. $\hat\sigma, \sigma$ is a permutations on $\{1, \cdots, K\}$ such that it makes $\hat y_{\hat \sigma(1)} \le \hat y_{\hat \sigma (2)}\le \cdots y_{\hat \sigma (K)}$, similarly for $\hat \sigma$ it permutes so that it satisfies: $y_{\sigma(1)}\le y_{\sigma (2)}\le \cdots y_{\sigma(K)}$. 
2. $\mathbf {\hat e_i}$ is the standard basis vector of $\mathbb R^K$. 
3. $y:= f(x | \Theta)$, by our own definition. 

#### **Example 1**

Let [pine, spruce, other] be the categoryof species that the model is predicting. 
Say the actual label is $\hat y = [\text{pine: } 0.1, \text{spruce: }0.7, \text{other: }0.2]$, our model predicted categorical composition 
$y = [\text{pine: }0.2, \text{spruce: }0.5, \text{other: }0.3]$ then we would have permutations: 
$$
\begin{align*}
    {\hat \sigma}:\{1, 2, 3\} \mapsto \{1, 2, 3\}
    & = \{(1, 1), (2, 3), (3, 2)\}
    \\
    {\sigma}:\{1, 2, 3\} \mapsto \{1, 2, 3\}
    & = \{(1, 1), (2, 3), (3, 2)\}, 
\end{align*}
$$
then the metrics evaluates to 
$$
\begin{align*}
    E_f(\hat y, y | \Theta)
    &= 
    \sum_{k = 1}^{K} 
        \mathbf {\hat e}_{\hat \sigma(k)} 
        \mathbf{\hat e}_{ \sigma(k)}^T
        \left.
        \begin{cases}
            (1 - |\hat y_{\hat \sigma(k)} - y_{\sigma(k)} |) & \text{if } \hat \sigma(k) = \sigma(k), 
            \\
            1 & \text{else }. 
        \end{cases}
    \right\rbrace
    \\
    &= 
    (1 - |0.1 - 0.2|)\begin{bmatrix}
        1 \\ 0 \\ 0
    \end{bmatrix}\begin{bmatrix}
        1 & 0 & 0 
    \end{bmatrix}
    \\
    & \quad 
    + 
    (1 - |0.7 - 0.5|)
    \begin{bmatrix}
        1 \\ 0 \\ 0
    \end{bmatrix}\begin{bmatrix}
        0 & 0 & 1
    \end{bmatrix}
    \\
    & \quad 
    + 
    \begin{bmatrix}
    0 \\ 1 \\ 0 
    \end{bmatrix}
    \begin{bmatrix}
    0 & 1 & 0 
    \end{bmatrix}
    (1 - |0.7 - 0.5|)
    \\
    &= 
    0.9 \begin{bmatrix}
        1 & 0 & 0 \\
        0 & 0 & 0 \\
        0 & 0 & 0 
    \end{bmatrix}
    + 
    0.8 \begin{bmatrix}
        0 & 0 & 0 \\
        0 & 1 & 0 \\
        0 & 0 & 0 
    \end{bmatrix}
    + 
    0.8\begin{bmatrix}
        0 & 0 & 0 \\
        0 & 1 & 0 \\
        0 & 0 & 0 
    \end{bmatrix}
    \\
    &= \begin{bmatrix}
        0.9 & 0 & 0 \\
        0 & 0.8 & 0 \\
        0 & 0 & 0.8
    \end{bmatrix}
\end{align*}
$$

This is an example where the ordering of the composition across species are correctedly identified by the model, hence the matrix is a diagonal matrix. 
When this is not the case, consider the following example: 

#### **Example 2**

Let [pine, spruce, other] be the categoryof species that the model is predicting. 
Say the actual label is $\hat y = [\text{pine: } 0.1, \text{spruce: }0.7, \text{other: }0.2]$, our model predicted categorical composition 
$y = [\text{pine: }0.5, \text{spruce: }0.4, \text{other: }0.1]$ then we would have permutations: 

$$
\begin{align*}
    \hat \sigma &= \{
        (1, 1), (2, 3), (3, 2)    
    \}, 
    \\
    \sigma &= 
    \{(1, 3), (2, 2), (3, 1)\}, 
\end{align*}
$$
then the metrics evaluates to 
$$
\begin{aligned}
    E_f(\hat y, y, | \Theta) &= 
    \sum_{k = 1}^{K}         \mathbf {\hat e}_{\hat \sigma(k)} 
        \mathbf{\hat e}_{ \sigma(k)}^T
        (1 - |\hat y_{\hat \sigma(k)} - y_{\sigma(k)} |)
    \\
    &= 
    \begin{bmatrix}
        1 \\ 0 \\ 0
    \end{bmatrix}
    \begin{bmatrix}
        0 & 0 & 1
    \end{bmatrix}
    + 
    \begin{bmatrix}
        0 \\ 0 \\ 1
    \end{bmatrix}
    \begin{bmatrix}
        0 & 1 & 0
    \end{bmatrix}
    + 
    \begin{bmatrix}
        0 \\ 1 \\ 0
    \end{bmatrix}
    \begin{bmatrix}
        1 & 0 & 0
    \end{bmatrix}
    \\
    &= \begin{bmatrix}
        0 & 0 & 1 \\ 
        0 & 0 & 0 \\
        0 & 0 & 0
    \end{bmatrix}
    +
    \begin{bmatrix}
        0 & 0 & 0 \\ 
        0 & 0 & 0 \\
        0 & 1 & 0
    \end{bmatrix} 
    +
    \begin{bmatrix}
        0 & 0 & 0 \\ 
        1 & 0 & 0 \\
        0 & 0 & 0
    \end{bmatrix}
    \\
    &= 
    \begin{bmatrix}
        0 & 0 & 1 \\ 
        1 & 0 & 0 \\
        0 & 1 & 0
    \end{bmatrix}. 
\end{aligned}
$$

Please observe that getting the permutations incorrectly always results in a permutation matrix. 

### **Importance Ranking**

However, it's not always the case that each of the species are going to ranked as exactly the same. For example let's say the actual vector is given as $\hat y = \{\text{pine: } 0.9, \text{spruce: } 0.00, \text{other: } 0.1\}$, but hour model predicted $y = \{\text{pine: } 0.8, \text{spruce: } 0.2, \text{other: } 0.0\}$, in which case, it got the dominant species correctly, but the second, and third most populous species were mixed up, but if we use the above evaluation metric we would have error matrix: 
$$
\begin{align*}
    \begin{bmatrix}
        (1 - |0.9 - 0.8|) & 0 & 0 \\
        0 & 0 &  1 \\
        0 &1 & 0 
    \end{bmatrix} &= 
    \begin{bmatrix}
        0.9 & 0 & 0 \\
        0 & 0 &  1 \\
        0 &1 & 0 
    \end{bmatrix}
\end{align*}
$$

Which can be miss leading because it's saying that mixing up "spruce", and "other" in this example is as important as mixing up "pine" with other species when, the majorti of species is pine. 
Therefore, we proposed the following evaluation metric the gives geometric weights to the ordering of the species, from low to high inside of the error matrix, giving definition: 

$$
\begin{align*}
    E_f(\hat y, y | \Theta) = 
    \sum_{k = 1}^{K} 
        \mathbf {\hat e}_{\hat \sigma(k)} 
        \mathbf{\hat e}_{ \sigma(k)}^T
        \left.
        \begin{cases}
            1 - |\hat y_{\hat \sigma(k)} - y_{\sigma(k)} | & \text{if } \hat \sigma(k) = \sigma(k), 
            \\
            (1/2)^k/(\sum_{t = 1}^{K}(1/2)^t) & \text{else }. 
        \end{cases}
    \right\rbrace. 
\end{align*}
$$
We call this the generalized rank-weighted confusion matrix 

And finally, given test sets $(x^{(i)}, \hat y^{(i)})$ for $i = 1, \cdots, T$, then the generalized rank-weighted confusion matrix is the sum over all the sample which is compuated as 
$$
\begin{aligned}
   \sum_{i = 1}^{T} E_f(\hat y^{(j)}, y^{(j)} | \Theta). 
\end{aligned}
$$