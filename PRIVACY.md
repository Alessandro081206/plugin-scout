# Privacy Policy – plugin-scout

_Last updated: November 11, 2026_

plugin-scout is a free, open-source Claude Code plugin. It is made only of instructions for Claude (skills and commands). It has no server, no analytics and no telemetry. **The author never receives any of your data.**

## What plugin-scout reads

- **Your installed plugins:** `~/.claude/plugins/installed_plugins.json` and `known_marketplaces.json`, so it doesn't recommend plugins you already have.
- **Your local Claude Code chat logs** (only when you run `/plugin-scout:cleanup`): searched for plugin names to estimate which plugins you actually use.
- **Your GitHub username** (only when you run `/plugin-scout:setup-weekly` or use the weekly): to find or create your private data repository.

All of this is read on your own computer by Claude. None of it is uploaded by plugin-scout.

## What plugin-scout stores

- **Your profile** (`~/.claude/plugin-scout/profil.md`): the use case, language and interests you tell it in `/plugin-scout:start`.
- **A small config file** (`~/.claude/plugin-scout/config`): the name of your weekly data repository.
- **Optional:** if you set up the weekly, your profile and the weekly issues are stored in **your own private GitHub repository** on your own account.

You can delete all of it at any time by removing the folder `~/.claude/plugin-scout` and, if you created it, your private `plugin-scout-daten` repository.

## What plugin-scout sends

- **Search terms and public repository names** to GitHub (via the GitHub CLI) and to web search, to find and check plugins.
- **Optional weekly:** a scheduled Claude routine posts the weekly as an issue to your own private GitHub repository.

These services (GitHub, your web search tool, Anthropic's Claude) handle data under their own privacy policies. plugin-scout does not send data anywhere else.

## Children

plugin-scout is not directed at children under 18.

## Contact

Questions or concerns: open an issue at https://github.com/Alessandro081206/plugin-scout/issues
