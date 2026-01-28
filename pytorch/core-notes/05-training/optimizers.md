# Optimizers: Turning Gradients into Learning

Optimizers are responsible for **updating model parameters** using gradients computed during backpropagation.

Without optimizers:
- Gradients exist but do nothing
- Parameters never change
- Training does not occur

Optimizers define *how* learning happens.

---

## What is an Optimizer?

An optimizer is an algorithm that:
- Reads gradients from parameters
- Updates parameter values
- Controls learning speed and stability

Optimizers operate **only on parameters**, never on tensors or outputs.

---

## The Optimizer Workflow

Every optimizer step follows the same logical sequence:

1. Gradients are computed via backpropagation
2. Optimizer reads gradients from parameters
3. Parameters are updated
4. Gradients are cleared

### Important
- Optimizers do not compute gradients
- They only consume gradients
- If gradients are wrong, updates are wrong

---

## Learning Rate

The learning rate controls **how large each update step is**.

### Important
- Too large → training becomes unstable
- Too small → training becomes slow or stuck
- Learning rate matters more than optimizer choice

---

## Common Optimizers

### Stochastic Gradient Descent (SGD)

SGD updates parameters using the raw gradient.

Characteristics:
- Simple
- Predictable
- Requires careful learning rate tuning

Often used with momentum to improve convergence.

---

### Adam Optimizer

Adam adapts learning rates per parameter.

Characteristics:
- Faster convergence in many cases
- Less sensitive to learning rate choice
- Common default in modern deep learning

### Important
- Adam is convenient, not magical
- Poor data or loss choices still fail

---

## Gradient Clearing (`zero_grad`)

Gradients in PyTorch **accumulate by default**.

Before each update:
- Gradients must be reset

### Important
- Forgetting to clear gradients is a common bug
- Accumulated gradients change training behavior
- Clearing gradients is an explicit step by design

---

## Optimizers and Parameters

Optimizers are initialized with:
- Model parameters
- Hyperparameters (learning rate, momentum, etc.)

### Important
- Optimizers only update parameters they are given
- Frozen parameters will not change
- New parameters require optimizer re-initialization

---

## When Optimizers Run

Optimizers run:
- After the backward pass
- Once per batch or accumulation step

### Important
- Calling optimizer step without gradients does nothing
- Calling backward without optimizer step computes gradients only

---

## Common Optimizer Mistakes

Typical errors:
- Forgetting `zero_grad`
- Updating before backpropagation
- Expecting optimizers to fix poor losses or data
- Reusing optimizers incorrectly after model changes

### Important
- Optimizers do not make models smart
- They only apply math consistently

---

## How to Think About Optimizers

The correct mental model:

> Optimizers are **parameter update rules**, not learning logic.

They do not decide *what* to learn.  
They only decide *how* to update.

---

## What You Should Understand After This Section

By the end of this section, you should be able to:
- Explain what optimizers do
- Understand the role of learning rate
- Distinguish between SGD and Adam
- Debug common optimizer-related issues

The next step is understanding **the full training loop**, where everything comes together.
