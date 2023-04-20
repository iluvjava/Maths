Let's talk about Order statistics here. 
[Expectations of Random Variables without Sigma Algebra](../MATH%20000%20Math%20Essential/Probability,%20Stats,%20Combinatorics,%20Information%20Theory/Expectations%20of%20Random%20Variables%20without%20Sigma%20Algebra.md), 
[PDFs, PMFs](../MATH%20000%20Math%20Essential/Probability,%20Stats,%20Combinatorics,%20Information%20Theory/PDFs,%20PMFs.md), 
[IDD RVs](IDD%20RVs.md)

---

### **Intro**

Given a random variable $X_{(j)}$, and it denotes the jth element in a sample of idd rvs. And for the while sample of observation made from a distribution can be written as: 

$$
X_{(1)} \le X_{(2)} \le X_{(3)} \cdots \le X_{(n)}
$$

Then, (This is given as a fact) the PDF for the rv $X_{(j)}$ is given as: 

> $$
> f_{X_{(j)}}(x) = 
> \frac{n!}{(n - j)!(j - 1)!} 
> F(x)^{j - 1}(1 - F(x))^ {n - j}f(x)
> $$

Where $F(x), f(x)$ are the CDF, PDF for the random variable.  Note that, there are some kind of Binomial Distribution involved, and it shouldn't be surprising, because, we are looking for the number of combinations were $(n - j)$ number of observation is larger than a value: $x$. This just a fact that can be directly applied.  

