---
layout: tutorial
title: "APS: An MLIR-Based Hardware-Software Co-design Framework for Agile Processor Specialization"
conference: ASP-DAC 2026
date: 2026-01-19
location: Hong Kong, China
conference_url: https://www.aspdac.com/aspdac2026/program/program-abstract.html#T5
permalink: /tutorials/aspdac-2026/
description: A 3-hour tutorial on the APS framework for agile processor specialization

schedule:
  - time: "30 minutes"
    title: "Background Session"
    description: "Background and motivation leading to our innovations towards agile processor specialization."
    speaker: "Prof. Yun (Eric) Liang"
  - time: "2.5 hours"
    title: "Hands-on Session"
    description: "Demonstration of the full APS open-source ecosystem."
    speaker: "Youwei Xiao, Yitian Sun, Chenyun Yin, and Yuyang Zou"
    handout: /assets/tutorials/aspdac-2026/hands-on.pptx

speakers:
  - ericlyun
  - youwei
  - yuyang
  - chenyun
  - yitian
---

## Abstract

The rapid evolution of domain-specific applications demands specialized processors with competitive performance and efficiency. While the open RISC-V instruction set architecture (ISA) simplifies the adoption of custom instruction extensions (ISAXs), the overall process of processor specialization remains challenging. It involves a complex interplay of multiple tasks, including behavioral architecture description, hardware synthesis and implementation, processor-ISAX adaptation, and compiler co-generation. Existing RISC-V ecosystems often address these challenges manually, lacking a fully automated and integrated solution. This tutorial introduces **APS** for agile processor specialization based on Multi-Level Intermediate Representation (MLIR). MLIR can support multiple different requirements in a unified infrastructure. _APS provides a unified framework of powerful, open-source EDA and compiler tools for seamless hardware-software co-design_, empowering designers to navigate the complexities of specialization with greater ease and efficiency.

## What You Will Learn

This tutorial will highlight the methodology and open-source tools within the APS framework, demonstrating a complete software-hardware co-design flow:

- **High-level ISAX Description**: Describe ISAXs' behavior at a high, near-software level
- **MLIR-based HLS**: Synthesize efficient hardware architecture through an MLIR-based high-level synthesis flow with powerful debugging features
- **Transactional Hardware Generation**: Translate synthesis results to low-level implementation via MLIR transformations
- **Processor-ISAX Adaptation**: Model the interaction between base processor and ISAX units through a unified ADL interface
- **Compiler Infrastructure**: Automated and efficient utilization of custom ISAXs with compiler feedback

## Setup Instructions

We've released the APS framework as an open-source project on GitHub: [pku-liang/aps-mlir](https://github.com/pku-liang/aps-mlir/), which includes the tools, examples, and documentation needed for the hands-on session.

We provide two options for hands-on setup:

1. _We'll provide SSH access to a pre-configured APS environment during the tutorial._
2. You can set up the APS framework on your local machine before the tutorial using the instructions below.

### Prerequisites

- Linux (Ubuntu 22.04 recommended)
- [Pixi](https://pixi.sh/) package manager

### Installation

1. Clone the repository:
```bash
git clone https://github.com/pku-liang/aps-mlir.git --branch apsdac
cd aps-mlir
```

2. Setup chipyard
```bash
pixi run fix-verilator
pixi run setup-ortools
pixi run setup-yosys-slang
pixi run setup-firtool
pixi run setup-chipyard
```

3. Build CIRCT and APS passes:
```bash
rm -rf circt/build
pixi run setup
pixi run build
```

### Quick Start

The `tutorial/` directory contains example CADL files and scripts. Here's a simple example (`tutorial/cadl/hello.cadl`):

```cadl
#[opcode(7'b0101011)]
#[funct7(7'b0000000)]
rtype hello(rs1: u5, rs2: u5, rd: u5) {
  let a: u32 = _irf[rs1];
  let b: u32 = _irf[rs2];
  let c: u32 = a + b;
  _irf[rd] = c;
}
```

See the `tutorial/` directory for more examples including matrix operations (`vgemv3d.cadl`) and distance calculations (`v3ddist_vv.cadl`).

### Full ASIP Pipeline

```bash
# Synthesize CADL to hardware
./tutorial/a1-ex1synth.sh
# Compile test program with custom instruction
./tutorial/a2-ex1compile.sh
# Full SoC simulation and synthesis
./tutorial/a6-ex1sim.sh
./tutorial/a7-ex1yosys.sh
```


## Target Audience

This tutorial is formulated to be broadly interesting and useful to:

- Students and researchers in computer architecture and EDA
- Faculty members interested in domain-specific hardware
- Practicing engineers in EDA and domain-specific hardware development communities
