[[Binary Search Tree]]

A rotation for the AVL tree can be found [here](https://iq.opengenus.org/avl_tree/). 

---
### **Intro**

An AVL tree is a tree that will try to balance itself through rotation when adding and deleting elements from the tree. It satisfies all the properties of a Binary search tree, additionally, it satisfies the property that: 

> The height of 2 subtrees of the same parent node cannot have a height that differs more than 1. The height of the tree start counting at zero from the root node to the lowest leaf node it could reach. 

**Tree Height**

> Start counting at the root node and let it has the height of 0, and goes to the deepest leafnode reachable, the length of that path is the height of the tree associated with the subtree of the given node. 

Recursively, one can compute the balance factor for any node `n` using `max(n.r.h, n.l.h) + 1`  where `n.r, n.l` points to the roof of its left and right subtrees, `n.h` denotes that height of subtree for node `n`, null trees has a height of `-1` and that is by definition. 



**Balance Factor**
> root.bf = height(root.right) − height(root.left) if not leaf else 0

A positive height factor implies that the tree is right heavy, and a negative value implies that the tree is left heavy. The balance factor tells us the structure of the subtree and determines the type of rotations to perform when the height of the tree is different on the left and the right. 


---
### **Rotations**

The rotations needs to happen when the balance property of the AVL tree has been violated, and that happens only once on a AVL tree for each insertion, and it happens on a subtree of the unbalanced AVL tree. Such rotation is simply described by the following graphs: 

![[Pasted image 20221005172033.png]]

![[Pasted image 20221005172120.png]]

and using the symmetric property, there are 2 other type of rotations that are the exact mirror images of the above 2 cases. 

When adding an element to the leaf, while we recur backwards, we need to update the height of the tree accordingly. When we meet a node whose height difference are exactly 2 (If it's more than 2 then we can throw an error right there), then we consider rotations. Let the current node be `n`, we need to first rotate the subsub tree by checking `n.l` or `n.r` for whose level diff is exactly `1`. And such rotation is described in the second graph. 

**Subsub Tree Rotations**

A subsub tree performs a left, or a right rotation, the rotation is performed in such a way that the sign of the height diff on the subsub tree is the same as its parent, let `ssb` to be the root of the subsub tree, then a left rotation does the following: 

```julia
function ssbLeftRotate(ssb)
	newroot = ssb.right
	ssb.right = ssb.right.left
	newroot.left = ssb
	return newroot
end

function ssbRightRotate(ssb)
	newroot = ssb.left
	ssb.left = ssb.left.right
	newroot.right = ssb
	return newroot
end
```

The subtree rotation again, rebalance things by swaying the "heavy side" to the other side. This rotation is mandatory to resolve height differences between the subtree, and during this process, one would need to update the tree height accordingly, because the height of the tree decreases by one during this rotation process.


---
### **Deletions**

In the case when element is deleted from the tree, the same rotation routine will be triggered for the deletion of the element. 