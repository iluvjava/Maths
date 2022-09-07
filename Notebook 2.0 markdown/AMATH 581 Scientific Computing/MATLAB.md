## MATLAB Quick Reference

---

AMATH 581 Linked: 
[Experiements with MATLAB](https://www.mathworks.com/moler/exm.html)
[Numerical Computing with MATLAB](https://www.mathworks.com/moler/chapters.html)

---
**For the Following section, type keyword into google to learn more, here is a quick cheat sheet for reference**

Here is a list of help commands can in matlab: 
* `help`, `lookfor`, `doc`

---

## IO, Workspace
* clear stuff: `clc; clear all; close all`
* save: `save`, `saveas`
* [save stuff](https://www.mathworks.com/help/matlab/matlab_env/save-load-and-delete-workspace-variables.html#mw_093429e0-f588-4d9b-8eae-00bddea902a4)
* change command window view: `format`
---
## Ploting
* Styles: 
	* `axis`
	* `box`
	* `yticks`, `xticks`
	* `ylim`, `xlim`
* Labeling:
	* `ylabel`
	* `xlabel`
	* `legend`
	* `title`
* Meta:
	* `figure`
	* `clf`
	* `hold`: overlay plots
* Plotting:
	* `plot`
	* `plot3`
	* `surf`
		* `meshgrid`
---
## Data Types
* `num2str`, ['a', num2str(num)]
* `+` for direct string concat
* `(,,)`: Indexer for matrix, multiple inputs supported, 
	* `(, :)`: select the whole row in a matrix 
* `?:?:?`: from, increment, the same as `linspace`
* `{}` indexer for cells

---
## Operators 
* `+`, `-`, `*`, `/`, `^`
* `.` precedes with the above operators to degenerate then to an elementwise operator
* `\` matrix solve
* `'` complex conjugate transpose 
* `~` negation, different from other programming languages. 
* `|`, `&` OR, AND logical operator 
---

## Func
* Below is in-script/seperated fxn declarations
	```
	funciton output = FxnName(arg1, arg2)
		output = % codes that gets outputs
	end
	```
* Default param: SUPPORTED
* Multiple outputs: 
	* Change `output` to `[output1, output2]` in above example

* Multiple inputs: 
	* `nargin`
	* `nargout`: auto detect output on the output client side
	* `varargin`: any length of inputs, input is type: cell
	* `varargout`: cell type for output arbitrary length of outputs
* inline func: `f = @(x) x.^2`
* `@` function handle, tell the program that this is a function passed as a variable to another function.

---

## Routines/Control Flow
* For
```
for v = 1.0:-0.2:0.0
   disp(v)
end

for k = [1, 2, 3, 5, 6]
	disp(k)
end
```
* While
```
limit = 0.8;
s = 0;

while 1
    tmp = rand;
    if tmp > limit
        break
    end
    s = s + tmp;
end
```

---

## Basic Maths
* `sum`, `sqrt`, `abs`, `norm`, `diff`, `sin`, `cos`, `exp`, `log`

---

## Matrix Generation 
* `zeros`
* `ones`
* `rand`

## ODEs
* `ode23`: Heun's/ RK2 iteration scheme.
* `ode45`: Runge Kutta scheme.
* `ode113`: Multi-Step method, predictor corrector order, from first order to 11th order in terms of accuracy.
* `ode15s`: It's for stiff problems.

> Adaptive time steps, when something challenging is happening i n time stepping, it will shorten its time step to get a better predictions for the function. 
> Options of ODE and synatx:

```matlab
[t, y] = ode45(@rhs, tspan, yinit, options)  % rhs(t, y)
```
* `t = [t_0, t_1... ]` The time steps while solving the equations. 
* `y = [y_1, y_2]`, stored as collumn vector for the matrix. 
* Options: 
	* `tspan = [t_0, t_end]`, Matlab will try satisfy the order of accuracy for this time interval, and it will up all values in here. 
	* `tspan= [t_0:dt:t_end]`, Or, you can specify the output for particular points, and matlab will tells you after the adaptive time stepping scheme. 
	* `yinit`: The initial value of the initial conditions, and this will be y value as: 
		* `y = [;;;;;.... ]`
		* If the dimension agrees, then this will be set to the initial condition for the problem to start with the time stepping. 
	* `@(t, y) rhs(t, y, alpha)`
		* Package the parameters as an inline function.



