# HatStudio — 3D Hat Customizer

A browser-based 3D hat customizer for showcasing one hat model in any color and material.
Built with [Three.js](https://threejs.org/). No build step, no server, no dependencies to
install — just open the file.

## Features

- **3D baseball cap** modeled procedurally in code (crown, structured curved brim with real
  thickness, base band, and top button) — no photos required to get started.
- **Full 360° rotation** — drag with the mouse to orbit, scroll to zoom, right-drag to pan.
- **Auto-rotate** toggle for a turntable showcase.
- **Any color** — 16 quick swatches, a color picker, or paste a hex code.
- **Material switching** — Cotton, Denim, Wool felt, Leather, Satin, Nylon, Suede. Each
  changes how the surface reflects light (roughness / sheen / clearcoat), not just the color.
- **Two-tone** — give the brim its own color.
- **Save image (PNG)** — export the current design for your store/catalog.
- **Load your own model** — drop in a `.glb`/`.gltf` file (e.g. a real 3D scan made from your
  hat photos) and all the color & material controls apply to it.

## Run it

It's a single static file. Either:

- **Double-click `index.html`** to open it in your browser, or
- Serve the folder (recommended, avoids any browser file restrictions):

  ```bash
  python3 -m http.server 8000
  # then open http://localhost:8000
  ```

> Note: Three.js is loaded from a CDN (unpkg), so an internet connection is needed the first
> time you open it.

## About "modeling from photos"

True photo → 3D model conversion (photogrammetry) requires a dedicated scanning/reconstruction
pipeline and many photos taken from all angles. This app instead ships with a clean,
parametric cap model that works immediately. When you have a real 3D model of *your* specific
hat (exported as `.glb` from a photogrammetry tool, a 3D artist, or a phone scanner app), use
the **Load your own .glb model** button — the customizer (color, material, two-tone, rotation,
snapshot) works on that model too.

## Customizing the built-in hat

The cap geometry lives in `index.html`:

- `crownGeo` — the dome (adjust the `.scale(...)` for a taller/flatter crown).
- `buildBrim()` — the brim shape; tweak `thetaMax` (how far it wraps), `rOuter` (length),
  and the droop/curl terms for different brim styles.
- `MATERIALS` — add or tune material presets.
- `SWATCHES` — change the quick-pick color palette.
