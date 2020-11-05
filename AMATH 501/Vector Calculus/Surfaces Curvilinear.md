Surface integral but with curvilinear coordinates. 
prereq: [[Surfaces]], [[Ortho Curvilinears Coord]]
$$
\newcommand{\uvec}[1]{\hat{\textbf{#1}}}
$$


---

Given any curvilinear coordinates, we need to figure out the representation of the surface integrand: $dS$ so we make the integral. 

$$dS = ||\partial_v r \times \partial_u r||dudv$$

Where, $r(u, v)$ is some kind parametric surfaces in Curvilinear coordinates. Now, notice that the partial derivative under the Curvilinear coordinates are related to the Lame Coefficients and the basis vector: 

$$\partial_u r = h_1\uvec{e}_1$$ $$\partial_v r = h_2\uvec{e}_2$$

Using the fact that the coordiniates is curvilinear, we know that: 

$$
\partial_v r \times \partial_u r = h_1h_2\uvec{e}_3
$$

**Note**:
Yes we can compute the integrand $dS$ directly from the ground up, but notice that, when we know the mapping belongs to a curvilinear coordinates, that means we can use this formula to make our life easier. 