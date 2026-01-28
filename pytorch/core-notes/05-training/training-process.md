# The Training Process: How Models Learn

Training is the process of **adjusting model parameters** so that predictions improve over time.

In PyTorch, training is **explicit**. Nothing is hidden.  
This is intentional and essential for understanding.

---

## What Does “Training” Mean?

Training a model means:
- Making a prediction
- Measuring how wrong it is
- Computing gradients
- Updating parameters
- Repeating this process

This cycle is called **optimization**.

---

## The Core Training Components

Training always involves four components:

1. **Model** – produces predictions  
2. **Loss Function** – measures error  
3. **Optimizer** – updates parameters  
4. **Data** – provides learning signal  

If any one of these is wrong, training fails.

---

## High-Level Training Flow

The training process follows a strict sequence:

1. Input data is passed through the model (forward pass)
2. Loss is computed from predictions and targets
3. Gradients are computed via backpropagation
4. Optimizer updates model parameters
5. Gradients are cleared
6. Process repeats for many iterations

This loop is the **heart of deep learning**.

---

## Forward Pass

The forward pass:
- Moves data through layers
- Produces predictions
- Builds the computation graph

### Important
- No learning happens here
- Forward pass only computes values

---

## Backward Pass

The backward pass:
- Starts from the loss
- Computes gradients using the chain rule
- Stores gradients in parameters

### Important
- Gradients tell parameters *how to change*
- No optimizer update happens yet

---

## Parameter Update

The optimizer:
- Reads gradients
- Updates parameters according to an algorithm
- Controls learning speed via learning rate

### Important
- Optimizers only update parameters
- If something does not have gradients, it will not change

---

## Iterative Nature of Training

Training is **iterative**, not instant.

- One pass is not enough
- Learning emerges over many updates
- Noise and instability are normal early on

### Important
- Training dynamics matter more than single outputs
- Patience and monitoring are required

---

## How to Think About Training

The correct mental model:

> Training is a controlled feedback loop.

Predictions → Error → Gradients → Updates → Better predictions

Break any link, and learning stops.

---

## What You Should Understand After This Section

By the end of this section, you should be able to:
- Explain what training actually means
- Describe the full training cycle
- Understand where loss functions fit in
- See why PyTorch exposes the training loop

The next step is understanding **loss functions**, which convert errors into learning signals.
