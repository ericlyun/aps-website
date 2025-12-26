---
layout: home
title: APS - Agile Processor Specialization
description: Open-Source Hardware-Software Co-Design Framework for RISC-V ISAXs
background: /assets/theme/images/chuttersnap-146799-unsplash.jpg
permalink: /
---

## What is APS?

**APS (Agile Processor Specialization)** is an open-source framework for agile hardware-software co-design of domain-specific processors. It provides both hardware synthesis and compiler infrastructure to facilitate the development of instruction extensions (ISAXs) for application acceleration on RISC-V platforms.

### Key Features

- **Unified Interface (APS-Itfc)**: A unified ISAX-processor interface for cross-platform portability across different RISC-V SoC ecosystems (Chipyard, PULP)
- **Cross-Level Architecture Description Language (CADL)**: High-level ISAX description language for comprehensive instruction behavior specification
- **Hardware Synthesis (APS-Synth)**: Automatic synthesis from CADL to dynamic pipeline architecture in RTL
- **Compiler Infrastructure (APSC)**: Automated ISAX utilization in general programs through pattern matching and bitwidth-aware vectorization

### Why APS?

The RISC-V open instruction ecosystem facilitates the widespread adoption of domain-specific acceleration. However, current open-source RISC-V ecosystems impose constraints on agile processor specialization. APS addresses these challenges by providing:

1. **Interface Unification**: Seamless portability across different RISC-V platforms (RoCC, CV-X-IF)
2. **High-Level Synthesis**: ISAX-specific synthesis support with dynamic pipeline generation
3. **Automated Compilation**: Pattern matching and bitwidth-aware vectorization for efficient ISAX adoption

### Results

APS demonstrates significant acceleration across diverse application domains:

- **Post-Quantum Cryptography**: 3.34× - 14.99× speedup (NTT, Polynomial Multiplication)
- **Quantized Large Language Models**: 2.03× - 2.29× speedup (BitNet b1.58)
- **Digital Signal Processing**: 2.21× - 6.03× speedup (DPLL, IIR filters)

Each case study requires fewer than 175 lines of CADL description, demonstrating APS's practical productivity and acceleration capability.

### Get Started

```bash
# Clone the repository
git clone https://github.com/pku-liang/aps.git
cd aps

# Follow the documentation for setup and usage
```

Visit our [GitHub repository](https://github.com/pku-liang/aps) for more information, documentation, and examples.
