---
layout: home
title: APS - Agile Processor Specialization
description: Open-Source Hardware-Software Co-Design Framework for RISC-V ISAXs
background: /assets/images/illustration.png
permalink: /
---

## News

<div class="row mb-4">
<div class="col-12">
<ul class="list-unstyled">
{% assign sorted_news = site.data.news | sort: "date" | reverse %}
{% for item in sorted_news limit: 2 %}
<li class="mb-2">
<span class="text-muted">{{ item.date | date: "%Y-%m-%d" }}</span> —
{% if item.link %}<a href="{{ item.link }}"><strong>{{ item.title }}</strong></a>{% else %}<strong>{{ item.title }}</strong>{% endif %}
{% if item.description %}<br><small>{{ item.description }}</small>{% endif %}
</li>
{% endfor %}
</ul>
</div>
</div>

---

## What is APS?

**APS (Agile Processor Specialization)** is an open-source framework for agile hardware-software co-design of domain-specific processors. It covers instruction finding, hardware synthesis, software compilation, and architecture integration for instruction-set extensions (ISAXs) on RISC-V platforms.

{:.col-md-12 .mx-auto}
![alt text](assets/images/position.png)
_APS is both open-source and fully integrated, enhancing productivity across all audiences in hardware design and adoption for domain-specific acceleration._

### APS's Ecosystem

APS aims to build a comprehensive ecosystem based on the **MLIR** infrastructure, covering the entire hardware-software co-design flow. Our ultimate vision is to only take applications in the target domain as the inputs, and automatically generate the complete solution artifacts comprising optimized ISAXs, architecture designs, hardware implementation, and software stacks without any manual intervention.

{:.col-md-12 .mx-auto}
![APS ecosystem: instruction finding, hardware synthesis, software compilation, and processor integration]({{ '/assets/images/overview.jpg' | relative_url }})
_Applications and instruction descriptions connect to hardware and software generation through the APS ecosystem._

### Current Capabilities

- **Instruction finding — ISAMORE / ScaleISA:** Discover reusable custom instructions from application MLIR and select implementations under area and timing constraints. The APS ScaleISA driver connects discovery and selection to hardware and software generation.
- **Hardware synthesis — Aquas:** Lower CADL descriptions or adapted ScaleISA kernels through APS, scheduled TOR, CMT2, and FIRRTL to SystemVerilog. The flow includes loop transformations, array partitioning, SDC scheduling, and packaged BF16/FP32 hardware through HardFloat.
- **Software compilation:** Megg uses e-graph matching to compile applications against supplied CADL instructions. The ScaleISA software compiler lowers selected instruction calls to RV32 code with matching instruction encodings, operands, and CSR bindings.
- **Architecture integration:** Model memory bandwidth, latency, and outstanding requests; generate banked scratchpads and DMA adapters; and export matching accelerator RTL and Rocket/RoCC configuration. The native configuration exporter currently targets RV32 with one core.
- **Validation and evaluation:** Run compiled programs with generated accelerator RTL using Spike + Verilator, with independent software references for output validation. Full Rocket simulation provides processor-cycle measurements; selection-model estimates and accelerator cycles describe separate aspects of performance.

Explore the [research areas]({{ '/research/' | relative_url }}) for details and the [publications]({{ '/publications/' | relative_url }}) for the research behind these components.

### Get Started

```bash
# Clone the repository
git clone https://github.com/pku-liang/aps-mlir.git
cd aps-mlir

# Build the toolchain, including the ScaleISA release engine
pixi run build

# Set up Chipyard for Rocket integration
pixi run setup-chipyard
```

Follow the [Documentation]({{ '/docs/' | relative_url }}) for installation and first-use workflows, or explore the [APS repository](https://github.com/pku-liang/aps-mlir). The [examples index](https://github.com/pku-liang/aps-mlir/blob/dev/examples/README.md) includes CADL, Megg, tutorial, and application-driven ScaleISA examples.

We hold tutorials to help new users get started with APS. See the [Tutorial]({{ '/tutorials/' | relative_url }}) page for materials and event details.
