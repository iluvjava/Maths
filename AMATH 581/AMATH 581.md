## Syllabus

1. MATLAB Programming
2. Initial Value Problems: Forward Integration [[IVP]]
	* Forward Euler, [[FE Stability]]
	* Runge-Kutta, [[Runge Kutta]]
	* Integrator usage, [[Adam B.M]]
3. Initial Value Problems: Implicit Integration and Stability 
 	* Backward Euler 
 	* Integral Methods [[Adam B.M]] 
 	* Predictor-Corrector [[Adam B.M]]
 	* Integrator usage ????
 	* Floating Point Precision [[Computer Bad at Maths]]
4. BVP: Shooting Method
	* Application of shooting for solving 2nd order BVP, ODEs [[Shooting Method]]
	* Linear 2nd order BVP (relaxation, collocation) [[Direct Method]]
5. Finite Difference Operators for PDE
	* Finite Difference Schemes [[Advection Diffusion]]
6. Finite Difference: Solving Linear Problems
	* Method for solving system of Linear equations 
		* [[Iterative Method]]
	* Efficiency of the methods
7. Finite Difference: PDE Solution and stability
	* Von-Neumann Stability of Finite Difference Schemes
		* [[PDEs Stability Analysis]]
		* [[PDEs Stability Analysis 2]]
	* Alternative Discretizations
8. Spectral Methods
	* The Fourier Transform for PDE Solution, Advanced Transforms for PDE Solution
		* [[Fourier Transform Fourier Series]]
		* [[Spectral Method]]
9. Finite Elements
	* Theory, Solving PDE Problems with PDETool
	* [[Finite Elements Method]]

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