---
layout: tutorial
title: "APS: An MLIR-Based Hardware-Software Co-design Framework for Agile Processor Specialization"
conference: ASP-DAC 2026
date: 2026-01-19
location: Tokyo, Japan
conference_url: https://www.aspdac.com/aspdac2026/program/program-abstract.html#T5
permalink: /tutorials/aspdac-2026/
description: A 3-hour tutorial on the APS framework for agile processor specialization

schedule:
  - time: "1.5 hours"
    title: "Background Session"
    description: "The methodology of APS including description and synthesis fundamentals."
    speaker: "Prof. Yun (Eric) Liang"
  - time: "1.5 hours"
    title: "Hands-on Session"
    description: "Demonstration of open-source tools including Cement, Khronos, Hestia, and the full APS."
    speaker: "Youwei Xiao, Yuyang Zou"

speakers:
  - ericlyun
  - youwei
  - yuyang
---

## Abstract

The rapid evolution of domain-specific applications demands specialized processors for competitive performance and efficiency. While the open RISC-V instruction set architecture (ISA) simplifies the addition of custom instruction extensions (ISAXs), the overall process of processor specialization remains a significant undertaking. It involves a complex interplay of tasks, including behavioral architecture description, hardware synthesis and implementation, processor-ISAX adaptation, and compiler co-generation.

Existing RISC-V ecosystems often address these challenges with narrowly scoped tools, lacking a fully automated and integrated solution. This tutorial introduces **APS** for MLIR-based agile processor specialization. APS provides a unified framework of powerful, open-source EDA tools for seamless hardware-software co-design, empowering designers to navigate the complexities of specialization with greater ease and efficiency.

## What You Will Learn

This tutorial will highlight the methodology and open-source tools within the APS framework, demonstrating a complete software-hardware co-design flow:

- **High-level ISAX Description**: Describe ISAXs' behavior at a high, near-software level
- **MLIR-based HLS**: Synthesize efficient hardware architecture through an MLIR-based high-level synthesis flow with powerful debugging features
- **Transactional Hardware Generation**: Translate synthesis results to low-level implementation via MLIR transformations
- **Processor-ISAX Adaptation**: Model the interaction between base processor and ISAX units through a unified ADL interface
- **Compiler Infrastructure**: Automated and efficient utilization of custom ISAXs with compiler feedback

## Tools Covered

The hands-on session will provide detailed demos of individual components:

| Tool | Description | Reference |
|------|-------------|-----------|
| **Hestia** | High-level synthesis tool | ICCAD'22, MICRO'25 |
| **Cement** | Transactional hardware design tool | FPGA'24 |
| **Khronos** | Simulation tool | MICRO'23 |
| **APS** | Full MLIR integration | ICCAD'25 |

## Setup Instructions

To prepare for the hands-on session, please complete the following setup before attending:

### Prerequisites

- Linux environment (Ubuntu 20.04+ recommended)
- Docker installed (optional but recommended)
- Git

### Option 1: Docker Setup (Recommended)

```bash
# Pull the pre-built APS Docker image
docker pull pkuliang/aps:aspdac2026

# Run the container
docker run -it pkuliang/aps:aspdac2026
```

### Option 2: Manual Installation

```bash
# Clone the APS repository
git clone https://github.com/pku-liang/aps.git
cd aps

# Follow the README for detailed setup instructions
# See: https://github.com/pku-liang/aps#installation
```

### Verification

After setup, verify your installation:

```bash
# Run the basic test suite
cd aps
make test
```

## Target Audience

This tutorial is formulated to be broadly interesting and useful to:

- Students and researchers in computer architecture and EDA
- Faculty members interested in domain-specific hardware
- Practicing engineers in EDA and domain-specific hardware development communities
