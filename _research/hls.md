---
title: High-level Synthesis
tag: hls
order: 3
summary: Connect compiler representations, scheduling, debugging, and simulation to efficient hardware generation.
---

Our high-level synthesis research connects behavioral descriptions to efficient hardware through compiler representations, optimization, and scheduling. [HECTOR](https://ieeexplore.ieee.org/document/10068908) (ICCAD 2022) explores a multi-level intermediate representation for hardware synthesis. [SkyEgg](https://arxiv.org/abs/2511.15323) (arXiv) combines algebraic rewrites and FPGA resource mappings through equality saturation, then jointly selects equivalent forms, hardware configurations, and schedules under timing and resource constraints. [POPA](https://dl.acm.org/doi/10.1145/3626202.3637566) (FPGA 2024) addresses high and portable tensor-computation performance across spatial and vector architectures. [APS](https://ieeexplore.ieee.org/document/11240817) (ICCAD 2025) brings synthesis into an integrated processor-specialization framework, and [Aquas](https://dl.acm.org/doi/10.1145/3831252.3834028) (ICCAD 2026) develops holistic hardware-software co-optimization based on MLIR. The surrounding development flow includes [Hestia](https://ieeexplore.ieee.org/abstract/document/10764625) (MICRO 2024) for cross-level HLS debugging and [Khronos](https://dl.acm.org/doi/10.1145/3613424.3614301) (MICRO 2023) for faster RTL simulation through memory-access fusion. Together, these directions connect hardware generation with implementation choices, application requirements, and validation.
