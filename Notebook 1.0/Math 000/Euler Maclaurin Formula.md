We are going to discuss the Euler Maclaurin Formula, with reference materials from here: 

[Reference](http://people.csail.mit.edu/kuat/courses/euler-maclaurin.pdf)
Contains stuff about Bernoulli Number. 
And several example sums.
[Reference](https://www.maa.org/sites/default/files/mathmag61-65-spivey15625.pdf)
Contains stuff about the formula.

---

### Intro 

The Euler Maclaurin Formula is discovered by Bernoulli when he was investigating the power sum problem of the natural number. 

The idea is similar to Riemann sum, the Riemann sum represents the integrals with the sum, but in this case we are representing the sum with the integrals and derivative information. 

Firstly, let's up the formula onto the table so we know what we are talking about: 

$$
\sum_{j = 0}^{n - 1} \left(f(j)\right) = 
\int_{0}^{n} f(x) dx + \frac{B_1}{1!}(f(n) - f(0)) + \frac{B_2}{2!}(f'(n) - f'(0)) + 
(-1)^3 \frac{1}{2!} \int_{0}^{n} B_2(x - \lfloor x \rfloor)dx
\tag{1}
$$

Where $B_i$ represents the ith Bernoulli Number and it's a whole other business, and $B_i(x)$ is the bernoulli Polynomials, which is whole other business too. 

(1): is a second order representation of the finite sum of a function $f$ over all the non-negative integers. 

Notice that: We can generalize the expression a bit, and get the following expression for the sum, with the remainder term: 

$$
\sum_{j = 0}^{n - 1} \left(f(j)\right)
=
\int_{0}^{n} f(x)dx + \sum_{k = 0}^{m}\frac{B_k}{k!}\left(
    f(n)^{(k)} - f^{(k)}(0) + 
\right)
+
\frac{(-1)^{m + 1}}{m!} \int_{0}^{n} B_m(x - \lfloor x\rfloor)f^{(m)}(x)dx
\tag{2}
$$

(2): Now it's generalized with the remainder for the formula. Given the finite integral of the formula and derivative information, we can figure out the sum of the function over all the non-negative integers. 

Before we prove this, we will need to understand the Bernoulli Polynomials with some properties of the Bernoulli Polynomials, which is used for the proof of the formula we stated above. 

---
### Bernoulli Polynomials, Numbers

