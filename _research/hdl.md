---
title: Hardware Description Languages
tag: hdl
order: 2
summary: Pioneering new description abstractions to hardware/ISAX design.
---

We dive into abstraction and compilation research for hardware description and generation.

## Cement Series

What is the right abstraction to describe hardware? RTL is general and brings troubles according to its low-level, structural nature. We prefer software-style description! Cement at FPGA 2024 explored bringing software procedural description to RTL world. The subsequent version, CMT2, further explored the transactional (or rule-based, Bluespec-style) hardware description. We create DSLs in Rust and also migrate the features to MLIR ecosystem to support the APS project.

## CADL (Cross-level Architecture Description Language)

Unified language for ISAX specification from high-level behavior to low-level implementation. CADL bridges the gap between algorithmic description and hardware realization. We want it to be the single specification for ISAX functionality description, hardware specification, and compiler targets.
