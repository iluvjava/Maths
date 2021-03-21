This is a good example for seeing some of the interesting properties arises from the insect system. 

[[Bifurcation 1D]]

Concepts: 
1. Non-dimensionalization
2. Using graph to reason about fixed points and bifurcations
3. Hysteresis and loss of stability of the system. 

---

### Intro
We need to model the populations of the insects under environmental factors, and in sense, it gives us the following raw model to work with: 

> $$\frac{dN}{dt} = RN \left(1 - \frac{N}{K}
> \right)
> -\frac{BN^2}{A^2 + N^2}
> $$

**Observe:**
The function above is having way to many parameters to model with, and hence, we need to rescale the time and populations to reduce the  number of parameters involved. 

---
### None-Dimensionalization
Start with indetermined scale factors for the populations and the time: $N_0$ and $t_0$, with the substitutions:
$$
N = N_0 x \quad t = t_0\tau
$$
Where $\tau$ is the scaled time, and $x$ is the scaled populations

With chain rule we have: 
$$
\frac{dN}{dt} = \frac{dN}{d\tau}\frac{d\tau}{dt} = \frac{dN}{dx}\frac{dx}{d\tau}\frac{d\tau}{dt}
$$

Substitution can be made and we have: 
$$
\frac{dN}{dt} = \frac{N_0}{t_0}\frac{dx}{d\tau}
$$

Now, we have the LHS ready, we are going to make the RHS and then start eliminating the parameters for the system, this means that: 
$$
\begin{align}
	\frac{N_0}{t_0}\frac{dx}{d\tau} &= R N_{0} x\left(1-\frac{N_{0} x}{K}\right)-\frac{B N_{0}^{2} x^{2}}{A^{2}+N_{0}^{2} x^{2}}
	\\
	\frac{d x}{d \tau}&=R t_{0} x\left(1-\frac{N_{0} x}{K}\right)-\frac{B t_{0} x^{2}}{N_{0}\left(A^{2} / N_{0}^{2}+x^{2}\right)}
	\\
	\frac{d x}{d \tau} &\underset{(1)}{=} 
	R t_{0} x\left(1-\frac{N_{0} x}{K}\right)-
	\frac{B t_{0} x^{2}}{N_{0}\left(1+x^{2}\right)}
	\\
	\frac{d x}{d \tau} &\underset{(2)}{=} 
	R t_{0} x\left(1-\frac{N_{0} x}{K}\right)-
	\frac{x^{2}}{\left(1+x^{2}\right)}
	\\
	\frac{dx}{d\tau} &\underset{(3)}{=}
	\alpha x\left( 
		1 - \frac{x}{k}
	\right) -
	\frac{x^{2}}{\left(1+x^{2}\right)}
\end{align}
$$

Substitution made at each step: 
1. $N_0 = A$
2. $Bt_0 = N_0$ or $t_0 = A/B$
3. $\alpha = \frac{RA}{B}$, $k = \frac{K}{A}$

---
### Graphical Analysis of Bifurcations
Notice that, $x = 0$ is a fixed point, and if we remove that and look for the remaining, we have: 

$$
\frac{dx}{d\tau} =
	\alpha \left( 
		1 - \frac{x}{k}
	\right) -
	\frac{x}{\left(1+x^{2}\right)}
$$

Setting the rate of change to zero, the fixed points are the intersection between the straight line and the curve right there, giving us: 
$$
\frac{x}{1+x^{2}}
=
\alpha \left( 
	1 - \frac{x}{k}
\right)
$$

![[insects-outbreak-bifucation.png]]
This is the code for producing this graph in MATLAB. 
```matlab
close all;
k = 10;
f1 = @(alpha, x) alpha*(1 - x/k);
f2 = @(x) x./(1 + x.^2);
xs = linspace(0, 12, 1000);
plot(xs, f2(xs)); hold on; title(strcat("Bifurcation with k := ", num2str(k)));
xs = linspace(0, k, 1000);
legends = ["f"];
for alpha = [0.0680 0.3830, 0.56]
   p = plot(xs, f1(alpha, xs));
   legends = [legends; strcat("alpha:" ,num2str(alpha))];
end
legend(legends);

```

This graph illustrated some of the important values for alpha, and $k$ is fixed on 10, notice that, line subtracts the curve will tell use the stability of the fixed points. 

And if we plot the fix point with respect to $\alpha$, we will have the following bifurcation diagram: 

![[hysterisis-bifurcations.png]]

This is call a **Hysteresis** Bifurcation. It's the loss of stability at the certain value. 

Notice that, anything initial conditions that is in between the fix point and the newly introduced fixed points will diverge away and hit the $c$ part in the graph (for $\alpha_1 < \alpha < \alpha_2$). 

Realistically speaking, this means that, there will be a bump of insect populations all of a sudden if the initial populations is over a certain threshold, and the environment is just right. 

This also means that in order to decreases it, we might need to push the populations all the way to below the second lowest fixed point so that the population drops. 