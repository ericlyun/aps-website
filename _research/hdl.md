---
title: Novel Hardware Description Language
tag: hdl
order: 2
summary: Explore procedural and transactional hardware descriptions through Cement, Cement2, and CADL.
---

Our hardware-description research studies abstractions that express computation and timing while supporting efficient compilation to RTL. [Cement](https://dl.acm.org/doi/10.1145/3626202.3637561) (FPGA 2024) introduces cycle-deterministic procedural descriptions for FPGA hardware, and [Cement2](https://arxiv.org/abs/2511.15073) (arXiv) develops temporal hardware transactions for high-level FPGA programming. These directions connect software-style descriptions with explicit hardware execution semantics. [APS](https://ieeexplore.ieee.org/document/11240817) (ICCAD 2025) uses CADL to describe custom-instruction behavior within a hardware-software co-design framework, while [Aquas](https://dl.acm.org/doi/10.1145/3831252.3834028) (ICCAD 2026) brings this approach into an MLIR-based flow that connects instruction semantics, hardware synthesis, and software compilation. CADL and CMT2 provide complementary layers: instruction functionality at the source level and transactional hardware behavior during lowering.
