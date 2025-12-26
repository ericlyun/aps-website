---
layout: default
title: Research
description: Research areas and focus of the APS project
permalink: /research/
---

# Research Areas

The APS project encompasses several key research areas in computer architecture and compiler design. Click on any area to learn more about its tools and publications.

{% assign research_areas = site.research | sort: 'order' %}

<div class="row">
{% for area in research_areas %}
<div class="col-md-6 mb-4">
<div class="card h-100">
<div class="card-body">
<h4 class="card-title"><a href="{{ area.url | relative_url }}">{{ area.title }}</a></h4>
<p class="card-text">{{ area.summary }}</p>
<a href="{{ area.url | relative_url }}" class="btn btn-outline-primary btn-sm">Learn more</a>
</div>
</div>
</div>
{% endfor %}
</div>

## Future Directions

We continue to explore new frontiers in agile processor specialization, including:

- Enhanced compiler optimizations for complex control flow
- Support for more RISC-V platforms and ISA extensions
- Integration with emerging application domains
- Automated design space exploration for ISAX optimization

For more details on specific projects and publications, please visit our [Publications]({{ '/publications/' | relative_url }}) page.
