---
layout: default
title: Research
description: Research areas and focus of the APS project
permalink: /research/
---

# Research Areas

Our research connects custom instruction finding, novel hardware description languages, high-level synthesis, and processor specialization. Explore each area for the related papers and its role in the APS ecosystem.

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
