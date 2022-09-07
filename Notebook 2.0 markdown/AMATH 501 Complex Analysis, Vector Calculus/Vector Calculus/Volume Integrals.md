Here we are going to discuss about the volumn integrals. 

prereq: [Ortho Curvillinears Coord](Ortho%20Curvillinears%20Coord.md)

---


There is not much in the normal coordinates for the volumn integral, it will look like this: 

> $$\underset{V}{\iiint} f(x, y, z) dxdydz$$

Where the function $f(x, y, z)$ is the density function, representing the density of the mass in the space. 

#### Curvilinear Coordinates 

Under the curvilinear coordinates, the integral will be redefined. Suppoed that we are looking the curilinear mapping $r(u_1, u_2, u_3) = (u_1(u_1, u_2, u_3), u_2(u_1, u_2, u_3), u_3(u_1, u_2, u_3))$.  

Then, the integral in general (Not just curvilinear mapping) is going to be like: 

> $$dV = \partial_{u1}r\cdot (\partial_{u2} r \times \partial_{u3} r)du_1du_2du_3$$

And notice that this is just a scalar, and then also observe the fact that under the curvilinear coordinate, the expression can be simplified to: 

> $$dv = h_1h_2h_3du_1du_2du_3$$

And hence, given any function that is curvilinear coordinates, the volume integral will become: 

> $$\underset{V}{\iiint} f(u_1, u_2, u_3) h_1h_2h_3du_1du_2du_3$$




