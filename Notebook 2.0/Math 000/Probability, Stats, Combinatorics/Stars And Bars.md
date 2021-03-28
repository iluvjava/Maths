 Here we introduce the basics of combinatorics. 

---
### **Intro**

Consider statements: 

> Given $n$ distinguishable objects, we want to put them into $k$ bins. How many are ways are there to put it? 

> I have $k$ integers and I want to add them up to $n$, how many ways are there to add to that? 

They are exactly the same thing. 

---
### **Stars and Bars Statement**

Define $n$ and $k$ as the same quantities in the statement of the problem above. 

Let's consider putting 5 objects into 5 bins, here are some examples: 

$$
|*|**|*|*||
$$

There is one element in the first bin, 2 in the second, one in the third, and one in the 4th. 

Here is another example: 

$$
|*|*|*|*|*|
$$

Ok, I can also put all of them in the first bin, which is just: 

$$
|*****|||||
$$

Ok, notice that, the first bin and the last bin is always in the same position, so they can be ignored safely. 

Now, we treat the sequences as a sequence of stars: $*$ and bars $*$. There are $k - 1$ bars and $n$ stars in totally. 

And then, the number of ways to arrange the stars and the bars is equivalent to the number of ways of putting the stars in between the bars. 

**That is the same as counting the combinations of bars in between the stars, or the stars in between the bars.** So we can use the binomial coefficients to find out the number of combinations. 

Therefore the total number of combination is: 

$$
\begin{pmatrix}
    n + k - 1 \\ n
\end{pmatrix}
=
\begin{pmatrix}
    n + k - 1 \\ k - 1
\end{pmatrix}
$$