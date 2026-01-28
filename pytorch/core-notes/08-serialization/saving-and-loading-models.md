# Saving and Loading Models: Preserving What Was Learned

Training a model without saving it is wasted effort.  
Saving models correctly is what makes experiments reproducible and deployment possible.

PyTorch gives you **full control** here. With that control comes responsibility.

---

## What Does It Mean to Save a Model?

Saving a model means preserving:
- Learned parameters
- Model structure (indirectly)
- Training progress (optionally)

PyTorch separates **model definition** from **model state**.

This separation is intentional.

---

## `state_dict`: The Core Concept

A `state_dict` is a Python dictionary that maps:
- Parameter names → tensors
- Buffer names → tensors

It contains:
- Weights
- Biases
- Running statistics

### Important
- `state_dict` does **not** store the model class
- It stores only the model’s learned state

---

## Saving a Model (Correct Way)

The recommended approach is to save:
- The model’s `state_dict`

Why?
- Lightweight
- Version-safe
- Explicit

### Important
- Always save the state, not the entire model object
- This avoids hidden dependencies and breakage

---

## Loading a Model (Correct Way)

Loading involves two steps:
1. Recreate the model architecture
2. Load the saved `state_dict` into it

### Important
- Model architecture must match the saved state
- PyTorch will tell you if parameters do not align

---

## Why Not Save the Entire Model?

Saving the entire model object:
- Ties the file to exact code structure
- Breaks easily across environments
- Is fragile for long-term use

### Important
- Full-model saving is convenient, not robust
- Use it only for quick experiments, not production

---

## Saving Optimizers and Training State

For resuming training, you may also save:
- Optimizer state
- Epoch number
- Training metrics

### Important
- Optimizer state is required to resume training exactly
- This matters for long-running or expensive jobs

---

## CPU vs GPU When Loading

Models can be saved on one device and loaded on another.

### Important
- Device mapping must be handled explicitly
- This is common when training on GPU and deploying on CPU

---

## Common Saving and Loading Mistakes

Typical errors:
- Saving full model objects blindly
- Forgetting to save optimizer state
- Loading mismatched architectures
- Assuming device compatibility

### Important
- Most loading bugs are design mistakes, not PyTorch bugs

---

## How to Think About Model Persistence

The correct mental model:

> Model code defines *structure*.  
> `state_dict` defines *knowledge*.

Keep them separate, and your workflow stays clean.

---

## What You Should Understand After This Section

By the end of this section, you should be able to:
- Explain what `state_dict` is
- Save and load models safely
- Resume training correctly
- Avoid common persistence pitfalls

This completes the **end-to-end PyTorch fundamentals**, from data to deployment-ready models.
