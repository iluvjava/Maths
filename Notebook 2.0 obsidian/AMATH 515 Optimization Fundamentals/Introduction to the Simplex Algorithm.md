It's an iterative algorithm that designed for solving Linear Programming problems. 


---
### **Intro**

The simplex algorithm is an iterative method for solving a linear programming problem. I feel like this algorithm idea is some of the hardest (or weirdest) idea that I had learned, but it turns out to be foundamental to other areas of optimizations. This text is being written around the time of my PhD, 4 years after I was taught about the simplex algorithm. All the contents from here are from my own, based on my own knowledge of the topic. 

A lot of the introductory materials skipped motivations and underlying "WHY" when talking about the simplex algorithm and its representations, e.g: Matrix Environment, Tableau and Dictionary. In addition, I will attempt to link the content of the algorithm to foundational ideas in LP. We wish to know exactly why and when we want to stick to the vertices of the simplex, how the vertices are manifested in the dictionaries, and we make things abstract with structural matrices to understand primal dual tableau correspondence, instead of convincing it via specific examples. The hope is that, after reading this file, aim the readers gained some understand of the simplex algorithm in an algorithmic way, and gains pictural understanding about the underlying manipulations of matrices and vectors with relation to the geometric interpretations of the algorithm. 

---
### **Motivations | Farmer's Dilemma**

Rooted in application, we demonstrates the procedures for solving a linear program in standard form (See [Linear Programming Strong Duality via Farkas, Standard Forms](../AMATH%20514%20Combinatorics%20Optimizations/Linear%20Programming%20Strong%20Duality%20via%20Farkas,%20Standard%20Forms.md) for 3 of the standard froms). 

#### **Problem | The Farmer's Potatoes and Carrots**
> Mr. John is a farmer. He sells potatoes at 1 unit of money and carrots at 2 units. He has 2 units of both potatoes and carrots seeds. He can plant a total unit of 3 land for the two types of crops. What portion of potatoes, carrots seed he should plant to maximize profits? 

**Mathematical Modeling**

In mathematical term, the farmer has $x_1, x_2 > 0$ denoting the potatoes and the carrots. We have limit for both resources in the form of constraint $x_1 \le 2, x_2 \le 2$, and the constraint $x_1 + x_2 \le 3$. Our goal is to maximize $x_1 + 2x_2$


**Simplex Dictionary Method** 

From [A Brutal Introduction to Linear Programming](../AMATH%20514%20Combinatorics%20Optimizations/A%20Brutal%20Introduction%20to%20Linear%20Programming.md) and [Polytopes and Vertices](../AMATH%20514%20Combinatorics%20Optimizations/Polytopes%20and%20Vertices.md), the set of optimal always intersect with a vertex of the feasible region, which is assumed to be bounded, and the description for a vertex on the polytope is a point such that $\ge m$ number of the inequality constraints are tight. To this degree, it suffices to search for each of the vertices in our problem. All solutions of the feasible set in our problem can be characterized by the equation (the equality, inequality, and the implicity non-negativity assumption on $x_1, x_2$): 

$$
\begin{aligned}
    \mathbf 0 \le 
    \begin{bmatrix}
        s_1 \\ s_2 \\ s_3
    \end{bmatrix}
    &= 
    \begin{bmatrix}
        3 \\ 2\\ 2
    \end{bmatrix} - 
    \begin{bmatrix}
        1 & 1
        \\
        1 & 0
        \\
        0 & 1
    \end{bmatrix}
    \begin{bmatrix}
        x_1 \\ x_2
    \end{bmatrix}, 
\end{aligned}
$$

the variable $s_1, s_2, s_3$ are the slack variables, if they are zero, then the corresponding constraint is tight, else, it's a loose constraint. We now assume $(x_1, x_2) = (0, 0)$, hence we are tight on the constraint $x\ge \mathbf 0$, and the origin is one of the vertices of the feasible polytope. Next, directly consider

$$
\begin{aligned}
    & 
    \mathbf 0 \le 
    \begin{bmatrix}
        s_1 \\ s_2 \\ s_3
    \end{bmatrix}
    = 
    \begin{bmatrix}
        3-x_1 \\ 2 - x_1 \\ 2
    \end{bmatrix} - 
    x_2 \begin{bmatrix}
        1 \\ 0 \\ 1
    \end{bmatrix}
    \\
    & \text{Inreases $x_1$ to 1, forces $s_2 = 0$, we need $s_2$ on the LHS. }
    \\
    & \text{Second row minus the first row}
    \\
    & 
    \mathbf 0 \le 
    \begin{bmatrix}
        s_1 - s_2 \\ s_2 \\ s_3
    \end{bmatrix} = 
    \begin{bmatrix}
        1 \\ 2 \\ 2
    \end{bmatrix} - 
    \begin{bmatrix}
        0 & 1 \\
        1 & 0 \\
        0 & 1
    \end{bmatrix}
    \begin{bmatrix}
        x_1 \\ x_2
    \end{bmatrix}
    \\
    & 
    \mathbf 0 \le 
    \begin{bmatrix}
        s_1 \\ x_1 \\ s_3
    \end{bmatrix}= 
    \begin{bmatrix}
        1 \\ 2 \\ 2
    \end{bmatrix} 
    - 
    \begin{bmatrix}
        -1 & 1
        \\
        1 & 0
        \\
        0 & 1
    \end{bmatrix}
    \begin{bmatrix}
        s_2 \\ x_2
    \end{bmatrix}, 
\end{aligned}
$$

Now the tight constraints are $s_1$, the first constraint, and $x_2\ge 0$, the non-negativity constraint for decision variable $x_1$. Next, we consider changing the objective. The changed objective vector reflects unit amount of changes by changing the variable $s_2, x_3$, the tight constraints slacks variables. Let $z = x_1 + 2x$, with $x_1$ on the LHS of the equation, we substitute, giving $(2 - s_2) + 2x_2$, giving us $2 - s_2 + 2x_2$. The new objective vector for the tight constraints is $(-1, 2)$. To increase profits further, it would make sense to increase $x_2$. This is the interpretation. 

**Objective Row as a "Constraint" Trick**

Before pivoting, we introduce an additional trick for the objective. The objective can be interpreted as an equality constraint of the from $2 \ge -s_2 + 2x_2$, by non-negativity constraint of the variables, therefore we gain the equality $0 \le z = 2 -(s_2 - 2x_2)$. We may add it as a constraint to our system, but there is no intrinsic need to play non-negativity constraint to variable $z$, it doesn't have anything to do with feasibility, it's a cheap trick for now but plays some important roles later on, unexpectedly.  

$$
\begin{aligned}
    & 
    \begin{bmatrix}
        s_1 \\ x_1 \\ s_3 \\ z
    \end{bmatrix}
    = 
    \begin{bmatrix}
        1 \\ 2 \\ 2 \\ 2
    \end{bmatrix} - 
    \begin{bmatrix}
        -1 & 1 \\ 1 & 0 \\ 0 & 1 \\ 1 & -2 \\ 
    \end{bmatrix}
    \begin{bmatrix}
        s_2 \\ x_2
    \end{bmatrix}
    \\
    & 
    \text{$x_2$ goes to 1, bottlenecking $s_1$}
    \\
    & \text{row operations:}
    \\
    &
    \begin{bmatrix}
        s_1 \\ x_1 \\ s_3 - s_1 \\ z + 2s_1
    \end{bmatrix}
    = 
    \begin{bmatrix}
        1 \\ 2 \\ 1 \\ 2 + 2
    \end{bmatrix}
    - 
    \begin{bmatrix}
        -1 & 1 \\
        1 & 0 \\
        1 & 0 \\
        -1 & 0
    \end{bmatrix}
    \begin{bmatrix}
        s_2 \\ x_2
    \end{bmatrix}
    \\
    &
    \begin{bmatrix}
        x_2 \\ x_1 \\ s_3 \\ z
    \end{bmatrix}
    =
    \begin{bmatrix}
        1 \\ 2 \\ 1 \\ 4 
    \end{bmatrix}
    - 
    \begin{bmatrix}
        -1 & 1 \\
        1 & 0 \\ 
        1 & -1 \\
        -1 & 2
    \end{bmatrix}
    \begin{bmatrix}
        s_2 \\ s_1
    \end{bmatrix}.
\end{aligned}
$$

Now, both constraints $s_1, s_2$ are now tight, we are selling both potatoes and carrots. But recall that the carrots were twice the price, but we cells $x_2 = 2, x_1 = 1$, and the objective row suggests that, increasing slack $s_2$, which reduces the amount of $x_1$, potatoes, yield more profits. Henc,e we do a pivot on $s_2$, which saturates $s_3$ only, hence: 

$$
\begin{aligned}
    &  
    \begin{bmatrix}
        x_2 + s_3 \\ x_1 \\ s_3 \\ z + s_3 
    \end{bmatrix}
    = 
    \begin{bmatrix}
        2 \\ 1 \\ 1 \\ 4 + 1
    \end{bmatrix}
    - 
    \begin{bmatrix}
        0 & 0 \\
        0 & 0 \\
        1 & -1 \\
        0 & 1
    \end{bmatrix}
    \begin{bmatrix}
        s_2 \\ s_1
    \end{bmatrix}
    \\
    & 
    \begin{bmatrix}
        x_2 \\ x_1 \\ s_2 \\ z
    \end{bmatrix}
    = 
    \begin{bmatrix}
        2 \\ 1 \\ 1 \\ 5
    \end{bmatrix}
    -
    \begin{bmatrix}
        1 & 0 \\ 
        0 & 0 \\
        1 & -1 \\ 
        1 & 1
    \end{bmatrix}\begin{bmatrix}
        s_3 \\ s_1
    \end{bmatrix}, 
\end{aligned}
$$

And as we see, attempt to change any of the tight constraint $s_3, s_1$, will yield less of a profit. By the foundamental theorem of linear programming, and the equivalence characterizations of vertices for polytopes, the optimal values is $(x_1, x_2) = (1, 2)$. And this is the ratio of potatoes and carrots that sells for most amount of money for the farmer. 

**Remarks**

When the problem is unbounded, and the provided initial point is not on a vertex of the feasible region, the simplex method will be unable to start since te number of tight constraint in this case is $< m$. In general, the method provided above supports equality constraints and inequality constraints, the objective constraint trick essentially introduced an equality constraint to the system, by linking the objective to a free variable $z$. The assumption of the decision variable can be loosen, making it possible to increase, and decrease the tight variables (non-basic variables) depending on the type of objective value. 

---
### **The Simplex Tableau Method**

Some people prefers simplex tableau method. I used to do so as well, now I had gotten older, I stick to the simplex dictionary because it's more elementary. To see, we can derive the simplex tableau form from, the simplex dictionary form of the LP standard form. 

$$
\begin{aligned}
    \begin{bmatrix}
        s \\ \zeta
    \end{bmatrix} &= 
    \begin{bmatrix}
        b \\ 0
    \end{bmatrix}
    - 
    \begin{bmatrix}
        A \\ -c^T
    \end{bmatrix} x
    \\
    \begin{bmatrix}
        s 
        \\ 
        \zeta
    \end{bmatrix}
    +
    \begin{bmatrix}
        A \\ -c^T
    \end{bmatrix}x 
    &= 
    \begin{bmatrix}
        b \\ 0
    \end{bmatrix}
    \\
    \begin{bmatrix}
        A & I & \mathbf 0\\
        -c^T & \mathbf 0^T & 1
    \end{bmatrix}
    \begin{bmatrix}
        x \\ s \\ \zeta
    \end{bmatrix}
    &= 
    \begin{bmatrix}
        b \\ 0
    \end{bmatrix}
    \\
    \text{in augmented matrix form} &
    \begin{bmatrix}
        \left.
        \begin{matrix}
            A & I & \mathbf 0\\
            -c^T & \mathbf 0^T & 1
        \end{matrix}
        \right|
        & \hspace{-1.2em}
        \begin{matrix}
            b \\ 0
        \end{matrix}
    \end{bmatrix}, 
\end{aligned}
$$

and that is what the simplex tableau method is trying to do. I personally don't like it, disregarding that it's popular and people use it. I think it's overly lavish and it sticks too strictly to simplex standard form. Which is expected since additional information about, which variables corresponds to which colum and their signs, are all fixed standard for better communications. The dictionary method is better, in the sense that it has this "original flavor" and it's probably the first thing people learned from linear programming. 


---
### **Primal Dual Simplex in Actions**

Using the same example, we illsutrate one step of pivoting on both the primal and dual simplex with colors. 

$$
\begin{aligned}
    & b = \begin{bmatrix}
        3 \\ 2 \\ 2
    \end{bmatrix}, 
    c = \begin{bmatrix}
        1 & 2
    \end{bmatrix}, 
    A = \begin{bmatrix}
        1 & 1 \\ 1 & 0 \\ 0 & 1
    \end{bmatrix}
    \\
    & \text{primal: }
    \max_{x\ge \mathbf 0} (\xi = c^T x) \text{ s.t: } Ax \le b, \text{ with } b - Ax = s, s \ge \mathbf 0
    \\
    & \text{dual: }
    \min_{y\ge 0} (\eta = b^T y) \text{ s.t: } A^Ty - u = c, y \ge \mathbf 0, u \ge \mathbf 0, 
\end{aligned}
$$

The primal and duals are another key aspect of optimizations, for more context regarding duals for a linear program, see [KKT in Linear Programming](../AMATH%20514%20Combinatorics%20Optimizations/KKT%20in%20Linear%20Programming.md), [Linear Programming Strong Duality via Farkas, Standard Forms](../AMATH%20514%20Combinatorics%20Optimizations/Linear%20Programming%20Strong%20Duality%20via%20Farkas,%20Standard%20Forms.md) for more information. We now list the primal and dual simplex dictionary: 

$$
\begin{aligned}
    \text{primal: }
    \begin{bmatrix}
        s_1\\ s_2\\ s_3
        \\ \xi
    \end{bmatrix}
    &= 
    \begin{bmatrix}
        \textcolor{green}{3} \\ 
        \textcolor{green}{2} \\ 
        \textcolor{green}{2} \\ 
        \textcolor{blue}{0}
    \end{bmatrix}
    - 
    \begin{bmatrix}
        \textcolor{red}{1} & \textcolor{red}{1} \\ 
        \textcolor{red}{1} & \textcolor{red}{0} \\ 
        \textcolor{red}{0} & \textcolor{red}{1} 
        \\ 
        \textcolor{blue}{-1} & \textcolor{blue}{-2}
    \end{bmatrix}\begin{bmatrix}
    x_1 \\x_2
    \end{bmatrix}
    \\
    \text{dual: }
    \begin{bmatrix}
        -u_1 \\ -u_2 \\ -\eta
    \end{bmatrix}
    &= 
    \begin{bmatrix}
        \textcolor{blue}{1} \\ \textcolor{blue}{2} \\ \textcolor{blue}{0}
    \end{bmatrix}
    - 
    \begin{bmatrix}
        \textcolor{red}{1} & \textcolor{red}{1} & \textcolor{red}{0} \\ 
        \textcolor{red}{1} & \textcolor{red}{0} & \textcolor{red}{1} \\ 
        \textcolor{green}{3} & \textcolor{green}{2} & \textcolor{green}{2}
    \end{bmatrix}
    \begin{bmatrix}
        y_1 \\ y_2 \\ y_3
    \end{bmatrix}
\end{aligned}
$$

Performing a pivot on primal, choosing $x_1$ to exist and then $s_2$ to enter, and for dual, choosing $y_2$ to exit and $-u_1$ to enter, which is about: 

$$
\begin{aligned}
    \text{primal: }
    \begin{bmatrix}
        s_1 - s_2 \\ s_2 \\ s_3 \\ \xi + s_2
    \end{bmatrix}
    &= 
    \begin{bmatrix}
        \textcolor{green}{3-1} \\ 
        2 \\ 
        \textcolor{green}{2} \\ 
        \textcolor{blue}{0 + 2}
    \end{bmatrix}
    - 
    \begin{bmatrix}
        0 & \textcolor{red}{1} \\ 
        1 & 0 \\ 
        0 & \textcolor{red}{1} 
        \\ 
        0 & \textcolor{blue}{-2}
    \end{bmatrix}\begin{bmatrix}
    x_1 \\x_2
    \end{bmatrix}
    \\
    \begin{bmatrix}
        s_1\\ x_2\\ s_3
        \\ \xi
    \end{bmatrix}
    &= 
    \begin{bmatrix}
        \textcolor{green}{1} \\ 
        \textcolor{green}{2} \\ 
        \textcolor{green}{2} \\ 
        \textcolor{blue}{2}
    \end{bmatrix}
    - 
    \begin{bmatrix}
        \textcolor{red}{-1} & \textcolor{red}{1} \\ 
        \textcolor{red}{1} & \textcolor{red}{0} \\ 
        \textcolor{red}{0} & \textcolor{red}{1} 
        \\ 
        \textcolor{blue}{1} & \textcolor{blue}{-2}
    \end{bmatrix}
    \begin{bmatrix}
        s_2 \\x_2
    \end{bmatrix}
    \\[3em]
    \text{dual: }
    \begin{bmatrix}
        -u_1 \\ -u_2 \\ -\eta - 2(-u_1)
    \end{bmatrix}
    &= 
    \begin{bmatrix}
        1 
        \\ 
        \textcolor{blue}{2 }
        \\ 
        \textcolor{blue}{-2}
    \end{bmatrix}
    - 
    \begin{bmatrix}
        1 & 1 & 0 \\ 
        \textcolor{red}{1} & 0 & \textcolor{red}{1} \\ 
        \textcolor{green}{3} & 2 & \textcolor{green}{2}
    \end{bmatrix}
    \begin{bmatrix}
        y_1 \\ y_2 \\ y_3
    \end{bmatrix}
    \\
    \begin{bmatrix}
        -y_2 \\ -u_2 \\ -\eta
    \end{bmatrix}
    &= 
    \begin{bmatrix}
        \textcolor{blue}{-1} \\ \textcolor{blue}{2} \\ \textcolor{blue}{-2}
    \end{bmatrix}
    - 
    \begin{bmatrix}
        \textcolor{red}{-1} & \textcolor{red}{1} & \textcolor{red}{0} \\ 
        \textcolor{red}{1} & \textcolor{red}{0} & \textcolor{red}{1} \\ 
        \textcolor{green}{1} & \textcolor{green}{2} & \textcolor{green}{2}
    \end{bmatrix}
    \begin{bmatrix}
        y_1 \\ y_2 \\ y_3
    \end{bmatrix}
\end{aligned}
$$

Observe that, firstly, the primal and dual disctionary are identical up to a sign different for entries in sharing the same color. Next, observe that, the dual is giving an infeasible solution while the primal gives a feasible solution. This is the *Primal Dual Simplex Correspondence*. By doing mental transformation between the primal and dual, one can choose $\mathbf 0$ to be feasible for the dual and pivot on dual for the solution of the primal. During the operations we have: 
1. The primal slacks <--> Objective row of the dual. 
2. Primal objective row <--> Dual slack vars. 
3. When optimal is reached, the objective and the primal and dual is the same. 

**Reading the Dual Information from the Primal Dictionary**

The primal slack variables $s_1, s_2, s_3$ corresponds to the dual decision variable $y_1, y_2, y_3$. After the pivoting, $s_2$ has coefficient $-1$ on the objective row, which means that $y_2 = -1$ (Which is unfeasible), with an additional negative sign. Observe that if the slack is zero, then the dual variable corresponding to it is non-zero. 

---
### **Abstraction of the Dual Simplex Dictionary Method**

The [simplex tableau](https://en.wikipedia.org/wiki/Simplex_algorithm#Simplex_tableau) method is an abstraction of the simplex dictionary method. It suffices to write everything in equation form and never mention the use of the simplex tableau method. Furthermore, the equation form also provides the advantages since also looks like the matrix environment method. In this section, we write the simplex method where we only do one pivot each time in an abstract way, together with the dual simplex problem. We attempt to hinted at the equivalent between the primal and dual simplex pivoting through a level of abstraction of the algorithm. 

We now write the primal and the dual in abstract form, which can be given as 

$$
\begin{aligned}
    \max_{x \ge \mathbf 0}  \{ \langle c, x\rangle | Ax \le b\}
    \le \min_{y\ge \mathbf 0} \{
        \langle b, y\rangle | A^Ty \ge c
    \}
\end{aligned}
$$

They have dictionary of the form 

$$
\begin{aligned}
    \begin{bmatrix}
        s \\ \zeta
    \end{bmatrix} &= 
    \begin{bmatrix}
        b \\ 0
    \end{bmatrix}
    - 
    \begin{bmatrix}
        A \\ -c^T
    \end{bmatrix} x
    \\
    \begin{bmatrix}
        -u \\ -\eta
    \end{bmatrix}
    &= 
    \begin{bmatrix}
        c \\ 0
    \end{bmatrix} - 
    \begin{bmatrix}
        A^T \\ b^T
    \end{bmatrix}y, 
\end{aligned}
$$

We want to perform a pivot on these dictionary and show that, the correspondence appeared in the example symbolically holds up. For this purprose, it suffices to assume WLOG that, we pivot on $x_1$ and $s_1$ exists, which corresponds to $y_1$ enters and $-u_1$ exits, because the dictionaries are, equivalent up to a permutations of $x, s$, or $y, u$. To start, we partition the block matrices in a way that is friendly for the pivoting. 

$$
\begin{aligned}
    & 
    \begin{cases}
        a = A_{1, 1}
        \\
        \vec p = A_{2:, 1}
        \\
        \vec q = A_{1, 2:}
        \\
        \overline A = A_{2:, 2:}
    \end{cases}
    \\
    \text{primal: }
    \begin{bmatrix}
        s_1 \\ \vec s_2 \\ \xi
    \end{bmatrix}
    &= 
    \begin{bmatrix}
        b_1 \\ \vec b_2 \\ \alpha
    \end{bmatrix}
    - 
    \begin{bmatrix}
        a & q^T
        \\
        \vec p & \overline A
        \\
        -c_1 & - \vec c_2
    \end{bmatrix}
    \begin{bmatrix}
        x_1 \\ \vec x_2
    \end{bmatrix}
    \\
    \text{dual: }
    \begin{bmatrix}
        -u_1 \\ - \vec u_2 \\ -\eta
    \end{bmatrix}
    &= 
    \begin{bmatrix}
        c_1 \\ \vec c_2 \\ \beta
    \end{bmatrix} - 
    \begin{bmatrix}
        a & \vec p^T
        \\
        \vec q & \overline A^T
        \\
        b_1 & \vec b_2
    \end{bmatrix}
    \begin{bmatrix}
        y_1 \\ \vec y_2, 
    \end{bmatrix}
\end{aligned}
$$

We now perform the pivoting for the primal prblem.  

$$
\begin{aligned}
    \begin{bmatrix}
        a^{-1} s_1 
        \\
        \vec s_2 - a^{-1} \vec p s_1
        \\
        \xi - a^{-1}(-c_1)s_1
    \end{bmatrix}
    &= 
    \begin{bmatrix}
        a^{-1}b_1 \\ \vec b_2 - b_1 a^{-1} \vec p
        \\
        \alpha - a^{-1}(-c_1)b_1
    \end{bmatrix}
    -
    \begin{bmatrix}
        1 & a^{-1}\vec q  
        \\
        \mathbf 0 & \overline A - a^{-1} \vec p \vec q^T
        \\
        0 & -\vec c_2 - a^{-1}(-c_1)\vec q^T
    \end{bmatrix}
    \begin{bmatrix}
        x_1 \\ \vec x_2
    \end{bmatrix}
    \\
    \begin{bmatrix}
        0 \\ \vec s_2 \\ \xi
    \end{bmatrix}
    + 
    s_1
    \begin{bmatrix}
        a^{-1} \\ a^{-1} \vec p \\ a^{-1} c_1
    \end{bmatrix}
    &=
    \begin{bmatrix}
        a^{-1}b_1 \\ \vec b_2 - b_1 a^{-1} \vec p
        \\
        \alpha - a^{-1}(-c_1)b_1
    \end{bmatrix}
    - 
    x_1 
    \begin{bmatrix}
        1 \\ \mathbf 0 \\ 0
    \end{bmatrix} - 
    \begin{bmatrix}
        a^{-1}\vec q \\
        \overline A - a^{-1} \vec p \vec q^{T}
        \\
        -\vec c_2 + a^{-1}c_1 \vec q^{T}
    \end{bmatrix}x_2
    \\
    \begin{bmatrix}
        x_1 \\ \vec s_2 \\ \xi
    \end{bmatrix} &= 
    \begin{bmatrix}
        \textcolor{green}{a^{-1}b_1}
        \\ 
        \textcolor{green}{\vec b_2 - b_1 a^{-1} \vec p}
        \\
        \textcolor{blue}{\alpha - a^{-1}(-c_1)b_1}
    \end{bmatrix}
    - 
    \begin{bmatrix}
        \textcolor{red}{a^{-1}} & \textcolor{red}{a^{-1}\vec q }
        \\
        \textcolor{red}{a^{-1}q} & \textcolor{red}{\overline A - a^{-1} \vec p \vec q^{T}}
        \\
        \textcolor{blue}{a^{-1}c_1}
        & 
        \textcolor{blue}{-\vec c_2 + a^{-1}c_1 \vec q^{T}}
    \end{bmatrix}
    \begin{bmatrix}
        s_1 \\ \vec x_2
    \end{bmatrix}
\end{aligned}
$$

We now perform the same pivoting on the dual problem. 

$$
\begin{aligned}
    \begin{bmatrix}
        -a^{-1}u_1 
        \\ 
        - \vec u_2 - (-u_1)a^-1{} \vec q
        \\
        -\eta - (-u_1)a^{-1}b_1
    \end{bmatrix}
    &= 
    \begin{bmatrix}
        a^{-1}c_1 \\ 
        \vec c_2 - c_1 a^{-1}\vec q \\
        \beta - c_1 b_1 a^{-1}
    \end{bmatrix}
    - 
    \begin{bmatrix}
        1 & a^{-1} \vec p^{T} \\
        \mathbf 0 & \overline A^{T} - a^{-1}\vec q \vec p^{T}
        \\
        0 & \vec b_2^T - a^{-1}b_1 \vec p^T
    \end{bmatrix}
    \begin{bmatrix}
        y_1 \\ \vec y_2
    \end{bmatrix}
    \\
    \begin{bmatrix}
        0 \\ -\vec u_2 \\ -\eta
    \end{bmatrix}
    + 
    (-u_1) \begin{bmatrix}
        a^{-1} \\ a^{-1}\vec q  \\ -a^{-1}b_1
    \end{bmatrix}
    &= 
    \begin{bmatrix}
        a^{-1}c_1 \\ 
        \vec c_2 - c_1 a^{-1}\vec q \\
        \beta - c_1 b_1 a^{-1}
    \end{bmatrix}
    -
    y_1 \begin{bmatrix}
        1 \\ \mathbf 0 \\ 0
    \end{bmatrix}
    -
    \begin{bmatrix}
        a^{-1}\vec p^T
        \\
        \overline A^T - a^{-1} \vec q \vec p^T
        \\
        \vec b_2^T - a^{-1}b_1 \vec p^T
    \end{bmatrix}
    \begin{bmatrix}
        -u_1 \\ y_2
    \end{bmatrix}
    \\
    \begin{bmatrix}
        y_1 \\ -\vec u_2 \\ -\eta 
    \end{bmatrix}
    &= 
    \begin{bmatrix}
        \textcolor{blue}{a^{-1}c_1 }
        \\ 
        \textcolor{blue}{\vec c_2 - c_1 a^{-1}\vec q }
        \\
        \textcolor{blue}{\beta - c_1 b_1 a^{-1}}
    \end{bmatrix}
    -
    \begin{bmatrix}
        \textcolor{red}{a^{-1} }
        &
        \textcolor{red}{a^{-1}\vec p^T}
        \\
        \textcolor{red}{-a^{-1}\vec q }
        & 
        \textcolor{red}{\overline A^T - a^{-1}\vec q \vec p^T}
        \\
        \textcolor{green}{- a^{-1}b_1}
        &
        \textcolor{green}{\vec b_2 - a^{-1} b_1 \vec q^T}
    \end{bmatrix}
    \begin{bmatrix}
        -u_1 \\ y_2
    \end{bmatrix}, 
\end{aligned}
$$

As we can see, the primal dual correspondence of the Simplex dictionary indeed matches up. Hence, if any one of the primal dual problems are feasible for the initial solution $\mathbf 0$, we can solve the primal by thinking about its dual. 

---
### **Degeneracy, Cycling**