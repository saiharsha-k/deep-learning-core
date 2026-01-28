# Loss Functions: Turning Error into a Learning Signal

A loss function converts model predictions into a **single numerical value** that represents how wrong the model is.

Without a loss function:
- There is no objective
- There are no gradients
- Learning cannot happen

Loss functions are not optional. They define *what learning means*.

---

## What is a Loss Function?

A loss function measures the difference between:
- Model predictions
- Ground-truth targets

It outputs a **scalar value** that:
- Is minimized during training
- Drives gradient computation
- Guides parameter updates

---

## Why Loss Must Be a Scalar

Gradients must flow from a **single objective**.

### Important
- Backpropagation requires a scalar starting point
- Vector or matrix losses must be reduced
- Reduction is part of loss design, not an afterthought

---

## Common Types of Loss Functions

Loss functions are chosen based on the problem type.

### Regression Losses
Used when predicting continuous values.

Examples:
- Mean Squared Error (MSE)
- Mean Absolute Error (MAE)

Characteristics:
- Penalize distance between prediction and target
- Sensitive to scale and outliers

---

### Classification Losses
Used when predicting class labels.

Examples:
- Cross Entropy Loss

Characteristics:
- Compare predicted class probabilities with true labels
- Strongly penalize confident wrong predictions

---

## Cross Entropy Loss (Critical Concept)

Cross Entropy Loss is commonly misunderstood.

### Important
- `CrossEntropyLoss` **includes Softmax internally**
- Model outputs should be **raw scores (logits)**
- Applying Softmax manually before this loss is incorrect

This design improves numerical stability.

---

## Reduction Modes

Loss functions reduce multiple errors into a single value.

Common reductions:
- `mean` (default)
- `sum`

### Important
- Reduction affects gradient magnitude
- Changing reduction can change training dynamics
- Be consistent across experiments

---

## Loss and Gradients

The loss function:
- Connects predictions to targets
- Defines how errors propagate backward
- Shapes the gradient landscape

### Important
- Different losses produce different gradients
- Same model + different loss = different learning behavior

---

## Choosing the Right Loss Function

Choosing a loss function is a **design decision**, not a syntax choice.

Consider:
- Output type
- Target format
- Sensitivity to errors
- Stability during training

### Important
- Wrong loss = model that never converges
- Loss choice matters as much as model architecture

---

## Common Mistakes with Loss Functions

Typical errors:
- Using classification loss for regression
- Applying Softmax before Cross Entropy
- Mismatched target shapes or types
- Ignoring reduction effects

### Important
- Loss bugs often look like “model not learning”
- Always validate loss behavior early

---

## How to Think About Loss Functions

The correct mental model:

> A loss function defines **what the model is trying to optimize**.

If the loss is wrong:
- Gradients are wrong
- Updates are wrong
- Learning fails silently

---

## What You Should Understand After This Section

By the end of this section, you should be able to:
- Explain what a loss function does
- Choose appropriate losses for tasks
- Understand why loss must be scalar
- Avoid common loss-related mistakes

The next step is understanding **optimizers**, which turn gradients into parameter updates.
