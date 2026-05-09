# AGENTS.md

This repository is maintained with Codex. Follow these notes when making changes here.

## Build Commands

This project uses [pixi](https://pixi.sh) for environment and task management.

```bash
# Initial setup (install Ruby gems and npm packages)
pixi run setup

# Start development server (http://localhost:4000)
pixi run serve

# Build site without serving
pixi run build

# Clean build directory
pixi run clean

# Clean and rebuild
pixi run rebuild
```

## Architecture

This is a Jekyll static site using the Petridish theme, designed for GitHub Pages deployment.

### Key Directories

- `pages/` - Markdown files for static pages
- `_posts/` - Blog posts (filename format: `YYYY-MM-DD-title.md`)
- `_data/` - YAML data files for navigation, footer, and team members
- `_layouts/` - HTML templates (base, default, home, archive, team)
- `_includes/` - Reusable HTML partials (navbar, header, footer, card)
- `_sass/` - Custom SCSS; Bootstrap 5 is in `_sass/bootstrap/`
- `assets/` - Images, JS, CSS, and fonts
- `_site/` - Generated Jekyll output; do not edit directly

### Configuration

- `_config.yml` - Site title, social links, theme colors, and Jekyll settings
- `_data/navigation.yml` - Top navbar structure
- `_data/footer.yml` - Footer content
- `_data/team.yml` - Team member data for the team page

### Deployment

Commits to `main` automatically trigger GitHub Pages builds. No manual build step is required for production.

## Content Guidelines

- Images: Use 72dpi resolution
- Background images: Place in `assets/backgrounds/`, crop to 2100x700px
- Content images: Place in `assets/images/`
- Internal links: Use `{{ '/permalink/' | relative_url }}` syntax

