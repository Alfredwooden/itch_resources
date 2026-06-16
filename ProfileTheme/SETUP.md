# Alfredwooden itch.io Profile Theme

Recreates the reference mockup using itch.io's **theme editor** + **custom CSS** + **profile HTML**.

## Feasibility summary

| Reference element | Achievable? | How |
|---|---|---|
| Dark background | Yes | Theme editor BG color + CSS |
| Cream title + red links | Yes | Theme editor + CSS |
| 3-column game grid | Yes | Already on your profile (Grid layout) |
| CRT monitor on thumbnails | Yes | CSS overlay + `Monitor_Frame.png` |
| Scanline / glass effect | Yes | CSS gradient on `.game_thumb::before` |
| Card-style game cells | Yes | CSS on `.game_cell` |
| Red titles, grey descriptions | Yes | Theme link color + CSS |
| "Play in browser" pill button | Yes | CSS on `.web_flag` |
| Custom footer message | Yes | Profile HTML (`custom-footer`) |
| Hide collections / supported list | Yes | CSS or theme editor hide toggles |

### Limitations

1. **5120 character CSS cap** — the provided `custom.css` fits under this. If you grow it, split with `@import` from a CDN (see [nndda/itchio-profile](https://github.com/nndda/itchio-profile)).
2. **Monitor asset must be hosted over HTTPS** — itch.io won't load local files. Upload `Assets/Monitor_Frame.png` (transparent screen version) to your site or an image host.
3. **Can't remove itch.io footer** — you can add your custom footer above it, but the "itch.io · Community profile" links must stay visible per itch.io rules.
4. **Collections** — hidden in the sample CSS. Remove those rules if you want them back.
5. **Discord link in mockup** — your saved profile uses the itch.io profile link instead; add Discord in **Settings → Profile → Links**.

## Assets

| File | Purpose |
|---|---|
| `Assets/Monitor_Clean.png` | Original frame (opaque black screen) |
| `Assets/Monitor_Frame.png` | Generated frame with **transparent screen** for CSS overlay |
| `Assets/Reference.png` | Target design mockup |

## Theme editor settings (recommended)

Match your reference before pasting custom CSS:

| Setting | Value |
|---|---|
| BG | `#1c1c1c` or `#282828` |
| Text | `#d2d2d2` |
| Link | `#ff5c5c` |
| Font | Sans serif (e.g. **Syne**, **DM Sans**, or **Lato**) for closer match to mockup |
| Size | ~96% |
| My Projects → Layout | **Grid** |
| My Projects → Columns | 3 (via grid cell width in editor) |
| Border radius | `14` (optional, cards use CSS radius too) |

## Installation steps

### 1. Host the monitor frame

Upload `Assets/Monitor_Frame.png` and copy the HTTPS URL.

Open `ProfileTheme/custom.css` and replace:

```
MONITOR_FRAME_URL
```

with your URL, e.g.:

```
https://www.theycallmealfred.com/assets/Monitor_Frame.png
```

### 2. Paste custom CSS

1. Go to [alfredwooden.itch.io](https://alfredwooden.itch.io/)
2. Click **Edit theme** (owner tools)
3. Open **Misc → Custom CSS**
4. Paste the contents of `custom.css`
5. **Save**

### 3. Paste profile HTML

1. Go to [itch.io/user/settings](https://itch.io/user/settings) → **Profile**
2. Open the bio/editor, click **`<>`** (HTML mode)
3. Paste `custom.html` at the bottom (or adjust copy as you like)
4. Save profile

### 4. Fine-tune the monitor inset

If cover art doesn't align with the screen hole, edit in custom CSS:

```css
--monitor-inset: 15.5%;  /* try 14% – 17% */
```

### 5. Preview logged out

Open your profile in a private/incognito window to see the visitor view without the theme editor panel.

## Regenerate Monitor_Frame.png

If you edit `Monitor_Clean.png`:

```powershell
powershell -File scripts/make_monitor_frame.ps1
```
