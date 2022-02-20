Make sure to read: [[Finite Element 1D Formally Introduced]] first for some background on this topic. 


---
### **Intro**

We are interested to introduce 2D finite element method under the context of solving for the Steady State Poisson Equations for 2D problem, that is non-homogenous and without any time domain evolution. 

Firstly, create an coordinate index to linear index converstion notation by: 

$$
\mathcal{I}(i, j) = i + (j - 1)n_x
$$

Where, the grid will ne $n_x\times n_y$ denoting the number of partitioning on the $x, y$ direction, for the unit square $[0, 1]^2$. Then we define: 

**Tent Basis Function**


$$
\varphi_{\mathcal{I}(i, j)}(x, y)
= \begin{cases}\frac{\left(x-x_{i-1}\right)\left(y-y_{j-1}\right)}{\left(x_{i}-x_{i-1}\right)\left(y_{j}-y_{j-1}\right)} & \text { in }\left[x_{i-1}, x_{i}\right] \times\left[y_{j-1}, y_{j}\right] \\ \frac{\left(x-x_{i+1}\right)\left(y-y_{j-1}\right)}{\left(x_{i}-x_{i+1}\right)\left(y_{j}-y_{j-1}\right)} & \text { in }\left[x_{i}, x_{i+1}\right] \times\left[y_{j-1}, y_{j}\right] \\ \frac{\left(x-x_{i-1}\right)\left(y-y_{j+1}\right)}{\left(x_{i}-x_{i-1}\right)\left(y_{j}-y_{j+1}\right)} & \text { in }\left[x_{i-1}, x_{i}\right] \times\left[y_{j}, y_{j+1}\right] \\ \frac{\left(x-x_{i+1}\right)\left(y-y_{j+1}\right)}{\left(x_{i}-x_{i+1}\right)\left(y_{j}-y_{j+1}\right)} & \text { in }\left[x_{i}, x_{i+1}\right] \times\left[y_{j}, y_{j+1}\right] \\ 0 & \text { elsewhere }\end{cases}
$$

There are $n_xn_y$ total number of these Bi-linear basis function. 

---
### **Weak Conditions Reformulated in 2D**



