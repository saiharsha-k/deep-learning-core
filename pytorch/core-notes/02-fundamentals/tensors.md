# Tensors: The Core Data Structure in PyTorch

A **tensor** is the fundamental building block of PyTorch.  
Every model, every gradient, every operation ultimately works on tensors.

If you understand tensors well, PyTorch stops being confusing.

---

## What is a Tensor?

Conceptually, a tensor is a **generalization of arrays** to higher dimensions.

- Scalar → 0-D tensor
- Vector → 1-D tensor
- Matrix → 2-D tensor
- Images, batches → 3-D / 4-D tensors

Tensors are similar to NumPy arrays but with two critical additions:
- They can track gradients
- They can live on GPUs

---

## Creating Tensors

Common ways to create tensors:

- `torch.tensor(data)`
- `torch.zeros(shape)`
- `torch.ones(shape)`
- `torch.rand(shape)`

Tensors can be created from:
- Python lists
- NumPy arrays
- Existing tensors

### Important
- Tensor creation defines **shape**, **dtype**, and **device**
- Be explicit when teaching beginners. Defaults hide problems.

---

## Tensor Shape

The `shape` of a tensor defines its dimensions.

Examples:
- `(10,)` → vector of length 10
- `(3, 4)` → matrix
- `(32, 3, 224, 224)` → batch of images

### Important
- Shape mismatches are the **most common PyTorch error**
- Always inspect shapes during debugging
- Printing shapes is not amateur behavior. It’s professional survival.

---

## Tensor Data Types (dtype)

Common dtypes:
- `float32` (default for most ML work)
- `float64`
- `int64`

### Important
- Most neural networks expect **floating-point tensors**
- Loss functions and layers can fail silently with wrong dtypes
- Classification labels are usually `int64`

---

## Tensor Devices (CPU vs GPU)

Tensors live on a **device**:
- CPU
- GPU (CUDA)

A tensor and a model **must be on the same device** to interact.

### Important
- Device mismatches cause runtime errors
- GPU acceleration is explicit, not automatic
- PyTorch will not guess what you want

---

## Tensor vs NumPy Array

Similarities:
- Both store numerical data
- Both support vectorized operations

Differences:
- PyTorch tensors support **autograd**
- PyTorch tensors can run on **GPU**
- NumPy arrays cannot

### Important
- PyTorch tensors can convert to NumPy and back
- Once gradients matter, NumPy is no longer enough

---

## Tensor Mutability and In-place Operations

Some operations modify tensors **in-place**.

Example:
- `add_()` modifies the tensor directly

Others create new tensors.

### Important
- In-place operations can **break gradient computation**
- Avoid in-place ops unless you know exactly why you need them
- Correctness > micro-optimizations

---

## How to Think About Tensors

The correct mental model:

> A tensor is **data + metadata**

Metadata includes:
- Shape
- dtype
- device
- gradient history (if enabled)

Tensors are not “just arrays”. They are active participants in computation.

---

## What You Should Understand After This Section

By the end of this section, you should be able to:
- Explain what a tensor is
- Reason about tensor shapes
- Understand dtype and device implications
- Know why tensors are central to PyTorch

The next step is understanding **how tensors interact through operations**.
