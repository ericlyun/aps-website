---
layout: default
title: Tutorials
description: Tutorials and educational materials for APS and related topics
permalink: /tutorials/
---

# Tutorials

We regularly organize tutorials at major conferences to introduce researchers and practitioners to our tools and methodologies.

## Upcoming Tutorials

{% for tutorial in site.data.tutorials.upcoming %}
<div class="card mb-3">
<div class="card-body">
<h5 class="card-title">{{ tutorial.conference }}</h5>
<h6 class="card-subtitle mb-2 text-muted">{{ tutorial.title }}</h6>
<p class="card-text">{{ tutorial.details }}</p>
{% if tutorial.page %}
<a href="{{ tutorial.page | relative_url }}" class="btn btn-primary btn-sm">Tutorial Details</a>
{% endif %}
{% if tutorial.website %}
<a href="{{ tutorial.website }}" class="btn btn-outline-primary btn-sm">Conference Website</a>
{% endif %}
</div>
</div>
{% endfor %}

## Past Tutorials

<div class="row">
{% for tutorial in site.data.tutorials.past %}
<div class="col-md-6 mb-3">
<div class="card h-100">
<div class="card-body">
<h5 class="card-title">{{ tutorial.conference }}</h5>
<p class="card-text">{{ tutorial.title }}</p>
<a href="{{ tutorial.website }}" class="btn btn-outline-secondary btn-sm">Tutorial Website</a>
</div>
</div>
</div>
{% endfor %}
</div>

## Learning Resources

### Getting Started with APS

1. **Installation**: Clone the repository and follow the setup instructions
   ```bash
   git clone https://github.com/pku-liang/aps.git
   cd aps
   # Follow README for setup
   ```

2. **Basic CADL Tutorial**: Learn to write your first ISAX specification

3. **Case Studies**: Explore example implementations across different domains
{% for study in site.data.tutorials.case_studies %}
   - {{ study.name }}
{% endfor %}

### Documentation

For detailed documentation, please visit our [GitHub repository](https://github.com/pku-liang/aps).

<!-- ## Contact

For questions about tutorials or to request a tutorial at your institution/conference, please contact:

**{{ site.data.tutorials.contact.name }}**
Email: [{{ site.data.tutorials.contact.email }}](mailto:{{ site.data.tutorials.contact.email }})
{{ site.data.tutorials.contact.institution }} -->
