# HatStudio — 3D Hat Customizer

A browser-based 3D hat customizer for showcasing one hat model in any color and material.
Built with [Three.js](https://threejs.org/). No build step and no dependencies to install —
just launch it with the included one-click starter (see **Run it** below).

## Features

- **Loads your real cap by default** — the app opens with your own 3D cap model
  (`models/cap.glb`), so it's modeled around your actual hat, not a generic one. A built-in
  procedural cap is kept only as a fallback if that file is missing.
- **Full 360° rotation** — drag with the mouse to orbit, scroll to zoom, right-drag to pan.
- **Auto-rotate** toggle for a turntable showcase.
- **Any color** — 16 quick swatches, a color picker, or paste a hex code.
- **Material switching** — Cotton, Denim, Wool felt, Leather, Satin, Nylon, Suede. Each
  changes how the surface reflects light (roughness / sheen / clearcoat), not just the color.
- **Two-tone** — give the brim its own color.
- **Metal brand pins** — the cap's built-in embossed logos (front "DICION SPECIAL"
  badge + back "EƎ" monogram) render as raised metal, with independent front/back
  colour pickers (default: dark front, polished-silver back) and a show/hide toggle.
- **Save image (PNG)** — export the current design for your store/catalog.
- **Load your own model** — drop in a `.glb`/`.gltf` file (e.g. a real 3D scan made from your
  hat photos) and all the color & material controls apply to it.

## Run it (easiest — double-click)

The app must be **served by a small local web server** (browsers block 3D-model loading from a
bare `file://` page), so don't just double-click `index.html`. Instead:

- **macOS / Linux:** double-click **`start.command`**
- **Windows:** double-click **`start.bat`**

A small terminal window opens and your browser launches at `http://localhost:8080/`. **Leave that
window open while you use the app; close it to stop.** It needs **Python** *or* **Node** installed
(Python comes pre-installed on macOS / most Linux; on Windows, get it free from
<https://www.python.org/>).

### Run it manually (alternative)

```bash
cd hatstudio
python3 -m http.server 8080
# then open http://localhost:8080/
```

Three.js and the cap model are bundled in the folder, so the app runs **fully offline** — no
internet and no CDN needed.

## How the cap model was made

Your model was supplied as a Blender-exported `.obj` and converted to a web-optimized binary
`.glb` (`models/cap.glb`). The OBJ's baked materials/textures were dropped on purpose: the app
applies its own PBR material and color so the hat can be recolored to anything. To swap in a
new base model, replace `models/cap.glb` (or use the in-app loader for a one-off).

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
