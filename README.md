# AI Workflow — Slide Deck

Marp-based presentation: **From Traditional Development to AI-Powered Engineering**.

## Structure

```
.
├── slides.md               # Main presentation source
├── anak_sd_makan_soto.mp4  # Demo video (Seedance 2.0)
├── data_acquisition.html   # Mockup-to-HTML demo (embedded as iframe)
├── 4.png                   # Supporting image
├── themes/                 # Community theme CSS files
│   ├── rose-pine.css
│   ├── rose-pine-moon.css
│   ├── rose-pine-dawn.css
│   ├── academic.css
│   ├── beam.css
│   ├── border.css
│   ├── gradient.css
│   └── graph_paper.css
├── dist/                   # Compiled output per theme
└── package.json
```

## Requirements

- Node.js v18+
- `npm install`

## Build

### Default (current theme in frontmatter)

```sh
npm run build       # → slides.html
npm run pdf         # → slides.pdf
npm run watch       # Watch mode, auto-reload on save
```

### Build all themes at once

```sh
npm run build:all   # → dist/*.html (10 themes)
```

### Build a specific theme

| Command                        | Output                        |
|-------------------------------|-------------------------------|
| `npm run build:rose-pine`      | `dist/rose-pine.html`         |
| `npm run build:rose-pine-moon` | `dist/rose-pine-moon.html`    |
| `npm run build:rose-pine-dawn` | `dist/rose-pine-dawn.html`    |
| `npm run build:academic`       | `dist/academic.html`          |
| `npm run build:beam`           | `dist/beam.html`              |
| `npm run build:border`         | `dist/border.html`            |
| `npm run build:gradient`       | `dist/gradient.html`          |
| `npm run build:graph-paper`    | `dist/graph-paper.html`       |
| `npm run build:gaia`           | `dist/gaia.html`              |
| `npm run build:uncover`        | `dist/uncover.html`           |

## Switch Active Theme

Change the `theme` value in `slides.md` frontmatter:

```yaml
---
marp: true
theme: rose-pine-moon   # ← change this
paginate: true
html: true
---
```

Available theme names: `rose-pine`, `rose-pine-moon`, `rose-pine-dawn`, `academic`, `beam`, `border`, `gradient`, `graph_paper`, `gaia`, `uncover`.

## Notes

- `html: true` is set in the frontmatter to enable `<video>` and `<iframe>` tags.
- `--allow-local-files` is passed in all build scripts so local assets (video, iframe) are embedded correctly.
- Theme CSS files are sourced from [Marp Community Themes](https://rnd195.github.io/marp-community-themes/).
