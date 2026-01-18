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

**APS (Agile Processor Specialization)** is an open-source framework for agile hardware-software co-design of domain-specific processors. It provides both hardware synthesis and compiler infrastructure to facilitate the development of instruction extensions (ISAXs) for domain acceleration on RISC-V platforms.

{:.col-md-12 .mx-auto}
![alt text](assets/images/position.png)
_APS is both open-source and fully integrated, enhancing productivity across all audiences in hardware design and adoption for domain-specific acceleration._

### APS's Ecosystem

APS aims to build a comprehensive ecosystem based on the **MLIR** infrastructure, covering the entire hardware-software co-design flow. Our ultimate vision is to only take applications in the target domain as the inputs, and automatically generate the complete solution artifacts comprising optimized ISAXs, architecture designs, hardware implementation, and software stacks without any manual intervention.

{:.col-md-12 .mx-auto}
![alt text](assets/images/vision.png)
_APS is an innovative practice of MLIR-based, automated hardware-software co-design._


### Current Status

We are actively evolving the APS ecosystem in line with our vision. We have released two versions of APS so far:

- **APS (ICCAD 2025)**: The first public appearance of APS as a small prototype developed in Rust to showcase the idea of automated hardware-software co-design.
- **APS 2.0 (Aquas)**: The first MLIR-integrated version of APS, which provides the complete flow around MLIR dialects for both hardware synthesis and compiler generation.


### Get Started

```bash
# Clone the repository
git clone https://github.com/pku-liang/aps-mlir.git
cd aps-mlir

# Follow the documentation for setup and usage
```

Visit our [GitHub repository](https://github.com/pku-liang/aps-mlir) for more information, documentation, and examples.

We are holding tutorials to help new users get started with APS. See the [Tutorial]({{ '/tutorials/' | relative_url }}) page for details. Stay tuned for upcoming events!
