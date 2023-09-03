### **Intro**

We seek to solve the following problems: 

$$
\begin{aligned}
    & \underset{x\in \mathbb E}{\text{argmin}} 
    \left\lbrace
        f(x)
        +
        \sum_{i = 1}^{n} \alpha_i \Vert x - y_i\Vert_2^2
    \right\rbrace
    \\
    = &
    \underset{x\in \mathbb E}{\text{argmin}} 
    \left\lbrace
        f(x) +
        \sum_{i = 1}^{n} \frac{\alpha_i}{2} \Vert x - y_i\Vert_2^2
    \right\rbrace
    \\
    = &
    \underset{x\in \mathbb E}{\text{argmin}} 
    \left\lbrace
        f(x)
        +
        \sum_{i = 1}^{n} \Vert \alpha_i^2 x - \alpha_i^2y_i\Vert_2^2
    \right\rbrace, 
\end{aligned}
$$

And we will focus on the middle due to its format being easier. we use some basic algebra tricks giving us: 


$$
\begin{aligned}
    & \underset{x\in \mathbb E}{\text{argmin}}
    \left\lbrace
        f(x) + 
        \sum_{i = 1}^{n} \frac{\alpha_i}{2} \Vert x - y_i\Vert_2^2
    \right\rbrace
    \\
    = &
    \underset{x\in \mathbb E}{\text{argmin}}
    \left\lbrace
        f(x) + 
        \sum_{i = 1}^{n}\frac{\alpha_i}{2}\Vert x\Vert^2_2
        - \langle x, \alpha_iy_i\rangle
    \right\rbrace
    \\
    = &
    \underset{x\in \mathbb E}{\text{argmin}}
    \left\lbrace
        f(x) + 
        \left(
            \sum_{i = 1}^{n}\frac{\alpha_i}{2}
        \right)\Vert x\Vert_2^2 - 
        \left\langle x, \sum_{i = 1}^{n}\alpha_i y_i
        \right\rangle
    \right\rbrace \quad \text{let: }\eta = \sum_{i = 1}^{n}\alpha_i
    \\
    = &
    \underset{x\in \mathbb E}{\text{argmin}}
    \left\lbrace
        \frac{f(x)}{\eta} + 
        \Vert x\Vert^2 - 
        2\left\langle x, \sum_{i = 1}^{n}\frac{\alpha_i}{\eta} y_i
        \right\rangle
    \right\rbrace
    \\
    = & 
    \underset{x\in \mathbb E}{\text{argmin}}\left\lbrace
        \Vert x - \overline{y}\Vert_2^2
    \right\rbrace \quad \text{where: } \overline{y} = \frac{\sum_{i = 1}^{n}\alpha_iy_i}{\eta}. 
\end{aligned}
$$

And that completes the proof. This is used for helping with the proximal mapping. 


