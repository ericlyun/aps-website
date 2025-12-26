---
layout: default
title: Publications
description: Research outputs from the APS project
permalink: /publications/
---

# Publications

<ul class="list-unstyled">
{% for item in site.data.publications %}
{% assign pub = item[1] %}
{% include publication.html pub=pub %}
{% endfor %}
</ul>

## Related Work

For a complete list of publications from our research group, please visit the [GitHub repository](https://github.com/pku-liang/aps).
