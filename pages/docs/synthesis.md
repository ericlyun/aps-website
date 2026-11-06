---
layout: default
title: Hardware Synthesis
description: Instruction descriptions, synthesis capabilities, export options, and diagnostics.
permalink: /docs/synthesis/
toc: true
---

## Purpose and capabilities

APS hardware synthesis turns instruction behavior into an accelerator implementation. It serves designers who already have a CADL instruction and the application-driven flow that supplies kernels selected by [ScaleISA]({{ '/docs/scaleisa/' | relative_url }}). The result can be exported as SystemVerilog for integration or as an intermediate representation for inspection.

The synthesis flow performs loop transformations, array partitioning, dependence analysis, scheduling, and storage planning. It can generate local scratchpads and memory adapters while preserving the instruction's behavior and completion requirements. The resource model describes the available execution units and their timing; the memory-interface model describes how the accelerator can move data.

## Describing an instruction with CADL

CADL records the computation and custom-instruction encoding in one source. It supports fixed-width integer operations, register-file operands, memory accesses, arrays, and supported control-flow constructs. BF16 and FP32 arithmetic use packaged HardFloat implementations. A minimal register-to-register instruction looks like:

```cadl
#[opcode(7'b0101011)]
#[funct7(7'b0000000)]
rtype hello(rs1: u5, rs2: u5, rd: u5) {
  let a: u32 = _irf[rs1];
  let b: u32 = _irf[rs2];
  _irf[rd] = a + b;
}
```

The frontend, exposed by `aps-frontend` and the Pixi `mlir` task, converts supported CADL behavior into functional MLIR. It also provides encoding extraction and C export for software workflows. Parsing a language construct does not guarantee that hardware lowering supports it; unsupported operations must be resolved before RTL generation.

## How synthesis works

`aps-e2e` owns the complete production pipeline. It prepares the functional input, transforms loops and storage, assigns operations to a schedule, and lowers the scheduled computation through CMT2 and FIRRTL to SystemVerilog. `aps-opt` exposes individual compiler passes for development, while `aps-e2e` provides the maintained end-to-end flow.

Memory choices are part of hardware generation: a computation can be limited by data access even when its arithmetic is highly parallel. The interface model lets synthesis consider transfer width, transaction size, latency, and outstanding requests rather than treating all memory accesses alike. The [integration guide]({{ '/docs/integration/' | relative_url }}) explains these inputs and their effect on the generated package.

The timing example from the interface-aware synthesis paper shows how moving bulk data to the burst interface and scheduling individual accesses near their uses can shorten execution without changing the computation.

{% include documentation-figure.html src='/assets/images/papers/aps-memory-schedule.svg' alt='Synthesis timing example: an optimized schedule assigns bulk transfers to the burst interface and overlaps per-iteration memory reads with computation, reducing the illustrated execution time.' %}

## Inputs and configuration

| Input or option | Meaning |
| --- | --- |
| CADL source | Instruction behavior and encoding; convert it with the frontend first |
| `-i`, `--input` | Functional MLIR input to `aps-e2e` |
| `--resource` | Execution resources and scheduling contracts; default `examples/resource_ihp130.json` |
| `--clock` | Requested scheduling period in ns; default 6 |
| `--interface-config` | Platform memory/interface configuration |
| `--export` | `scheduled-tor`, `cmt2`, `firrtl`, or `sv`; default `cmt2` |
| `-o`, `--output` | Output path; otherwise output goes to standard output |
| `--chipyard-config` | Path for generated Chipyard configuration when exporting a platform package |

The requested scheduling period is a synthesis input, not evidence of achieved physical frequency. Technology-specific timing and area require implementation reports.

## Example invocation

```bash
mkdir -p build/quickstart
pixi run mlir examples/aspdac26-tutorial/cadl/v3ddist_vv.cadl \
  build/quickstart/v3ddist_vv.mlir
pixi run build/tools/aps-opt/aps-e2e \
  -i build/quickstart/v3ddist_vv.mlir \
  --export sv -o build/quickstart/v3ddist_vv.sv
```

This uses a bundled 3D-distance instruction. The frontend output remains available as `.mlir`; the second command produces the accelerator `.sv` file. The paths are ordinary inputs and outputs, so the same commands apply to another supported CADL instruction.

`pixi run syn INPUT OUTPUT` is a platform-oriented shortcut: it requests a 4 ns scheduling period, uses `examples/interface.json`, exports SystemVerilog, and writes Chipyard configuration. Use `aps-e2e` directly when selecting resources, exports, or platform settings explicitly.

## Floating-point scope

BF16 and FP32 hardware support includes arithmetic, comparisons, conversions, and related intrinsics through HardFloat. Build the IP after installing APS, then pass its generated resource overlay with `--resource`. FP64 and IEEE FP16 hardware are not supported. Floating-point hardware support and a CPU program's floating-point ABI are separate configuration choices.

## Inspecting results and failures

Use `--dump-scheduled-tor PATH` or `--dump-cmt2 PATH` to retain intermediate output, and `--print-ir-after-all` for pass diagnostics. These help distinguish frontend rejection, unsupported lowering, invalid memory layouts, and missing resource contracts. Run from the repository root so hardware-library metadata resolves correctly.

RTL export creates accelerator hardware. To use it from an application, compile against the same instruction semantics and encoding through [Software compilation]({{ '/docs/compilation/' | relative_url }}), then generate the matched processor package described in [Processor integration]({{ '/docs/integration/' | relative_url }}).

{% include documentation-nav.html %}
