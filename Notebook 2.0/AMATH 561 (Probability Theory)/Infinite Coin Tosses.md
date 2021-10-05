[[Infinite Probability Spaces]]
An example we are going to try for Infinite Probability spaces, and probability measure. 

---
### **Intro**

Here, we will try to go from discrete probability spaces of finite many coin tosses, to an infinite probability spaces and demonstrate the construction of $\sigma$-alg and probability measure on the infinite probability spaces. 

Let all the possible outcomes be $\Omega$, then an element $\omega \in \Omega$ is an infinitely long chain of coin tosses, denoted as $\omega = \omega_1\omega_2...$ where each $\omega_i$ is gonna take $\{H, T\}$ discrete outcome. This set of outcome will be **uncountable**. (Image the sequence to be a slicable python array for ease of notations. )

Let's start defining the set of Events: 

$$
\begin{aligned}
    &A_{H}:= \{\omega\in \Omega, w_1 = H\}\\
    &A_{T}:=\{\omega\in \Omega, w_1 = T\}\\
    & \mathcal{F}_1 = \{\emptyset, A_H, A_T, \Omega\}
\end{aligned}
$$

And the probability assignment will be $p(A_H) = p$ and $p(A_T) = q$. 

Similarly, we can make: 

$$
\begin{aligned}
    A_{HH}&:=\{\omega\in \Omega, w[0:2]=HH\}\\
    A_{HT}&:=\{\omega\in \Omega, w[0:2]=HT\}\\
    A_{TH}&:= \{\omega\in \Omega, w[0:2]=TH\}\\
    A_{TT}&:= \{\omega\in \Omega, w[0:2]=TT\}\\
    \mathcal{F}_2 &:= \sigma(\{A_{HH}, A_{HT}, A_{TH}, A_{TT}\})
\end{aligned}
$$

Then, a set of Events sets that can form a sigma algebra are created and they are: 

$$
\mathcal{F}_0 \subset \mathcal{F}_1\subset \cdots \subset \mathcal{F}_n \subset \cdots
$$

Infinitely sequence of such sets, and they will be a countable sequence. Each of them will be a subset of the next one, because the more $\omega [0:n]$ we know, the more Events there will be. And each time, for the finite sequence, the events are just power set of the outcomes. Nice and easy. 

Consider: 

$$
\mathcal{F}_\infty = \bigcup_i \mathcal{F}_i
$$

The set is not a $\sigma$-alg, consider $\omega_{\text{allH}} = HHH\cdots$, an infinite sequence of head. 

$$
\omega_{\text{allH}} \in A_{\underbrace{H\cdots H}_{n}}\forall\; n\in \mathbb{N} \implies 
\omega_{\text{allH}} = \bigcap_{n\in \mathbb{N}} A_{\underbrace{H\cdots H}_{n}}
$$

But at the same time: 

$$
\{\omega_{\text{allH}}\}\not\in \mathcal{F}_n\; \forall\; n\in\mathbb{N}\implies \{\omega_{\text{allH}}\}\not\in \mathcal{F}_\infty
$$

Then $\mathcal{F}_\infty$ is not a sigma algebra, because an intersection of a countable set of events is not found to be an event in the defined set. 

---
### **How to Remedy**

We generate the Sigma algebra on this countable set of Sigma Algebra. 

$$
\sigma(\mathcal{F}_\infty)
$$

Yeah, that, the same idea as the Borel Measure on the Unit Real interval. 

$$
\{\omega_{\text{AllH}}\} \not\in \mathcal{F}_\infty \implies 
\{\omega_{\text{AllH}}\} \in \mathcal{F} - \mathcal{F}_\infty
$$

The probability assignment of such an event will be: 

$$
A_{\underbrace{\text{ H \dots H}}_{n + 1}}\subset A_{\underbrace{\text{ H \dots H}}_{n}} = \bigcap_{n\in\mathbb{N}} A_{\underbrace{H\cdot H}_{n}}
$$

Using continuity from below property of the measure, we have: 

$$
\lim_{n\rightarrow \infty}\mathbb{P}\left(A_{\underbrace{H\cdots H}_{n}}\right) = p^n = 0
$$

This event has zero probability. 

