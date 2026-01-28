# Tensor Operations: How Data Actually Moves

Tensor operations define how data flows through a model.  
Every layer, every loss, every gradient is built on these operations.

Understanding tensor operations is understanding **how computation happens**.

---

## Element-wise Operations

Element-wise operations apply **independently** to each element.

Examples:
- Addition
- Subtraction
- Multiplication
- Division

These operations require tensors to:
- Have the same shape, or
- Be broadcastable

### Important
- Element-wise operations do **not** perform matrix math
- Confusing element-wise ops with matrix ops is a classic beginner mistake

---

## Matrix Multiplication

Matrix multiplication follows linear algebra rules.

Common operations:
- Vector × Matrix
- Matrix × Matrix
- Batch matrix multiplication

PyTorch provides explicit APIs for this.

### Important
- Matrix multiplication is **not** element-wise multiplication
- Shape alignment matters
- One wrong dimension and the operation fails immediately (good)

---

## Broadcasting

Broadcasting allows PyTorch to perform operations on tensors of different shapes by **implicitly expanding dimensions**.

Example scenarios:
- Adding a vector to each row of a matrix
- Applying bias terms

Broadcasting follows strict rules:
- Dimensions must be equal or
- One of them must be 1

### Important
- Broadcasting is powerful but dangerous
- It can silently produce incorrect results
- Always verify resulting shapes

---

## Reshaping Tensors

Reshaping changes how data is viewed **without changing the data itself**.

Common operations:
- `view()`
- `reshape()`

Typical use cases:
- Flattening tensors before linear layers
- Changing batch structure

### Important
- Total number of elements must remain the same
- `view()` requires contiguous memory
- Shape mistakes here propagate everywhere

---

## Transposing and Permuting

These operations reorder dimensions.

Use cases:
- Switching between channel-first and channel-last formats
- Preparing data for specific layers

### Important
- Transpose changes how data is interpreted, not stored
- Incorrect dimension ordering breaks models silently
- Always document expected tensor layouts

---

## Reduction Operations

Reduction operations collapse dimensions.

Examples:
- Sum
- Mean
- Max

Used heavily in:
- Loss functions
- Metrics

### Important
- Reductions change tensor rank
- Losing dimensions accidentally can break downstream code
- Always know what shape comes out

---

## In-place vs Out-of-place Operations

In-place operations modify the tensor directly.

Out-of-place operations create new tensors.

### Important
- In-place ops can interfere with autograd
- They can corrupt the computation graph
- Avoid them unless memory constraints force your hand

---

## Debugging Tensor Operations

Professional habits:
- Print tensor shapes
- Check intermediate outputs
- Verify assumptions early

### Important
- Shape debugging is not a beginner skill, it’s a survival skill
- Most deep learning bugs are **not** mathematical, they’re structural

---

## How to Think About Tensor Operations

The correct mental model:

> Tensor operations define **data flow**, not just computation.

If data flows incorrectly:
- Gradients are meaningless
- Training becomes unstable
- Models appear to “not learn”

---

## What You Should Understand After This Section

By the end of this section, you should be able to:
- Distinguish element-wise and matrix operations
- Reason about broadcasting safely
- Reshape tensors confidently
- Debug shape-related issues

The next step is understanding **automatic differentiation (autograd)**.
