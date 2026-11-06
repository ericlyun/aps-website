---
layout: default
title: Software Compilation
description: Megg matching, ScaleISA software lowering, target configuration, and generated artifacts.
permalink: /docs/compilation/
toc: true
---

## Purpose

The software compiler turns an instruction implementation into something application code can use. Generating accelerator RTL alone does not arrange for a program to invoke it: the software must identify offloading opportunities, use the correct instruction encoding, and supply arguments through the hardware's expected operands and CSRs.

APS provides two compiler paths with different starting points. Megg searches application computations for matches to a supplied instruction description. The ScaleISA software compiler receives instruction sites already selected during discovery and lowers those sites using their matching hardware contract.

## Megg: compile against a supplied instruction

Megg is useful when an instruction's behavior is already defined in CADL and you want to use it from a C application. It derives the instruction pattern from that description, converts application and pattern computations through the C/MLIR frontend, and uses e-graph rewriting and matching to identify equivalent computations.

The motivation is that equivalent code need not look identical: expression arrangement, control flow, and loop transformations can obscure an offloading opportunity. Exploring equivalent forms allows matching to use program semantics beyond the surface syntax. The framework's compiler research combines structural matching with component matching to navigate these alternatives.

Megg then emits RISC-V custom instructions with the instruction's encoding and CSR inputs. The hardware must be synthesized from the same CADL semantics. This path requires the configured C frontend, APS Python bindings, Megg support, and RISC-V toolchain supplied or prepared during [installation]({{ '/docs/installation/' | relative_url }}).

The compiler figure traces semantic alignment, e-graph exploration, matching against an instruction specification, and extraction of an application that invokes the instruction.

{% include documentation-figure.html src='/assets/images/papers/aps-compiler.svg' alt='Compiler workflow: application and instruction semantics are aligned, e-graph rewrites expose alternatives, structural and component matching identify offloads, and extraction generates a RISC-V binary.' %}

### Inputs, invocation, and outputs

```bash
mkdir -p build/quickstart
pixi run compile \
  examples/aspdac26-tutorial/cadl/v3ddist_vv.cadl \
  examples/aspdac26-tutorial/csrc/test_v3ddist_vv.c \
  build/quickstart/v3ddist_vv.riscv
```

The arguments are the CADL instruction, C application, and output program path. This bundled pair is one example of the interface; substitute a supported instruction and matching application for your workload. Add `--verbose` for diagnostics.

Compilation artifacts are collected in `compile_logs/` beside the executable. Depending on the stage, these include pattern C/MLIR, instruction encoding data, assembly, statistics, and snapshots. They help distinguish a frontend failure, a missing match, and a code-generation failure.

## ScaleISA: lower already selected instructions

[ScaleISA]({{ '/docs/scaleisa/' | relative_url }}) exposes chosen instruction sites in the selected software. Its software compiler lowers them using the materialized hardware module rather than running Megg's pattern matching again. The contract includes instruction identity, argument positions, types, encodings, and CSR bindings.

For a full discovery-to-code run, use the integrated APS ScaleISA driver. If you already have the matching selected software and hardware contract, compile-only mode avoids repeating discovery and synthesis:

```bash
pixi run build/tools/aps-scaleisa-opt/aps-scaleisa-opt \
  --compile-only build/selected.mlir \
  --hardware build/hardware.mlir -o build/program.o
```

Here `build/selected.mlir` and `build/hardware.mlir` stand for the matching artifacts from an earlier run. The compiler rejects unknown marked instruction sites, inconsistent signatures, invalid encodings, and invalid bindings. It does not infer a replacement contract from an unrelated accelerator.

### Target and executable linkage

The default ScaleISA software target is RV32 with the soft-float `ilp32` ABI, and the default output is an object file. An object file is intended for linking; it is not a standalone runnable program.

For executable output, select `--emit=elf`, provide the program entry with `--entry`, and supply startup/runtime objects or sources and linker arguments with `--link-object`, `--link-source`, and `--link-arg`. These inputs depend on the intended execution platform. CPU floating-point instructions require compatible target features and ABI settings; this choice is separate from BF16/FP32 arithmetic implemented in accelerator hardware.

### Artifacts and reports

The ScaleISA compiler retains intermediate files in `<output>.scaleisa/`, including compiler IR, assembly, object/disassembly, logs, and `compile-report.json`. The integrated driver's `report.json` also records whole-pipeline status and outputs. Inspect both when diagnosing a compilation that succeeds in discovery but fails during software generation.

## Hardware/software agreement

The instruction description or selected hardware contract must agree with the generated RTL. For memory-taking instructions, callers must provide buffers meeting the chosen interface's alignment and visibility requirements; the ScaleISA compiler aligns its owned buffered storage and emits ordering fences for memory instructions. Externally supplied buffers still require suitable allocation.

A compiled program establishes that code was generated. Execute it with matching hardware and compare the results against an independent reference to validate behavior; see [Processor integration]({{ '/docs/integration/' | relative_url }}).

{% include documentation-nav.html %}
