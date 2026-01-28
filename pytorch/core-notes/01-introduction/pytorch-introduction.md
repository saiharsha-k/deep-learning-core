# What is PyTorch?

PyTorch is a **Python-first deep learning framework** used to build, train, and deploy neural networks. It is designed to feel natural to Python programmers while providing the performance and flexibility required for modern deep learning.

At its core, PyTorch combines:
- A powerful tensor computation library
- Automatic differentiation (autograd)
- Explicit, transparent training loops
- Native GPU acceleration

PyTorch is widely used in research, startups, and production systems because it prioritizes **clarity and control over abstraction**.

---

## Why PyTorch Exists

Before PyTorch, many deep learning frameworks relied on **static computation graphs**. In those systems:
- You first defined the entire computation graph
- Then compiled it
- Then executed it

This made experimentation, debugging, and teaching unnecessarily difficult.

PyTorch was created to solve this problem by using **dynamic computation graphs**.

In PyTorch:
- The graph is built **as the code runs**
- Normal Python control flow (if, loops, functions) works naturally
- Debugging feels like debugging regular Python code

---

## Dynamic Computation Graphs

A computation graph represents how data flows through operations.

In PyTorch:
- The graph is created during the **forward pass**
- Each operation on tensors is recorded
- The graph is discarded after the backward pass

This design allows:
- Flexible model architectures
- Conditional logic inside models
- Easy debugging with print statements and breakpoints

### Important
- PyTorch does **not** build graphs ahead of time
- The graph is **re-created every forward pass**
- This is why PyTorch feels intuitive and Pythonic

---

## PyTorch vs TensorFlow (Conceptual Comparison)

This is not about which framework is “better”. It is about **design philosophy**.

### PyTorch Philosophy
- Code-first
- Explicit training loops
- Python control flow
- Transparency over abstraction

### TensorFlow Philosophy (Traditional)
- Graph-first
- Higher abstraction
- More framework-managed behavior

### Important
- PyTorch makes learning **how deep learning works** easier
- TensorFlow emphasizes large-scale deployment and tooling
- Understanding PyTorch makes it easier to learn any other framework later

---

## What PyTorch Is Not

It is important to be precise.

PyTorch is **not**:
- An automatic model trainer
- A no-code or low-code tool
- A replacement for understanding math

PyTorch gives you **control**, not answers.

### Important
- PyTorch will not stop you from writing incorrect logic
- It assumes the user understands what they are doing
- This is a feature, not a flaw

---

## How to Think About PyTorch

The correct mental model is:

> PyTorch = Tensors + Gradients + Python

Everything else is built on top of this idea.

If you understand:
- How tensors store data
- How gradients flow through operations
- How Python code defines computation

Then PyTorch becomes predictable and debuggable.

---

## What You Should Understand After This Section

By the end of this section, you should be able to:
- Explain what PyTorch is in simple terms
- Describe what a dynamic computation graph means
- Understand why PyTorch is widely used for learning and research
- Know what PyTorch does *and does not* provide

The next step is to understand **tensors**, the single most important object in PyTorch.
