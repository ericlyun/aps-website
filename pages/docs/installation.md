---
layout: default
title: Installation
description: Dependencies, build products, optional components, and environment setup.
permalink: /docs/installation/
toc: true
---

## Platform and dependencies

APS uses [Pixi](https://pixi.sh/) to manage dependencies and activate its tool environment. Use Linux; Ubuntu 22.04 is the recommended starting point. Install Pixi before building the project. Invoke APS commands from the repository root so the tools can locate their resource descriptions and packaged hardware modules.

The build prepares the repository's LLVM/MLIR/CIRCT infrastructure, APS compiler tools and Python bindings, and the ScaleISA release engine. These components are built together because the frontend, synthesis tools, and software compilers share compiler infrastructure and hardware contracts.

## Obtain and build the software

```bash
git clone https://github.com/pku-liang/APS-MLIR.git
cd APS-MLIR
pixi run build
```

`pixi run build` owns setup as well as the APS build. The initial run builds the underlying infrastructure and takes longer than an incremental rebuild. After updating the source, run it again to rebuild the toolchain.

| Build product | Location or use |
| --- | --- |
| CADL frontend | `pixi run mlir` and `tools/aps-frontend` |
| Synthesis driver | `build/tools/aps-opt/aps-e2e` |
| Pass driver for development | `build/tools/aps-opt/aps-opt` |
| APS ScaleISA driver | `build/tools/aps-scaleisa-opt/aps-scaleisa-opt` |
| ScaleISA discovery tool | `build/tools/scaleisa-opt/scaleisa-opt` |
| ScaleISA release engine | `scaleisa/tools/scaleisa-engine/target/release/scaleisa-engine` |
| CIRCT tools | `circt/build/bin/` |

## Processor and RISC-V tools

```bash
pixi run setup-chipyard
```

This prepares the Chipyard environment and RISC-V tools used for application compilation and Rocket integration. It is needed for the processor workflows; exporting a small accelerator's RTL does not itself require full Rocket setup.

`pixi run COMMAND` activates the environment for one command. Use `pixi shell` for an interactive environment, particularly when entering the Chipyard simulation directory; its activation supplies paths such as `$APS` used by the integration commands.

## Floating-point hardware

For BF16/FP32 synthesis, build the packaged HardFloat IP after the main toolchain:

```bash
pixi run build-hardfloat-ip
```

The importer needs the built `firtool`. It produces hardware modules and resource metadata used by scheduling and RTL generation. Floating-point designs must use the generated resource overlay; the default integer resources do not describe floating-point units. See [Hardware synthesis]({{ '/docs/synthesis/' | relative_url }}) for the supported formats and resource selection.

## Check the installation

```bash
pixi run build/tools/aps-opt/aps-e2e --help
pixi run build/tools/aps-scaleisa-opt/aps-scaleisa-opt --help
```

These commands check that the built drivers can start and expose their options. Generating hardware, compiling a program, and executing it are separate checks described in their respective guides.

If a tool is missing, first confirm that the build completed and that the command runs through Pixi from the repository root. Use the earliest failing build or setup log to diagnose dependency failures; a later missing executable can be a consequence of that earlier failure.

{% include documentation-nav.html %}
