Wiki: [here](https://en.wikipedia.org/wiki/Cuckoo_filter), a better coverage at [brilliant](https://brilliant.org/wiki/cuckoo-filter/). 

And the paper that discussed the method in details is [here](https://www.cs.cmu.edu/~dga/papers/cuckoo-conext2014.pdf).

---
### **Intro**

The data structure does the same thing as [[Bloom Filter]]. Cuckoo filters improve upon the design of the bloom filter by offering deletion, limited counting, and a bounded false positive probability, while still maintaining a similar space complexity.

The datastructure functions similarly to a cuckoo hashset, but instead of storing the actual element in the array, a finger print of the object is stored. Therefore we need to introduce the cuckoo hashset first. 

The cuckoo hashset is designed in such a way that the look up time will always be $O(1)$ strictly, at the expense of a very long insertion time due to collisions or hash function. We assume 2 hash function `h_1, h_2` for all the elements, and we assume 2 arrays of the same size `m`, denoted as `arr1, arr2` for the cuckoo hashset. 


---
### **Cuckoo Hashing**

Inserting an element `x`. 
* Try inserting `x` to `arr1` using `h_1`. 
	* if there already exists an element in `arr1`, say `y`, re-insert it into `arr2` using `h_2`. Recursively repeats if another collision occurs for `y`, always look into the next alternative array for empty index position. 
* Records all the position checked in `arr1, arr2`, if repetition occurred, re-hash the whole hashset. 


Checking membership of `x`: 
* if `x` is in the set iff `arr[h_1(x)%m] == x || arr[h_2(x)%m] == x`. Because for all items, it's either hashed to the first array, or it's hashed to the second, it's always that case. 

**Remarks**

It's equivalent to having `h_2, h_1`  hashes to indices 2 disjoint partition of one whole array, in that way we may simplifies the implementations. 

---
### **Cuckoo Filtering**

Instead of storing the references to the object in `arr1, arr2`, we consider storing the finger print of the element instead for the object, this is the original description in the paper: 

> A cuckoo filter is a compact variant of a cuckoo hash table \[21\] that stores only fingerprints—a bit string derived from the item using a hash function—for each item inserted, instead of key-value pairs.
> (page 1)

The size of the fingerprint will determine the false positive rate (FP) of the membership check for elements, quoted: 

> the minimum fingerprint size used in the cuckoo filter grows logarithmically with the number of entries in the table (as we explain in Section 4).(page 1)


**Remarks**

The hash functions `h_2, h_1`  is defined in the paper based on hashes of the object `x` and hashes of the existing finger print in the array. Checks the paper for more implementation details. 


---
### **Implementations Details**

Define `f` to be the finger print function, it generates hash for object `x` other entities such as a byte array. , and the hashes should be fairly short, for example, a 4 bits number for `f(x)`. We define array `arr` to be an array with size `m` (For the simple case we only have one array.), Next, we define 2 hash functions: 
1. `h_1(x)` is just an ordinary hash functions for the objects. 
2. `i_1 := h_1(x)%m`, the index hashes for the first half of  `arr`. 
3. `i_2:= i_1 ^ (h_1(f(x))%m)`, where `^` denotes the bitwise XOR operator for the byte array. 

Immediately observe the fact that, 
