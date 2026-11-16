# ui-motion-pipeline

**One command that takes a screen from "it works" to "it feels designed" — audit, polish, and motion, in the right order.**

A [Claude Code](https://claude.com/claude-code) skill that chains the best design and animation skills
into a single, ordered pass over one screen or component:

```
unslop → impeccable → emil-design-eng → mobile-native → fix
      → find-animation-opportunities → animate → review-animations → improve-animations → final check
```

```text
/ui-motion-pipeline src/app/checkout/page.tsx
```

## Why

Each of these skills is great on its own. Run in the wrong order, they fight each other:
you animate a layout that the next audit rewrites, or you polish spacing that the de-slop pass
throws away. This pipeline fixes the order:

1. **Clean first** — remove AI-looking tells before judging the design.
2. **Audit, then details** — structure before polish.
3. **Fix static UI before adding motion** — never animate something that is about to change.
4. **Find → build → review → plan** — motion is proposed with exact values, built one piece at a time,
   reviewed against what was actually built, and the leftovers become a plan instead of scope creep.
5. **Check against your design system** — the pipeline never invents a new visual direction.

And it tells you what it **didn't** do: every animation that was proposed and rejected is listed at the
end with the reason, so you decide what to add.

## The steps

| # | Step | Skill | Result |
|---|------|-------|--------|
| 1 | De-slop | `unslop` (light-touch) | Glows, gradient text, emoji labels, uneven spacing removed |
| 2 | Design audit | `impeccable` | Prioritized findings: hierarchy, type, colour, a11y, responsive, states, copy |
| 3 | Craft details | `emil-design-eng` | Press feedback, hover/focus, consistency |
| 4 | Mobile feel | `mobile-native` | Sticky hover, tap highlight, `100vh`, input zoom, safe areas (mobile screens only) |
| 5 | Fix | — | Non-motion fixes from steps 1–4 |
| 6 | Find | `find-animation-opportunities` | Where motion earns its place, with exact curves and durations |
| 7 | Build | `animate` | Accepted animations implemented one at a time |
| 8 | Review | `review-animations` | Curves, durations, reduced motion, interruptibility, performance |
| 9 | Plan | `improve-animations` | Prioritized plan for what's still weak — no code changes |
| 10 | Final check | design-review subagent or Claude | Result compared against your design system |

Missing a skill? That step is skipped and named in the report — the pipeline keeps going.

## Install

### 1. This skill

**Project-level** (shared with your team via git):

```bash
git clone https://github.com/Nikitosss37/ui-motion-pipeline /tmp/ui-motion-pipeline
mkdir -p .claude/skills
cp -r /tmp/ui-motion-pipeline/skills/ui-motion-pipeline .claude/skills/
```

**User-level** (available in every project):

```bash
git clone https://github.com/Nikitosss37/ui-motion-pipeline /tmp/ui-motion-pipeline
mkdir -p ~/.claude/skills
cp -r /tmp/ui-motion-pipeline/skills/ui-motion-pipeline ~/.claude/skills/
```

Or run the installer from a clone: `./install.sh` (user-level) or `./install.sh --project` (current folder).

### 2. The skills it calls

Install the ones you want; any missing step is skipped.

| Skill | Source |
|-------|--------|
| `animate`, `find-animation-opportunities`, `review-animations`, `improve-animations`, `emil-design-eng`, `mobile-native` | [emilkowalski/skills](https://github.com/emilkowalski/skills) |
| `impeccable` | [Impeccable](https://impeccable.style) plugin |
| `unslop` | [heydamir/unslop](https://github.com/heydamir/unslop) |

Restart Claude Code (or start a new session) so it picks up new skills.

## Usage

```text
/ui-motion-pipeline <screen, file, component or URL>
```

Or just ask: *"run the full design and motion pass on the settings page"*.

Tips:

- **One screen at a time.** The pipeline is deliberately scoped — a whole app in one go turns into noise.
- **Have a design source of truth.** `DESIGN.md`, a tokens file, or your Tailwind config. Every step keeps to it.
- **Give it a running preview** (dev server or URL) so steps can be checked in a real browser at 1440 and 375.

## What you get at the end

A short plain-language report:

- what was found and fixed;
- animations added (one line each);
- **rejected animations** — what, where, why, and what it would give — for you to pick from;
- what the motion review caught;
- a 3–5 item plan for what's next;
- what was not verified (other browsers, real devices, themes).

Nothing is committed or deployed unless you ask.

## Credits

This skill only orchestrates. The craft lives in the skills it calls —
thanks to Emil Kowalski, the Impeccable authors, and heydamir. Please star their repos too.

## License

[MIT](LICENSE)
