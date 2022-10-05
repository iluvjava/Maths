[[Binary Search Tree]]
Major references: [here](https://iq.opengenus.org/2-3-trees/). Has code pics and explanations. 

---
### **Intro**

It's a type of tree where each node has 2, or 3 children. For all nodes with one children it has one data piece in it, for all node with 3 children it has 2 data piece in it. During some operations of the tree, the node can temporarily have 4 children and 3 pieces of data in it. 

1. One data, 2 children
2. 2 data OR 3 children
3. 3 data 4 children (Temporary state)
4. Leaf node with a single data and no children, could take 1, or 2 value. 

**Tree Invariance:** 
1. All nodes satisfies (1.) and (2.)
2. Satisfies the binary search tree conditions. 
3. For all nodes with 2 values: 
	1. Leaf node 
	2. Has exactly 3 children 
4. All leaf node must be at the same level. And this would imply a condition that is the tree is a full tree, and we may assume that empty leaf node are padded with `NULL` data value. 

---
### **Searching For an Element**

1. If any of the node that we encouter for the search is one data, then we just use the same strategy as the binary search tree. 
2. If any of the node is a 2 value tree, then the 2 value split into 3 sub tree. Left, Right, Middle, (L, R, M), and 2 values `v1, v2` so then at the insert element be `e`, we have: 
	1. `e < v1` -> L
	2. `e >= v1 && e <= v2` -> M
	3. `e > v2` -> Right


---
### **Inserting an Element**

Let the element being inserted to be `e`, the value travers straight to the leaf node using the same traversal rule for element quiry. If the leaf node has more than 2 element, then we need to preserve the 2-3 tree properties. The strategy is called "median promotions". 
> "Median Promotions", a method of resolving if the leaf node being added with the new element already has 3 data in it.  ![[median-promote.png]]
	
**Median Pomotion**
	
The above graph shows the example of inserting elements **9, 5, 8, 3, 2, 4, 7** sequentially to the 2-3 tree starting with an empty tree. The strategy is triggered by a value inserted to the leaf node that already has 2 values, adding the new value to it, create a temporary 3 node that needs to be resolved, let these 3 values be `l, m, r`, let the value `m` be the value prompted from the root of the current subtree, then we have the cases where: 
1. If the parent has 1 data value, then the `m`, which is promoted from either left or right sub tree, will have `m` less than, or equal to the root value `vr`, WLOG let it be that `l, m, r` come from the left subtree, then: 
	1.  `m` will become the `l` value of the parent, 
	2.  The `r` value become the middle child of the parent, 
	3.  The value originaly in the parent become the `r` value of the parent. 
View the current parent as the root of the new subtree and recursively apply above steps until the current node is the root node. 
2.  If perent, `p`, of the current `m` be promoted from the left, middle or right subtree `r` has 2 value, then we will split `p` into a 3-4 tree and then resolve it into a regular binary subtree. Then `p` has 3 values, sorted in order where one of the value is prompted from `r`, the root of the subtree. It has 4 children, and this allows it to be able to split into a binary tree. See the picture for more information. 






