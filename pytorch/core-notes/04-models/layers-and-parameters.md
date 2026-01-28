# Layers and Parameters: What Actually Learns

In PyTorch, **layers are objects** and **parameters are data**.  
Understanding the difference is critical to understanding how models learn.

If this section is clear, optimizers and training loops become obvious.

---

## What is a Layer?

A layer is a reusable computation unit.

Examples:
- Linear layers
- Convolution layers
- Activation functions
- Normalization layers

In PyTorch, **layers are instances of `nn.Module`**.

### Important
- Layers define *how* data is transformed
- Layers may or may not have parameters
- Not all layers learn

---

## Parameters

Parameters are **trainable tensors**.

They represent:
- Weights
- Biases
- Any value updated by gradient descent

Characteristics:
- Stored as `nn.Parameter`
- Have `requires_grad=True`
- Updated by optimizers

### Important
- Only parameters are optimized
- If something is not a parameter, it will not learn
- Parameters are discovered automatically by the optimizer

---

## How Parameters Are Registered

Parameters are registered when:
- They are assigned to `self` inside `__init__`
- They are instances of `nn.Parameter` or inside a layer

Example conceptually:
- `self.weight = nn.Parameter(...)` → registered
- Local variables → ignored

### Important
- Registration is based on object ownership
- Scope matters more than names

---

## Layers With and Without Parameters

### Layers With Parameters
Examples:
- Linear
- Convolution
- Embedding

These layers:
- Contain trainable tensors
- Change during training

### Layers Without Parameters
Examples:
- ReLU
- Sigmoid
- Dropout

These layers:
- Perform fixed operations
- Do not learn values

### Important
- Not all layers contribute parameters
- All layers contribute computation

---

## Sharing Parameters

The same layer instance can be reused multiple times.

This results in:
- Shared parameters
- Coupled learning behavior

### Important
- Parameter sharing is intentional and powerful
- Used in recurrent and tied-weight architectures

---

## Inspecting Parameters

PyTorch allows inspection of:
- Parameter names
- Shapes
- Gradient status

This transparency is deliberate.

### Important
- You should always know what is being trained
- Silent parameters are a red flag

---

## Freezing Parameters

Parameters can be frozen by disabling gradients.

Use cases:
- Transfer learning
- Fine-tuning
- Feature extraction

### Important
- Frozen parameters still participate in forward passes
- They simply stop learning

---

## Common Mistakes with Layers and Parameters

Typical errors:
- Creating layers inside `forward`
- Expecting activations to learn
- Forgetting that optimizers only see parameters
- Accidentally freezing everything

### Important
- Learning happens only where gradients flow
- Structure mistakes lead to silent failures

---

## How to Think About Layers and Parameters

The correct mental model:

> Layers define computation.  
> Parameters define what can change.

If parameters are wrong:
- Learning fails
- Optimization is meaningless

---

## What You Should Understand After This Section

By the end of this section, you should be able to:
- Distinguish layers from parameters
- Know what actually learns in a model
- Inspect and reason about model parameters
- Avoid silent training bugs

The next step is understanding **loss functions**, which turn predictions into learning signals.
