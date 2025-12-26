---
title: Retargetable Compiler
tag: compiler
order: 4
summary: Compiler infrastructure that automatically utilizes custom ISAXs for optimized code generation.
---

We develop compiler infrastructure that automatically utilizes custom ISAXs:

### Pattern Matching Engine

Hybrid semantic-based and profile-guided ISAX matching. Our pattern matching engine identifies opportunities to use custom instructions in application code.

### Bitwidth-Aware Vectorization

Optimizing register utilization for low-bitwidth operations. This technique maximizes throughput for applications with sub-word data types.

### Automated Code Generation

From CADL to compiler intrinsics and pattern matchers. Our tools automatically generate the compiler support needed to utilize custom ISAXs.
