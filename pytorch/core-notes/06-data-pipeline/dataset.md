# Dataset: Defining Where Data Comes From

A **Dataset** represents the source of data used during training and evaluation.

In PyTorch, data handling is **explicit and modular**.  
You define *what* the data is.  
PyTorch decides *when* and *how* to fetch it.

---

## What is a Dataset?

A Dataset is an object that:
- Knows how many data samples exist
- Knows how to fetch a single data sample

It does **not** handle batching, shuffling, or parallelism.

Those responsibilities belong elsewhere.

---

## The Dataset Interface

A custom Dataset must implement two methods:

- `__len__()` → returns dataset size  
- `__getitem__(index)` → returns one data sample  

This design allows PyTorch to:
- Index data lazily
- Load only what is needed
- Scale to large datasets

### Important
- Data is loaded **on demand**
- Nothing is loaded all at once unless you force it

---

## What a Dataset Returns

Each call to `__getitem__` typically returns:
- Input data (features)
- Target data (labels)

These are usually returned as tensors.

### Important
- Dataset output format defines what the training loop receives
- Inconsistent returns cause downstream failures
- Be strict and predictable

---

## Lazy Loading

Datasets are **lazy** by default.

This means:
- Data is not loaded into memory upfront
- Samples are fetched only when requested
- Large datasets become manageable

### Important
- Lazy loading is critical for real-world datasets
- Memory errors usually indicate poor dataset design

---

## Dataset vs DataLoader (Clear Separation)

- **Dataset** → defines the data
- **DataLoader** → feeds the data

A Dataset:
- Knows nothing about batches
- Knows nothing about shuffling
- Knows nothing about parallel workers

### Important
- Mixing responsibilities leads to rigid designs
- Clean separation improves scalability

---

## Common Dataset Use Cases

Datasets are used to:
- Load files from disk
- Read structured data (CSV, JSON)
- Apply preprocessing
- Map raw data to tensors

### Important
- Datasets are the right place for data-specific logic
- Training logic does not belong here

---

## Common Dataset Mistakes

Typical errors:
- Loading all data into memory unnecessarily
- Performing batching inside the Dataset
- Returning inconsistent shapes or types
- Mixing preprocessing with training logic

### Important
- Dataset bugs propagate silently
- Always validate dataset outputs early

---

## How to Think About Datasets

The correct mental model:

> A Dataset is a **dictionary-like interface** to your data.

Given an index, it returns one clean, usable sample.

---

## What You Should Understand After This Section

By the end of this section, you should be able to:
- Explain what a Dataset is
- Implement a custom Dataset correctly
- Understand lazy data loading
- Separate data definition from data feeding

The next step is understanding **DataLoaders**, which turn datasets into batches.
