Exploit the Conservative vectof field for line integrals. 

Prereq: [[Line Integral]], [[Ortho Curvillinears Coord]], [[The Gradient]], [[Curvilinear Gradient]]

---

#### When it Comes to Solving Line Integral 

* Test if the vector field is curl free, if it is, then we will know that that there eixsts a potential for the vector field, and it's easy to just test the vector field and then take the integral to recover the potential function. 

* If the vector field is presented in the **curvilinear coordinates**, then we are going to use the Curl in Curvilinear coordinates! 

Take notes that, when computing the curl of over the Curvilinear Coordinates of the function, we need to use the following formula from [[Curl]]

And after finding the curl of the vector field over the Curvilinear Coordinates, we wil need to solve the following equation to get potential under the Curvilinear Coordinates: 

> $$\nabla \Phi = \vec{F}$$

And under curvilinear coordinates, this will look like this: 

$$
\begin{bmatrix}
	\frac{1}{h_1}\partial_{u_1}\Phi
	\\[0.5em]
	\frac{1}{h_2}\partial_{u_2}\Phi
	\\[0.5em]
	\frac{1}{h_3}\partial_{u_3}\Phi
\end{bmatrix}_{(e_1, e_2, e_3)}
=
\vec{F}
$$

Notice that, we need to move Lame Coefficient before integrating the Vector field to get the Potential. 
