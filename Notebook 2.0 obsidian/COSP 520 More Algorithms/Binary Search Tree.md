### **Intro**

A tree where each node has less than 2 children. It asserts the invariants: 
1. For every node, the maximum element in the left subtree is less than or equal to the node, the minimum element on the right subtree is greater than or equal to the current node. 
Here we let $n$ denotes the number of elements that are current in the binary tree. 


---
### **Query, Insertion**

The query and the insertion operations have the same complexity for the binary search tree. 

The worst case is $\mathcal O(n)$, and the best case arises when the tree is balanced with a depth of $\lceil \log(n)\rceil$, resulting in $\mathcal O(\log(n))$ look up time. 





