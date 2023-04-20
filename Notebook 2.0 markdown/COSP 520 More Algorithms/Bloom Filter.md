wiki link [here](https://en.wikipedia.org/wiki/Bloom_filter)

---
### **Intro**

The data-structure answers the question: 
1. An element is definitely had not been in the set. 
2. An element might had been in the set.

The datastructure supports the following operations: 
1. Add an element to the set. 
2. Test if the element is definitely not in the set, or it might had been in the set. 

For each element `x`, there must be `k` different hash functions. For simplicity let `k = 2`, so that `h_1, h_2` denotes 2 different hash function. Suppose that we have a bit array of size `m`, denoted using `arr` and all bits in `arr` are zeros. We use `B` to denote the datastructure itself. 

---
### **Adding an Element**

Add `x`  then: 
1. `arr[h_1(x)%m] = 1; arr[h_2(x)%m] = 1`

Test `x in B`: 
1. `arr[h_1(x)%m] && arr[h_2(x)%m]`

Both operations requires only $\mathcal O(1)$ operation time, assuming the hash function is properly implemented. 


---
### **False Positive Rate**

False positive means `x` is in `B` but it's actually not. Let `m` be the number of bits in the bit array `arr`, and let `n` denote the number of elements that had been added to `B`, then according to wikipedia (see link on the top of the file), the probability of all the bits hashed by `k` different hash function is the same is: 

$$
\varepsilon=\left(1-\left[1-\frac{1}{m}\right]^{k n}\right)^k \approx\left(1-e^{-k n / m}\right)^k, 
$$

which the approximation gets better when $m$ is huge, and we have to assume that the the hash function is equally likely to place `x` for all of the bits in `arr` for all possible `x`. 

---
### **Hash Function Implementations**

I don't know, use whatever, as long as the 2 hash function is uniformly distributed for the dataset and it's completely different. Then it should work fine. 




