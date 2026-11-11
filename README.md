# 🧩 plugin-scout

🇩🇪 [Deutsche Version](README.de.md)

A Claude Code plugin that finds good **other plugins** for you, checks them for safety, and explains them so anyone can understand them, no tech jargon.

> Made for people who aren't professional developers. plugin-scout replies **in your language**: write in English, get English; write in German, get German.

<p align="center"><img src="assets/card.png" alt="plugin-scout explaining a plugin with a traffic-light rating" width="760"></p>

## What it does

| Command | What happens |
|---|---|
| `/plugin-scout:start` | **Getting-started guide.** Tell it what you use Claude for and get the most important plugins: must-haves, nice-to-haves and one surprise. Your use case is saved. |
| `/plugin-scout:search <wish>` | Searches for plugins, e.g. `/plugin-scout:search build presentations`. You get 3–5 suggestions. |
| `/plugin-scout:check <plugin>` | **Safety check** before installing: What does it do on your computer? Are the GitHub stars real? Ends with a traffic light 🟢🟡🔴. |
| `/plugin-scout:compare <A> <B>` | Compares two plugins and tells you which one fits you better. |
| `/plugin-scout:cleanup` | Shows which of your plugins are duplicates, outdated or unused. |
| `/plugin-scout:weekly` | New, good plugins from the last 7 days that match you, plus 1–2 from completely different areas. |
| `/plugin-scout:setup-weekly` | Sets up your **automatic weekly** (every Monday as a GitHub issue). |

You can also just ask: *"Is there a plugin for flashcards?"* or *"Is plugin X safe?"*

Every plugin is shown as a small card with a traffic light 🟢🟡🔴. plugin-scout **never installs or removes anything by itself**. You decide.

## A weekly that learns

`/plugin-scout:setup-weekly` creates a **private** GitHub repo just for you (e.g. `your-name/plugin-scout-daten`) and a cloud routine. Every Monday it posts the weekly there as an **issue**, with each plugin as its own comment. **React with 👍 or 👎** and the next weekly shows more of what you like. Plugins you've already seen don't come back.

Your profile (use case) is stored in that private repo, not in this one.

## Install

In Claude Code, type:

```
/plugin marketplace add Alessandro081206/plugin-scout
/plugin install plugin-scout@plugin-scout
```

Then run `/plugin-scout:start`.

## Try it locally

```
git clone https://github.com/Alessandro081206/plugin-scout.git
claude --plugin-dir ./plugin-scout
```

## Tests

- `sh tests/pruefen.sh` checks the structure (free, also runs automatically on GitHub on every push)
- `claude plugin eval . --allow-tools Bash WebFetch WebSearch` runs behavior tests from `evals/` (uses some of your Claude usage, about $1 for all three)

## Contributing

Found a bug or have an idea? [Open an issue](../../issues/new/choose). New commands are just `.md` files in `commands/`. How plugins are searched, rated and explained lives in `skills/plugin-scout/SKILL.md`.

## License

[MIT](LICENSE) © 2026 Alessandro081206
