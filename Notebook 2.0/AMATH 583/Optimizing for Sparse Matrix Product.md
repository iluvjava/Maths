Algorithms and method for sparse Matrix Produce computations. 
[[Dense Matrix Multiplications Optimizations]]

---
### **Intro**

We are going to work smarter instead of harder like we did for the dense matrix multiplications. 

In the world of Numerical Computations, Strassen's Algorithm is the start of it. 

I will skip it here, because I already know a great deal of it and implemented it in Julia. It's as simple as just a different way of doing Matrix multiplications using a divide and conquer approach. 

Why Sparsity is considered: 

When solving the PDEs, the discretized Operator is going to be useful here. Because they are sparse matrices. 

And solving it, it's better to use FFT, or use **iterative method that treat the matrix as a black box**. 

Then, as long as there is some way to do fast multiplications with sparse matrix, then there is a way to improve the computations. 


---
### **Matrix Matrix Product** 

Just checking whether there are zeros on the entries of the matrix is not fast, because it checks everything, and that is not fast. 

The key: **We want to avoid ther zeros, without looking at the zeros**. 

**Hint**: We need to store the matrix in a different way. 

---
### **Sparse Matrix Storage: Coordinate Storage**:

We are just going to store the non-zero elements in the matrix. 

For each non zero elements in the matrix, we store its value and x, y, boundled in a list of tuples, packed together into an array of `3 by n` array, where $n$ is the number of non zero elements. 

And to work better, we store all 3 pieces of information in 3 array. 

Suppose that `row_indices, col_indices, values` are c++ array that store these information for each of the non zero elements in the matrix. 

Then, `row_indices[i], col_indices[i], values[i]` gives the coordinates and values for the `i` th non zero indices. 

**Problem**:

We can't get a value at a particular index at a constant amount of time. 

Oops. That means, we can't index the matrix frequently. 

---
### **Sparse Matrix Multiplications**

With the sparse matrix storage. 

Consider the following implementions of the coordinate matrix and the matrix vector multiplications for the coordinate matrix. 

```cpp
#include <iostream>
class COOMatrix{
    private:
        int num_rows, num_cols;
        std::vector<size_t> row_indices_, col_indices_; 
        std::vector<double> storage_;
    public: 
        
        COOMatrix(size_t M, size_t N): num_rows_(M), num_cols_(N){}
        // Multiply matrix by a vector and out put the vector. 
        void matvec(cost Vector& x, Vector& y)
        {
            for (size_t k = 0; k < storage_.size(); ++k)
            {
                y(row_indices_[k]) += storage_[k]*x(col_indices[k])
            }

        }
        // add a new non zero element for the matrix
        void insert(size_t i, size_t j, double val)
        {
            row_indices_.push_back(i); 
            col_indices_.push_back(j); 
            storage_.push_back(val); 
        }
}
```
**Summarize**: 

For each non zero element in the row of the matrix, multiply it with the corresponding elements in the input matrix $x$ and then accumulate it to the corresponding elements in output vector y. 

---
### **Compressive the Storage**

Note, we don't have to store all the elements in order in the above case, **the order doesn't matter** for the above way of storage. if we want to set a new non-zero element in the matrix, we can just append it to the array. 

**Now, suppose I sort the elements in the arrays of the matrix**. 

That means the row indices might look like this: 

```
[1, 1, 1, 2, 2, 2, 3, 3, 4, 4]
```

Meaning that there are 32 elements on the first row of the matrix, 3 on the second row, 2 on the 3rd and the 4th. 

It can then be compressed, instead of storing the row indices, we are storing the number of elements on the row, so the indices of this array tells us the row number. 

```
[3, 3, 2, 2]
```
The array stores the number of non zeros entry for each row of the matrix. 

**This is called CSR: Compressed Sparse Row Format**.


