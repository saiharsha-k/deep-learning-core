# Evaluation and Inference: Using Models Correctly

Training a model is only half the job.  
Using it **correctly** during evaluation and inference is just as important.

Many models appear to “fail” simply because evaluation is done wrong.

---

## Training vs Evaluation

Models behave differently depending on their mode.

PyTorch provides two explicit modes:
- Training mode
- Evaluation mode

These modes control how certain layers behave.

---

## Training Mode

Training mode is enabled by default.

In this mode:
- Gradients are tracked
- Layers behave in learning mode
- Stochastic behavior is allowed

### Important
- Training mode is required for learning
- This mode should be active only during training

---

## Evaluation Mode

Evaluation mode is enabled explicitly.

In this mode:
- Model parameters are frozen
- Certain layers change behavior
- Predictions become deterministic

### Important
- Evaluation mode is mandatory for validation and testing
- Forgetting this causes incorrect metrics

---

## Layers Affected by Mode Switching

Some layers behave differently depending on the mode.

Examples:
- Dropout
- Batch Normalization

### Important
- These layers behave correctly **only** if mode is set properly
- This is a common source of silent bugs

---

## Inference

Inference is the process of:
- Passing new data through the model
- Producing predictions
- Not updating parameters

Inference usually happens:
- After training
- In production
- During deployment

---

## Disabling Gradient Computation

During evaluation and inference:
- Gradients are not needed
- Tracking them wastes memory and time

### Important
- Gradient tracking should be disabled explicitly
- This improves speed and reduces memory usage

---

## Evaluation Loop

An evaluation loop is similar to a training loop, but:
- No backward pass
- No optimizer step
- No parameter updates

### Important
- Evaluation should never modify model state
- Metrics should reflect true model performance

---

## Common Evaluation Mistakes

Typical errors:
- Forgetting to switch to evaluation mode
- Tracking gradients unnecessarily
- Mixing training and evaluation logic
- Using training metrics as final results

### Important
- Evaluation bugs invalidate results
- Always verify evaluation setup first

---

## How to Think About Evaluation and Inference

The correct mental model:

> Training teaches the model.  
> Evaluation measures the model.  
> Inference uses the model.

Confusing these roles leads to incorrect conclusions.

---

## What You Should Understand After This Section

By the end of this section, you should be able to:
- Explain the difference between training and evaluation
- Understand why mode switching matters
- Run inference safely and efficiently
- Avoid common evaluation mistakes

This completes the **PyTorch fundamentals lifecycle** from data to deployment-ready usage.
