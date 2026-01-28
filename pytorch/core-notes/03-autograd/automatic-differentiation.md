# Automatic Differentiation (Autograd)

Autograd is the mechanism that allows PyTorch to **automatically compute gradients**.

Without autograd:
- Neural networks do not learn
- Optimizers have nothing to update
- Training is impossible

Autograd is not optional. It is the engine behind learning.

---

## What is Automatic Differentiation?

Automatic differentiation is a technique to compute derivatives **exactly** using the chain rule.

PyTorch does this by:
- Tracking operations performed on tensors
- Building a computation graph dynamically
- Applying the chain rule during backpropagation

This is **not** numerical differentiation and **not** symbolic math.

---

## The Computation Graph

A computation graph is a directed graph where:
- Nodes represent operations
- Edges represent tensors flowing between operations

In PyTorch:
- The graph is built **during the forward pass**
- Only tensors with `requires_grad=True` are tracked
- The graph exists only temporarily

### Important
- PyTorch uses **dynamic computation graphs**
- The graph is rebuilt on every forward pass
- This allows conditional logic and loops inside models

---

## `requires_grad`

Gradients are tracked only for tensors that explicitly request it.

- `requires_grad=True` tells PyTorch to track operations
- Parameters inside `nn.Module` default to this

### Important
- Not all tensors need gradients
- Inputs often do not require gradients
- Model parameters almost always do

---

## Forward Pass vs Backward Pass

### Forward Pass
- Computes outputs from inputs
- Builds the computation graph
- Stores operation history

### Backward Pass
- Triggered by calling `.backward()`
- Traverses the graph in reverse
- Computes gradients using the chain rule

### Important
- Forward builds the graph
- Backward **consumes and frees** the graph
- A new forward pass builds a new graph

---

## Calling `.backward()`

The backward pass starts from a **scalar value**, usually the loss.

Why scalar?
- Gradients must propagate from a single objective

Calling `.backward()`:
- Computes gradients for all leaf tensors
- Stores gradients in `.grad`

### Important
- Only scalar tensors can call `.backward()` directly
- Gradients are accumulated, not overwritten

---

## Gradient Accumulation

By default, PyTorch **accumulates gradients**.

This means:
- Each `.backward()` adds to existing gradients
- Gradients must be cleared manually

This design supports:
- Gradient accumulation across batches
- Advanced training strategies

### Important
- Forgetting to clear gradients is a common bug
- Optimizers expect fresh gradients each step

---

## Accessing Gradients

After backpropagation:
- Gradients are stored in `tensor.grad`

Only **leaf tensors** store gradients:
- Model parameters
- User-created tensors with `requires_grad=True`

### Important
- Intermediate tensors do not retain gradients by default
- This saves memory and improves performance

---

## Disabling Gradient Tracking

Not all computation requires gradients.

PyTorch provides mechanisms to disable tracking:
- During evaluation
- During inference
- During parameter-free computation

### Important
- Disabling gradients improves speed and memory usage
- Forgetting to disable gradients during inference is wasteful

---

## Detaching Tensors

Sometimes you want to stop gradient flow.

Detaching:
- Creates a new tensor
- Shares the same data
- Removes gradient history

### Important
- Detaching breaks the computation graph intentionally
- This is often used in advanced training loops

---

## Common Autograd Mistakes

Typical errors include:
- Using in-place operations on tracked tensors
- Forgetting to clear gradients
- Expecting gradients where none exist
- Mixing NumPy and PyTorch incorrectly

### Important
- Autograd is deterministic, not magical
- Most issues come from incorrect assumptions

---

## How to Think About Autograd

The correct mental model:

> Autograd records **operations**, not equations.

If an operation happens:
- It is tracked (if gradients are enabled)
- It becomes part of the graph

If it does not happen:
- No gradient exists
- No learning occurs

---

## What You Should Understand After This Section

By the end of this section, you should be able to:
- Explain how PyTorch computes gradients
- Describe what a computation graph is
- Understand why gradients accumulate
- Debug basic autograd-related issues

The next step is understanding **how models are structured using `nn.Module`**.
