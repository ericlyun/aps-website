---
layout: default
title: Research
description: Research areas and focus of the APS project
permalink: /research/
---

# Research Areas

The APS project encompasses several key research areas in computer architecture and compiler design:

## High-Level Synthesis

We develop advanced high-level synthesis techniques that enable efficient translation from high-level behavioral descriptions to optimized hardware implementations. Our work focuses on:

- **Dynamic Pipeline Architecture**: Automated generation of pipelined datapaths from CADL specifications
- **ISAX-Specific Scheduling**: SDC-based scheduling with ISAX-specific constraints
- **Latency-Insensitive Design**: Transaction-based hardware construction for flexible timing

## Hardware Description Languages

We pioneer new approaches to hardware description through our CADL and CMT2 frameworks:

- **CADL (Cross-level Architecture Description Language)**: Unified language for ISAX specification from high-level behavior to low-level implementation
- **CMT2**: Rule-based hardware description in Rust with temporal semantics
- **Transactional Hardware**: Modular and composable hardware design methodology

## Processor Specialization

Our research enables agile development of domain-specific processors through:

- **Unified ISAX Interface (APS-Itfc)**: Cross-platform portability across RISC-V ecosystems
- **Automated Integration**: Seamless ISAX integration with Chipyard and PULP platforms
- **Dynamic Reconfiguration**: Support for multiple concurrent ISAXs

## Retargetable Compiler

We develop compiler infrastructure that automatically utilizes custom ISAXs:

- **Pattern Matching Engine**: Hybrid semantic-based and profile-guided ISAX matching
- **Bitwidth-Aware Vectorization**: Optimizing register utilization for low-bitwidth operations
- **Automated Code Generation**: From CADL to compiler intrinsics and pattern matchers

## Application Domains

Our research demonstrates practical impact across diverse domains:

- **Post-Quantum Cryptography**: NTT acceleration for CRYSTALS-KYBER
- **Machine Learning**: Quantized LLM inference (BitNet)
- **Digital Signal Processing**: IIR filters and phase-locked loops
- **3D Point Cloud Processing**: Real-time geometry processing

## Future Directions

We continue to explore new frontiers in agile processor specialization, including:

- Enhanced compiler optimizations for complex control flow
- Support for more RISC-V platforms and ISA extensions
- Integration with emerging application domains
- Automated design space exploration for ISAX optimization

For more details on specific projects and publications, please visit our [Publications]({{ '/publications/' | relative_url }}) page.
