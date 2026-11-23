# Brief for writing an android-material reference file

We are building a Claude Code skill `android-material` at `~/.claude/skills/android-material/`, the Android equivalent of the existing `~/.claude/skills/apple-hig/` skill. Read `~/.claude/skills/apple-hig/references/foundations.md` (first 150 lines) to see the target style and density, then write your assigned reference file.

## Sources
Raw pages already fetched (2026-11-19) live in `~/.claude/skills/android-material/.sources/`:
- `m3dump/` : every page of m3.material.io (Material Design 3, M3 Expressive). File name = slug with `/` replaced by `__`. Source URL is `https://m3.material.io/<slug>` and is printed on line 2 of each file.
- `dacdump/` : developer.android.com design guides (`design__ui__...`) and quality guidelines (`docs__quality-guidelines__...`). Source URL on line 2.
- `extra/` : a few more developer.android.com pages (adaptive icons, splash screen, behavior changes 15/16/17, predictive back, permissions, haptics, app languages, fonts, dark theme, Compose Material 3, window size classes, insets) and the Google Play preview assets help page.
Read the files fully for your scope. Use grep to find things. Do not fetch the web unless your brief says so.

## Output rules
- Language: English (the skill is in English like apple-hig).
- Start with `# Android & Material 3: <Topic>`, one line saying "Distilled from ... (state as of Nov 2026, M3 Expressive era). Rules are paraphrased; follow the source links for the authoritative text.", then a numbered `## Contents` list with anchors, then `---`.
- One `## <Topic>` section per source page/topic, each starting with `Source: <url>` (exact URL from line 2 of the source file).
- Content: actionable rules, paraphrased (never copy long passages), as bullets. Keep every concrete number (dp, sp, ms, ratios, breakpoints, counts, token names, contrast values, sizes) and put numeric specs in tables. Include do / don't guidance, when-to-use vs when-not-to-use, accessibility rules, M3 Expressive changes (May 2025 onward) and "differences from M2" where present. Name Compose / Views APIs when the source names them.
- Skip marketing fluff, image captions without substance, navigation text, "was this helpful", repeated boilerplate.
- Never use the em dash character (U+2014) anywhere. Use a colon, comma, parentheses or a new sentence instead. Also avoid "not X, but Y" contrast phrasing; state things positively.
- Do not invent rules. If something is your inference, mark it "(inference)".
- Target size is given in your task. Dense beats long.
- Write the file with the Write tool to the exact path given. When done, reply with: the path, its byte size, the section list, and any source file you could not use or anything notable (for example new 2026 changes). Keep the reply under 250 words.
