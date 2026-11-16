---
name: ui-motion-pipeline
description: Run one screen or component through a fixed design-and-motion pipeline — de-slop, design audit, craft details, mobile-native feel, find animation opportunities, build the animations, review them, plan what's left, then a final design-system check. Use when asked to "run the full design and motion pass", "polish this screen end to end", "audit and animate this page", or to chain impeccable, emil-design-eng, animate and the animation review skills in order. Argument — a screen, file, component or URL.
---

# UI + Motion Pipeline

Take **one** screen (or a small set of files) through ten steps, strictly in order.
Each step is a call to another skill via the Skill tool; do not start the next step until the
previous one has produced its result. Never run it on a whole site in one go — scope is whatever
the user named (screen, file, component, URL).

## Before you start

1. Confirm the scope in one line ("Running the pipeline on `<target>`").
2. Find the project's design source of truth: `DESIGN.md`, a tokens file, a Tailwind config, a
   `design-system/` folder, or the main stylesheet. Every step must keep to it — **never invent a new
   visual direction**.
3. Check which skills are installed. A missing skill is skipped and named in the final report;
   it never stops the pipeline.
4. Check the target size(s): desktop 1440 and mobile 375 unless the user says otherwise.

## Steps

| # | Step | Skill / agent | What it produces |
|---|------|---------------|------------------|
| 1 | De-slop | `unslop` (light-touch mode only) | Removes AI-looking tells: glows, gradient text, uppercase tracked labels, emoji labels, uneven spacing. No image generation. |
| 2 | Design audit | `impeccable` | Prioritized findings: hierarchy, spacing, type, colour, accessibility, responsive, states, copy. Drop findings that contradict the design system. |
| 3 | Craft details | `emil-design-eng` | Second pass on invisible details: press feedback, hover/focus states, component consistency. Merge into the list, dedupe. |
| 4 | Mobile feel | `mobile-native` | Mobile/touch only: sticky hover, tap highlight, `100vh`, input zoom, safe areas. Skip for desktop-only screens. |
| 5 | Fix | — | Apply the non-motion fixes from steps 1–4. Ask the user only about changes that visibly alter the screen. |
| 6 | Find | `find-animation-opportunities` | Read-only. Where motion is missing and earns its place, with exact values (property, curve, duration). Rejects the rest. |
| 7 | Build | `animate` | Implements the accepted proposals from step 6, one at a time, in the skill's decision order. |
| 8 | Review | `review-animations` | Checks exactly what step 7 built: curves, durations, `prefers-reduced-motion`, interruptibility, performance. Fix what it finds immediately. |
| 9 | Plan | `improve-animations` | Read-only survey around the touched files: what is still weak, prioritized plan. No code changes. |
| 10 | Final check | design-review subagent, if one exists (otherwise do it yourself) | Compare the result against the design source of truth. Fix mismatches, re-check once. |

## Rules

- Respect `prefers-reduced-motion` and pressed (`:active`) feedback everywhere.
- Test in a real browser at each target size when a preview is available. In a hidden/background
  preview, transitions do not advance — verify with `document.getAnimations()` and `finish()`.
- Do not commit, push or deploy unless the user asks.
- One change at a time in steps 5 and 7, so a regression can be traced to its cause.
- Don't add motion for things users see dozens of times a day unless step 6 gives a concrete reason.

## Final report (short, plain language)

- Found in steps 1–5 and what was fixed.
- Animations added (one line each).
- **Rejected animations** — everything step 6 proposed but was dropped in steps 6–8 (too frequent, distracting,
  costly, failed the review). One line each: what, where, why rejected, what it would give if done anyway.
  Ask the user which of them to add; add none without a "yes".
- What the review in step 8 found and how it was fixed.
- The plan from step 9: 3–5 items, each as "what it gives".
- The final check from step 10.
- What was not verified (other browsers, real devices, light/dark theme).
