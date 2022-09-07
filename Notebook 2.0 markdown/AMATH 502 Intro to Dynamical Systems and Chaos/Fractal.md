This is independent for now. 
1. Define Fractals 
2. Define sets 
3. Define Bijective function, injective, and surjective. 
4. Countable and Uncountable

Why fractals? The invariant set of the chaotic mapping/system is a fractal. 

---
### Definition: 

> Fractals: A geometric structure with fine structure @ arbitrarily small scales. 

e.g: Logistic Map: 

When you zoom in, we see different things for different kind of scale. In the case of the Orbit Diagram for the logistic mapping, we see the similar features appears as we zoom in. (Self-similar)

And they can be exactly the same as we zoom in. 

**Manderbrot**: 

As we measure the coast line, as we zoom in, from the large Sattelite image, to atomic level, then, we have different length for the coast line measure. This is call approximate fractals. 

---
### Sets and Infinities

Set: We define here as the set in a mathematical sense. 

Let's focus on the following set: 

$$
\mathbb{Q}:= \left\lbrace
    \frac{a}{b}: a, b \in \mathbb{Z} \wedge b \neq 0
\right\rbrace
\quad \mathbb{R}\setminus \mathbb{Q}
$$

Rational: Repeated decimals. 
Irrational: It's never going to have repeated decimals, (As we goes into infinity)

**Cardinality**: 

If there exists a **Bijective Mapping** from the set $A$ to the set $B$ then, they have the same number of elements. 

**Bijective Mapping**: One to one function, $f:A \mapsto B$. 

**Simple Example**: 

$$
N = \{1, 2, 3... \} \quad E = \{2, 4, 6,...\}
$$

Then the Bijective Mapping $f(x): N\mapsto E := 2x$. 

Then, for all elements in $N$ we have another elements in $E$, and vice versa. 

---
### Definition: Bijection

A function $f:X\mapsto Y$ is bijection if: 

$$
f(x_1) = f(x_2) \iff x_1 = x_2
$$

If 2 numbers maps to the same point, then they have the to be the same number in the domain. (**Injective, one-to-one**)

$$
\forall y \in Y \;\exists\; x \in X: f(x) = y
$$

For everything in the range, there is one thing that maps to it from the domain. (**Surjective or Onto**)

---
### Def Cardinality

If there is a bijection between two sets, then those sets will have the same cardinality 

If a set has the same cardinality compare to $\mathbb{N}$, then it's countable, otherwise, it's not countable. 

This relation is an equivalence relations. 

---
### The Rational Set is Countable

Yeah, this is too famous to discuss here, it's pretty easy, the idea is to list all the fractions onto a **2D grid**, and then we use a **zig zag line** for mapping it. 

Notice that, we will count the repeating rational numbers, we have the choice to get rid of the repeats, and in that case, because of infinity, it's still have the same cardinality as the integers. 


