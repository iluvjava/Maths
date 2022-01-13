[[Steady State BVP Error Analysis]]

---
### Intro
We continue discussing the error analysis, but this time for the infinity norm. 


---
### **The Error under the Infinity Norm**

Take notice that a lose bound can be established by considering: 

$$
\Vert \vec{e}\Vert_{L2} = \sqrt{h}\left(
        \sum_{j}^{}e_j^2
    \right)^{1/2} \ge \sqrt{h} \Vert e\Vert_{\infty}
    \implies
    \Vert \vec{e}\Vert_{\infty} \le 
    \frac{\Vert \vec{e}\Vert_{L2}}{\sqrt{h}} \in 
    \mathcal{O}(h^{3/2})
$$

Therefore it's definitely converging, but the bound here can be made better to $\mathcal{O}(h^2)$. 


