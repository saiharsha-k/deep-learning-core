# The Training Loop: Where Everything Comes Together

The training loop is where **models actually learn**.

PyTorch does not hide this loop.  
You write it yourself.  
This is a feature, not a limitation.

If you understand the training loop, you understand PyTorch.

---

## What is a Training Loop?

A training loop is the repeated process of:
- Making predictions
- Measuring error
- Computing gradients
- Updating parameters

This loop runs:
- Over batches
- Over epochs
- Until learning stabilizes or stops

---

## The Canonical Training Steps

Every correct training loop follows this exact order:

1. Zero existing gradients
2. Forward pass through the model
3. Compute the loss
4. Backward pass (compute gradients)
5. Optimizer step (update parameters)

### Important
- The order is not optional
- Changing the order breaks training
- PyTorch will not warn you if you get it wrong

---

## Zeroing Gradients

Before each iteration:
- Existing gradients must be cleared

### Important
- Gradients accumulate by default
- Forgetting this causes exploding updates
- This is an intentional PyTorch design choice

---

## Forward Pass

During the forward pass:
- Data flows through the model
- Predictions are produced
- The computation graph is built

### Important
- No parameters are updated here
- Forward pass only computes values

---

## Loss Computation

The loss:
- Compares predictions with targets
- Produces a scalar value
- Anchors the backward pass

### Important
- Loss must be computed every iteration
- Stale loss = stale gradients

---

## Backward Pass

The backward pass:
- Starts from the loss
- Computes gradients using the chain rule
- Stores gradients in parameters

### Important
- Backward consumes the computation graph
- A new forward pass builds a new graph

---

## Optimizer Step

The optimizer step:
- Reads gradients
- Updates parameters
- Applies the learning rule

### Important
- No gradients = no update
- Optimizer step does not compute gradients

---

## Iterations and Epochs

- **Iteration**: one batch update
- **Epoch**: one full pass over the dataset

### Important
- Learning happens at the iteration level
- Epochs are a bookkeeping concept

---

## Training vs Evaluation Mode

Models behave differently during training and evaluation.

### Important
- Training mode enables learning behavior
- Evaluation mode disables it
- Forgetting to switch modes causes incorrect results

---

## Common Training Loop Mistakes

Typical errors:
- Wrong operation order
- Forgetting gradient reset
- Updating in evaluation mode
- Ignoring batch size effects

### Important
- Most “model not learning” issues live here
- Debug the loop before debugging the model

---

## How to Think About the Training Loop

The correct mental model:

> The training loop is a **controlled gradient feedback system**.

Break the loop, and learning stops.

---

## What You Should Understand After This Section

By the end of this section, you should be able to:
- Write a training loop from scratch
- Explain each step’s purpose
- Debug common training failures
- Understand why PyTorch exposes this logic

The next step is understanding **data pipelines**, which feed data into this loop.
