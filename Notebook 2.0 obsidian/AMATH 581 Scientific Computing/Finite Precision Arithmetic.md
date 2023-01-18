### **Intro**

Computer represents numbers using Floating point protocols. The standards is made by people and it's called IEEE 754. In this file, we will use type FLOAT64 as an example to illustrate how a floating point numbers are represented by a computer. Computer represents a FLOAT64 using 1 bit for sign, 10 bits for the exponent, and then 53 bit for the actual number, called the *mantissa*. 

![[Pasted image 20230117182205.png]]

For comparison, it's essentially the same as scientific notations but instead of binary, we have that in decimal. More precisely, an binary number in the computer is represented like a scientific notation: 

$$
(-1)^{s}\left(\sum_{i = 0}^{51} d_{i}10_b^{-i}\right)\times 10_b^{e}, 
$$

where the ditis $d_i\in{0, 1}$ because we are in binary. And we have $e$ denoting the exponential, and it's $-1027\le e \le 1027$, represented as signed integer. Let me make a joke: "Observe that $10$ is actually 2 in binary, and that is not a mistake, if, we are writing in binary." 

The intrinsic representation of numbers are discrete, further more, the larger the numbers are, the bigger the gap between. More precisely, the gap is given by $2^{e - 52}$. Further more, due to the limit for exponent, the number can over/under flow depending on the size of the exponent. 

**What can create more error?** 

1. **Adding for Adding**: The error is created when doing operations with numbers whose relative sizes are in different magnitudes. Allow me to illustrate it using addition in binary with 3 significant 4 for simplicity. Suppose that we have the number $a = 1.00\times 2^3$ and $b = 1.11\times 2^{-1}$, adding then together involves shifting $b$ by 4 digits, resulting in $0.00111\times2^{3}$ so that they have the same power. Adding them gives: $1.00111\times 2^3$, then, we perform chopping to fit into the memory, giving us: $1.00\times 2^3$. The absolute error is proportional to $\max(a, b)$, in this case, it's $2^{3}\times 2^{-2} = 2$.
2. **Representation Error**: Given a number in decimal form, in any programming language, it will get represented as a binary and losing significant digits because some decimal numbers are recurrent in binary. This is due to gaps between the discrete representations of floating point. 

---
### **Fixed Relative Error for Additions**

The relative error between addition of 2 floating point number is a fixed quantity, and using rounding/chopping doesn't improve the accuracy significantly. 


---
### **Good References**

- [What every computer scientists should know about floating point arithemtic](https://docs.oracle.com/cd/E19957-01/806-3568/ncg_goldberg.html). 
- [Stack overfloat: Rounding or chopping for Java IEEE](https://stackoverflow.com/questions/38245511/which-rounding-method-is-used-in-java-when-operating-on-floating-point-numbers).

