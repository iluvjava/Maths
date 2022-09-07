## Syllabus

1. MATLAB Programming
2. Initial Value Problems: Forward Integration [IVP](IVP.md)
	* Forward Euler, [FE Stability](FE%20Stability.md)
	* Runge-Kutta, [Runge Kutta](Runge%20Kutta.md)
	* Integrator usage, [Adam B.M](Adam%20B.M.md)
3. Initial Value Problems: Implicit Integration and Stability 
 	* Backward Euler 
 	* Integral Methods [Adam B.M](Adam%20B.M.md) 
 	* Predictor-Corrector [Adam B.M](Adam%20B.M.md)
 	* Integrator usage ????
 	* Floating Point Precision [Computer Bad at Maths](Computer%20Bad%20at%20Maths.md)
4. BVP: Shooting Method
	* Application of shooting for solving 2nd order BVP, ODEs [Shooting Method](Shooting%20Method.md)
	* Linear 2nd order BVP (relaxation, collocation) [Direct Method](Direct%20Method.md)
5. Finite Difference Operators for PDE
	* Finite Difference Schemes [Advection Diffusion](Advection%20Diffusion.md)
6. Finite Difference: Solving Linear Problems
	* Method for solving system of Linear equations 
		* [Jacobi Gauss Sediel Iterations](Jacobi%20Gauss%20Sediel%20Iterations.md)
	* Efficiency of the methods
7. Finite Difference: PDE Solution and stability
	* Von-Neumann Stability of Finite Difference Schemes
		* [Von Neuman Stability Analysis](Von%20Neuman%20Stability%20Analysis.md)
		* [Von Neuman Stability Analysis 2](Von%20Neuman%20Stability%20Analysis%202.md)
	* Alternative Discretizations
8. Spectral Methods
	* The Fourier Transform for PDE Solution, Advanced Transforms for PDE Solution
		* [Fourier Transform Fourier Series](Fourier%20Transform%20Fourier%20Series.md)
		* [Spectral Method, Discrete Fourier](Spectral%20Method,%20Discrete%20Fourier.md)
9. Finite Elements
	* Theory, Solving PDE Problems with PDETool
	* [Finite Elements Method](Finite%20Elements%20Method.md)

---

## Objectives
* Modular Understanding with the topics involved in the course syllabus
* Being able to identify the type of problem and then connect it with theories. 
	* Being able to know the pros and cons of different scientific computing approaches for the problem 
* Being able to synthesize the ideas learned from different modules of the class. 

### Summary: Scientific Methods 

1. Accuracy
	1. **Spectral method**: Spectral Accuracy for Smooth function satisfying the correct boundary conditions. 
2. Boundary Conditions 
	1. **Finite Difference Method**: Very general and robust to deal with different boundary conditions. 
3. Implementations
	1. **Finite Difference**: It's easy as long as the operator is easy to get, they are just special sparse matrices. 
	2. **Spectral Method**: It's very short to implement it with the correct FFT libraries in certain programming languages. 
4. Efficiency/Speed
	1. **Spectral Method**: This is the king, very very efficient with the computational complexity, it wins the competitions compare to other methods. 

### Special Domains

* Finite Elements. 