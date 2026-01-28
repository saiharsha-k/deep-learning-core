# PyTorch Core Notes  
**Summary & Learning Map**

These notes provide a **concept-first, system-level introduction to PyTorch**.  
They are designed to teach *how PyTorch works*, not just how to write code that runs.

If you complete this entire sequence, you understand PyTorch at a level where:
- You can write models from scratch
- You can debug training failures
- You are not dependent on high-level abstractions

---

## Learning Philosophy

These notes follow three principles:

- **Explicit over implicit**  
  You see every step of training. Nothing is hidden.

- **Concepts before APIs**  
  Understanding comes before memorization.

- **Systems thinking**  
  PyTorch is treated as a pipeline, not a bag of functions.

---

## Learning Map (Concept Flow)

The material is structured to follow the actual lifecycle of deep learning in PyTorch.

### 1. Introduction
- What PyTorch is
- Why dynamic computation graphs matter
- How PyTorch differs from other frameworks

### 2. Fundamentals
- Tensors as the core data structure
- Tensor operations and shape reasoning
- Devices and data types

### 3. Autograd
- Automatic differentiation
- Computation graphs
- Gradient flow and accumulation

### 4. Models
- `nn.Module`
- Layers and parameters
- What actually learns in a model

### 5. Training
- The training process
- Loss functions
- Optimizers
- The full training loop

### 6. Data Pipeline
- Dataset abstraction
- DataLoader batching and iteration

### 7. Evaluation and Inference
- Training vs evaluation mode
- Disabling gradients
- Correct inference practices

### 8. Serialization
- Saving and loading models
- `state_dict`
- Reproducibility and persistence

---

## What You Can Do After Completing This

After finishing these notes, you should be able to:

- Build PyTorch models from first principles
- Write correct training and evaluation loops
- Debug shape, gradient, and data issues
- Save, load, and reuse trained models safely
- Read and understand real-world PyTorch codebases

These skills transfer directly to:
- Research code
- Production systems
- Higher-level frameworks built on PyTorch

---

## What Is Intentionally Not Covered

These notes do **not** focus on:
- High-level trainers or automation frameworks
- Framework-specific shortcuts
- Task-specific architectures

Those belong **after** fundamentals.

---

## Offline Access

PDF versions of these notes are provided for offline use.  
The Markdown files remain the **source of truth**.

---

## Where to Go Next

Recommended next steps:
- Vision, NLP, or multimodal PyTorch projects
- Distributed and mixed-precision training
- Model optimization and deployment
- Higher-level abstractions (used intentionally)

---

## Final Note

If PyTorch feels simple after this, that is not because it *is* simple.

It is because you understand it.

---
Authored by: Sai Harsha Kondaveeti | [LinkedIn](https://www.linkedin.com/in/saiharshakondaveeti)