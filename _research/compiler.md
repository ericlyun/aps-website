---
title: Retargetable Compiler
tag: compiler
order: 4
summary: Compiler infrastructure to support finding and utilizing ISAXs for domain-specific acceleration.
---

We conduct research for two topics: finding instructions to accelerate and using custom instruction in applications.

## Finding Reusable Custom Instructions

We use automated techniques, including profiling, pattern identification and selection, to nominate custom instructions from the target application domain, without human intervention. Although this is an classical computer architecture topic, which has been explored for 20 years, we found new opportunities to revisit it with the help of the e-graph and MLIR in the RISC-V and AI era.

## Pattern Matching Engine

Our pattern matching engine identifies opportunities to use custom instructions in application code. We explore the e-graph data structure for identifying matching patterns with concerns of equivalence under programs.

## ML Compiler Integration

We bring supports for APS-generated acceleration solutions to our ML compiler (to appear soon!). This is a very nice marriage in the AI era: you can use APS to generate hardware and the compiler fully utilize the hardware to accelerate the AI applications.
