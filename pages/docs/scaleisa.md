---
layout: default
title: Custom Instruction Finding with ScaleISA
description: Discovery, implementation exploration, selection, and the APS ScaleISA driver.
permalink: /docs/scaleisa/
toc: true
---

## Purpose and motivation

ScaleISA is for application-driven instruction customization: use it when you have computations to accelerate but have not fixed the custom instructions or their hardware implementations. It discovers reusable patterns and chooses a set of implementations under an area budget, connecting instruction identification with hardware design decisions.

Reuse is a semantic property: two program fragments can compute the same function while using different expressions. [ISAMORE](https://github.com/pku-liang/ISAMORE) introduced e-graph anti-unification and pattern vectorization to find reusable, parallel instructions beyond syntactic matching. Its motivating figure shows how equivalent expressions can expose a shared instruction instead of requiring a large instruction that switches between separate implementations.

{% include documentation-figure.html src='/assets/images/papers/isamore-motivation.svg' alt='ISAMORE compares syntactic merging of hot basic blocks with equality saturation and anti-unification that discover a shared computation across programs.' %}

ScaleISA addresses a further issue: lowering code too early can hide reusable loop- or tensor-level computations, while choosing an instruction before exploring its hardware can miss better global tradeoffs. It combines MLIR with e-graphs to preserve opportunities at multiple abstraction levels and considers instruction candidates and microarchitectural implementations in one search space. Its overview shows discovery across structured computation levels, implementation transformations, and final selection.

{% include documentation-figure.html src='/assets/images/papers/scaleisa-overview.svg' alt='ScaleISA overview: application programs become MLIR, multi-level discovery explores algebraic and structural transformations and HLS choices, and budget-aware extraction selects instructions for hardware generation.' %}

## Discovery and selection

ScaleISA encodes MLIR computations in e-graphs, which retain equivalent alternatives during exploration. Multi-level anti-unification identifies shared patterns; implementation exploration introduces choices such as different loop organizations and hardware parallelism. Selection weighs those alternatives against modeled software cost and hardware area/timing constraints.

The available discovery stages are `linalg`, `affine`, and `scf`. They expose different kinds of structure rather than treating every computation as a low-level instruction sequence. The default APS driver explores all three. The current command-line entry point consumes suitable application **MLIR**; the paper's C/C++ and PyTorch inputs refer to the surrounding frontend flow, not direct file inputs to this driver.

## ScaleISA and the APS driver

The ScaleISA discovery tool and engine implement instruction exploration. `aps-scaleisa-opt` is the integrated APS driver: it prepares the target model, runs discovery and selection, adapts selected kernels to the APS hardware contract, synthesizes RTL, and compiles the selected software. It can additionally link a supplied runtime and execute matching hardware/software in co-simulation.

This makes the driver the user-facing entry point for producing an integrated package. You do not need to manually reconstruct the adapter, synthesis, and software-lowering pass sequence.

## Inputs and control options

| Input or option | Purpose |
| --- | --- |
| Application `.mlir` | Workload suitable for discovery |
| `--area-budget` | Constraint used during instruction/implementation selection |
| `--output-dir` | Directory for generated files, reports, and logs |
| `--discovery-stages` | Discovery levels; default `linalg,affine,scf` |
| `--selection-method` | `greedy`, `cbc`, or `eboost`; solver prerequisites depend on the method |
| `--target-profile` | Software, hardware, and interface model used for exploration |
| `--resource`, `--clock` | Resource contracts and scheduling period for APS synthesis |
| `--verbose` | Stream stage logs |
| `--timeout` | Per-stage timeout in seconds; default 3600 |

A supplied target profile includes resource contracts, so omit `--resource` when using `--target-profile`. Use a consistent target profile when comparing runs. The area and latency quantities used during selection are model estimates, not physical implementation measurements.

## Example invocation

```bash
pixi run build/tools/aps-scaleisa-opt/aps-scaleisa-opt \
  scaleisa/benchmarks/pcl/octree_search/octree_search.mlir \
  --area-budget 500 --output-dir build/scaleisa-octree
```

The bundled input supplies a concrete workload; the output directory gathers the whole run. Discovery may take substantial time. Inspect `report.json` and individual stage logs to see which stages completed and which artifacts were generated.

## Outputs and interpretation

| Output | What it provides |
| --- | --- |
| Discovery and selection reports | Chosen candidates, modeled costs, and selection decisions |
| `candidates.mlir`, `planned.mlir`, `hardware.mlir` | Candidate collection and materialized hardware contracts |
| `design.sv` | Synthesized accelerator RTL when hardware is selected |
| `selected.mlir` | Software with the selected instruction sites |
| `program.o` or `program.elf` | Compiled software; executable output needs platform linkage |
| `report.json` and stage logs | Commands, durations, status, metrics, and artifact hashes |

A valid run can select no instructions. In that case the driver emits software without accelerator RTL and reports `hardware_selected: false`; check the report before treating the run as a generated accelerator.

## Reuse, execution, and validation

`--discovery-dir=PATH` can reuse completed discovery only when the recorded input, target profile, budget, selection method, and discovery stages match. Changing the target model can change which implementations are appropriate.

Object output is the default. To produce an executable, use `--emit=elf` and supply the intended startup/runtime and linker inputs. `--cosim` builds and runs the matching Spike + Verilator model for an executable. [Software compilation]({{ '/docs/compilation/' | relative_url }}) explains linking and compile-only use; [Processor integration]({{ '/docs/integration/' | relative_url }}) explains the distinction between functional validation and processor measurements.

Validate accelerated outputs against an independent software reference. Modeled speedup, measured accelerator cycles, and measured processor speedup have different scopes and should be reported separately.

{% include documentation-nav.html %}
