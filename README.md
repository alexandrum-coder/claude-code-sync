# claude-code-sync

Personal Claude Code skill/plugin config, synced across machines. The originals at
`~/.claude/skills/<name>` are Windows directory **junctions** pointing into
`custom-skills/<name>` in this repo (not git submodules, not symlinks — this
machine has no admin rights / Developer Mode for real NTFS symlinks, but
junctions work the same way without elevation).

## Synced (`custom-skills/`)

| Folder | What it is | Origin |
|---|---|---|
| `browser-harness` | Browser Use's CDP-based browser-control skill | [browser-use/browser-harness](https://github.com/browser-use/browser-harness) @ `7594909e7963c9ba328e39cc79e9f20ff94b2a82` |
| `design-extract` | "designlang" plugin — extract/grade/remix a site's design language | [Manavarya09/design-extract](https://github.com/Manavarya09/design-extract) @ `e7ad883cdc9232b05164d71a7e07957efecd9c92` |
| `graphify` | Codebase-to-knowledge-graph tool, triggered by `/graphify` per global CLAUDE.md | [safishamsi/graphify](https://github.com/safishamsi/graphify) @ `5d053721aba875156cf2a6ddd6953d8beee98147`, **plus local modifications** (see below) |
| `impeccable` | Frontend design/critique skill (wraps the `impeccable` npx CLI) | manually installed, no upstream git history found |
| `caveman` | Ultra-compressed "caveman mode" communication skill | manually installed, no upstream git history found |

For `browser-harness`, `design-extract`, and `graphify`, the `.git` history was
stripped before syncing (each was a full clone — keeping the history would have
meant carrying someone else's entire commit log around). The table above
records the exact commit each was pinned at, so a faithful copy can be
recreated by cloning the origin and checking out that SHA if you ever want the
history back.

**`graphify` has local customizations layered on top of the upstream clone:**
`SKILL.md`, `.graphify_version`, and `references/` were untracked (not part of
the upstream repo) at sync time — the `SKILL.md` frontmatter even renames it to
`graphify-windows` internally. These files are real, intentional local edits
and are included as plain files in this sync.

**`caveman` overlaps with a built-in skill.** Claude Code ships an
`anthropic-skills:caveman` skill via its own marketplace plugin. This
`custom-skills/caveman` is a separate, manually-placed personal skill (not
installed through that plugin mechanism) — kept here because it physically
lives in the personal skills directory, not because it's meant to replace the
built-in one.

## Skipped

- **`~/.claude/plugins/data/pdf-viewer-inline`** — this is just Claude Code's
  own cache/data directory for its built-in `pdf-viewer` plugin, not a
  custom or third-party plugin install. Nothing to sync. `custom-plugins/`
  is therefore empty in this repo (kept as a placeholder for the future).
- **`~/.claude/skills/open-design`** — a pristine, unmodified clone of
  [nexu-io/open-design](https://github.com/nexu-io/open-design)
  @ `d19c53d274228d10ad0cd00e3d1ba7d28a799d01`. Skipped because it's 1.7GB
  (1.5GB of that is its own `.git` history) — far too large for a config-sync
  repo, and nothing would be lost by re-cloning since it's unmodified. Left in
  place at its original path on this machine. To restore it on another
  machine:

  ```bash
  git clone https://github.com/nexu-io/open-design.git ~/.claude/skills/open-design
  git -C ~/.claude/skills/open-design checkout d19c53d274228d10ad0cd00e3d1ba7d28a799d01
  ```

## Setting up a second machine (e.g. Mac mini)

```bash
git clone <this-repo-url> ~/claude-code-sync
mkdir -p ~/.claude/skills ~/.claude/plugins

for name in browser-harness caveman design-extract graphify impeccable; do
  rm -rf ~/.claude/skills/"$name"   # remove only if it doesn't already hold work you want to keep
  ln -s ~/claude-code-sync/custom-skills/"$name" ~/.claude/skills/"$name"
done

# open-design is intentionally not in this repo (see "Skipped" above) — reclone it directly:
git clone https://github.com/nexu-io/open-design.git ~/.claude/skills/open-design
git -C ~/.claude/skills/open-design checkout d19c53d274228d10ad0cd00e3d1ba7d28a799d01
```

On macOS, `ln -s` creates a real symlink unprivileged, so the loop above just
works — no junction workaround needed (that's a Windows-only detour).
