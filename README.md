# Travel — Hugo + PaperMod

This repository is a Hugo static site configured to use the [PaperMod](https://github.com/adityatelange/hugo-PaperMod) theme via **Hugo Modules**.

## Prerequisites
- Install Hugo (extended):
  - macOS: `brew install hugo`
- (Recommended) Install Go (for Hugo Modules):
  - macOS: `brew install go`

## Run locally
```bash
# from the project root
hugo server -D
```
Then open the URL printed by Hugo (usually http://localhost:1313).

On first run, Hugo will download the PaperMod theme automatically via modules.

## Create content
```bash
hugo new posts/my-first-post.md
```
Edit front matter and set `draft: false` to publish.

## Project structure
- `config.yaml` — site configuration with PaperMod module import and params
- `content/` — your pages and posts
- `archetypes/` — default front matter for new content
- `static/` — static assets served as-is (optional)
- `assets/` — pipeline assets (SCSS/JS) (optional)

## Deploy
- Build static files:
  ```bash
  hugo --minify
  ```
  Output goes to `public/` which you can deploy to Netlify, GitHub Pages, Cloudflare Pages, etc.

### Optional: Pin the PaperMod version
To pin a specific PaperMod version:
```bash
hugo mod get github.com/adityatelange/hugo-PaperMod@vX.Y.Z
hugo mod tidy
```

If you prefer Git submodule instead of modules, remove the `module.imports` section in `config.yaml`, then add the theme:
```bash
git submodule add https://github.com/adityatelange/hugo-PaperMod themes/PaperMod
```
And set `theme: "PaperMod"` in `config.yaml`.
