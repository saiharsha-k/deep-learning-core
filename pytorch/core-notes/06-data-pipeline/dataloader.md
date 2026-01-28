# DataLoader: Feeding Data to the Model

A **DataLoader** is responsible for delivering data from a Dataset to the training loop **efficiently and safely**.

If Dataset defines *what* the data is,  
DataLoader defines *how* the data is consumed.

---

## What is a DataLoader?

A DataLoader:
- Wraps a Dataset
- Iterates over it
- Produces batches of data

It handles:
- Batching
- Shuffling
- Parallel data loading

---

## Dataset vs DataLoader (Hard Boundary)

- **Dataset** → defines individual samples  
- **DataLoader** → controls iteration and batching  

### Important
- Dataset returns **one sample**
- DataLoader returns **many samples at once**
- Do not mix these responsibilities

---

## Batching

Batching groups multiple samples together.

Why batching matters:
- Improves computational efficiency
- Stabilizes gradient updates
- Matches how GPUs work

### Important
- Batch size affects memory usage
- Larger batches are not always better
- Batch size changes training dynamics

---

## Shuffling

Shuffling randomizes the order of samples.

Why it matters:
- Prevents learning order-specific patterns
- Improves generalization
- Reduces bias from data ordering

### Important
- Shuffling should be enabled during training
- Shuffling is usually disabled during evaluation

---

## Iteration Over Data

A DataLoader:
- Is iterable
- Yields batches one at a time
- Stops automatically at the end of the dataset

### Important
- One full pass over the DataLoader equals one epoch
- Iteration order is controlled by the DataLoader, not the Dataset

---

## Parallel Data Loading

DataLoader can load data using multiple workers.

Benefits:
- Faster data throughput
- Reduced training bottlenecks

### Important
- More workers ≠ always faster
- Incorrect worker usage can cause bugs
- Debug with a single worker first

---

## What a DataLoader Returns

Each iteration typically returns:
- A batch of input tensors
- A batch of target tensors

The exact structure depends on the Dataset output.

### Important
- Training loops must match DataLoader output format
- Mismatches cause runtime errors

---

## Common DataLoader Mistakes

Typical errors:
- Using batch size too large for memory
- Forgetting to shuffle training data
- Overusing workers without testing
- Assuming DataLoader modifies data

### Important
- DataLoader controls flow, not content
- Data correctness is still the Dataset’s job

---

## How to Think About DataLoaders

The correct mental model:

> A DataLoader is a **batch-producing iterator**.

It does not care what the data means.  
It only cares about delivering it efficiently.

---

## What You Should Understand After This Section

By the end of this section, you should be able to:
- Explain the role of a DataLoader
- Distinguish it clearly from a Dataset
- Choose appropriate batch sizes
- Debug data feeding issues

This completes the **core PyTorch data pipeline**.
