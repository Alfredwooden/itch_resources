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
2. **Monitor asset must be hosted over HTTPS** — itch.io won't load local files. This repo hosts `Assets/` via GitHub raw URLs (see step 1 below).
3. **Can't remove itch.io footer** — you can add your custom footer above it, but the "itch.io · Community profile" links must stay visible per itch.io rules.
4. **Collections** — hidden in the sample CSS. Remove those rules if you want them back.
5. **Discord link in mockup** — add Discord in **Settings → Profile → Links** if you want it on the live profile.

## Assets

Hosted in this repo for GitHub raw URLs (`https://raw.githubusercontent.com/Alfredwooden/itch_resources/main/Assets/...`).

| File | Purpose |
|---|---|
| `Assets/background.png` | Tiled page background texture |
| `Assets/Monitor.png` | Full monitor artwork |
| `Assets/Monitor_Clean.png` | Monitor bezel overlay on game thumbnails |
| `Assets/Monitor_Frame.png` | Generated frame with **transparent screen** (from script) |
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

### 1. Asset URLs

`custom.css` loads assets from this repo via GitHub raw URLs (`Assets/background.png`, `Assets/Monitor_Clean.png`, etc.). Commit and push after changing any asset so itch.io picks up updates.

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
