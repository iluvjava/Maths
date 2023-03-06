We introduce all the list definition for the commonly used notations for tracking the growth of functions. See [here](https://en.wikipedia.org/wiki/Big_O_notation#Family_of_Bachmann%E2%80%93Landau_notations) for more details about it. 

---
### **Intro**

Given a parameters related to the original problem, the complexity measures the number of operations involved for a given parameters on the problem. Generally, we let parameter $n$ to model the size of the problem and the complexity function to model the runtime of the algorithm. We make assumptions on what operations costs a unit amount of time, and then we count the total runtime based on that particular operations. 

---
### **Worst Case Complexity**

An absolute upper bound for the runtime of the algorithm as a class of functions. 

**Definition: Big O**: 
> An algorithm executes a with atomic operation (that takes 1 time) in $\mathcal O(f(n))$ for parameter $n$ if for some constant $c, n_0$, we have: $t\le cf(n)\; \forall n \ge n_0$, where $t$ is the total amount of operations it takes to run the algorithm for *any instance* of problem with size $n$. 

**Observations**: 

Different to common definition, if we assume that an atomic operations takes $1$ unit amount of time to execute, then the runtime of the algorithm is a function $g(n)\in \mathcal O(f(n))$ if and only if $t(n)\in \mathcal O(f(n))$. 

If the number of operations it takes is $\mathcal O(n^2)$, then, for all functions $f$ in $\mathcal O(n)$, we have $f\in O(n^2)$ as well. The upper bound for a complexity function can be loose. 

**Theorem: Limit Characterizations of the Big-O**

> $f(n)\in \mathcal O(g(n))$ if and only if $\exists C < \infty: \lim_{n\rightarrow \infty}f(n)/g(n)\le C$. 

**Remarks**
There can be more than one parameter. 


---
### **Best Canse Complexity**

The best case complexity asks for an lower bound on the number of atomic operations required. 

**Definition: Big Omega**

> An algorithm has complexity of $\Omega(f(n))$ if, for all instances of the problem with size $n$ such that, there exists $c,n_0$ where for all $n\ge n_0$ we have $t\ge cf(n)$, with $\infty > c > 0$ and $t$ is the total number of operations needed to solve the problem using this algorithm. 

**Obervation:**

The bound for the lower bound on a complexity can be loose as well. If for a problem the least amount of time for it to runs, among all possible instance of problem size $n$ is $\Omega (n^2)$, then it's also $\Omega (n)$. 

