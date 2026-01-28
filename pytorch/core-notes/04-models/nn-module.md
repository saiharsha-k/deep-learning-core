# Models as Code: Understanding `nn.Module`

In PyTorch, a neural network model is **just a Python class**.

There is no separate model definition language.  
There is no hidden graph builder.  
There is only Python code.

This design choice is one of PyTorch’s biggest strengths.

---

## What is `nn.Module`?

`nn.Module` is the **base class** for all neural network models in PyTorch.

When you define a model, you:
- Subclass `nn.Module`
- Define layers in `__init__`
- Define computation in `forward`

Everything else is handled automatically.

---

## Basic Structure of a Model

A PyTorch model has two key parts:

1. `__init__()` – defines the structure  
2. `forward()` – defines the computation  

Conceptually:
- `__init__` answers: *What components does the model have?*
- `forward` answers: *How does data flow through them?*

### Important
- `forward()` defines **math**, not training
- No gradients are computed here explicitly
- No optimizer logic belongs here

---

## Layers as Objects

Layers such as:
- Linear
- Convolution
- Activation functions

are themselves instances of `nn.Module`.

When you assign them as attributes:

```python
self.layer = nn.Linear(...)
```

PyTorch automatically:
- Registers parameters
- Tracks them for optimization
- Includes them in `model.parameters()'


### Important
- Only attributes assigned to `self` are registered
- Temporary tensors inside `forward` are not parameters

---

## Parameters and Buffers

### Parameters
- Trainable values
- Automatically updated by optimizers
- Have `requires_grad=True`

### Buffers
- Non-trainable tensors
- Still part of the model’s state
- Used for things like running statistics

### Important
- Parameters learn
- Buffers support learning
- Both are saved with the model

---

## The `forward()` Method

`forward()` defines how input tensors are transformed into outputs.

Key points:
- Accepts tensors as input
- Returns tensors as output
- Can include any valid Python control flow

### Important
- You never call `forward()` directly
- Calling the model object triggers `forward()` internally
- This allows PyTorch to manage hooks and autograd correctly

---

## Sequential vs Custom Models

### Sequential Models
Useful for simple, linear architectures.
- Easy to read
- Limited flexibility

### Custom Models
Required for:
- Multiple inputs
- Conditional logic
- Complex architectures

### Important
- `nn.Sequential` is a convenience, not a replacement
- Serious models almost always subclass `nn.Module`

---

## Model Introspection

PyTorch allows you to inspect models easily:
- Parameters
- Layer structure
- State

This transparency is intentional.

### Important
- You can see exactly what your model contains
- There is no hidden state or opaque behavior

---

## Common Mistakes with `nn.Module`

Typical errors:
- Defining layers inside `forward`
- Forgetting to call `super().__init__()`
- Mixing training logic into the model

### Important
- Models should be pure computation
- Training logic belongs outside the model

---

## How to Think About Models in PyTorch

The correct mental model:

> A PyTorch model is a callable object that transforms tensors.

Nothing more. Nothing less.

---

## What You Should Understand After This Section

By the end of this section, you should be able to:
- Explain what `nn.Module` is
- Define a custom model cleanly
- Understand how parameters are registered
- Separate model logic from training logic

The next step is understanding layers and parameters in more detail.
