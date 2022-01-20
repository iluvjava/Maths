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


