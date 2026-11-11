---
description: 'Finds duplicate, outdated and unused plugins you have installed'
---

Schau dir die installierten Plugins des Nutzers an und hilf beim **Aufräumen**. Nutze den Skill `plugin-scout`. Deinstalliere **nichts selbst**, nur vorschlagen.

## 1. Bestandsaufnahme
- `~/.claude/plugins/installed_plugins.json` lesen: Name, Marketplace, Version, Installationsdatum (`installedAt`), letztes Update (`lastUpdated`)
- Für jedes Plugin seine `plugin.json` und kurz die Bestandteile im `installPath` ansehen (Befehle, Skills, Hooks, MCP-Server), damit du weißt, was es macht
- Aktivierung prüfen: `enabledPlugins` in `~/.claude/settings.json`

## 2. Prüfen
- **Veraltet:** Neuere Version im Marketplace? Vergleiche mit `~/.claude/plugins/marketplaces/<marketplace>/.claude-plugin/marketplace.json` (oder dem Repo auf GitHub). Repo seit über 6 Monaten nicht gepflegt oder archiviert?
- **Doppelt:** Machen zwei Plugins ungefähr dasselbe (z. B. zwei Web-Such-Plugins, zwei Design-Plugins)? Welches ist besser?
- **Unbenutzt (Schätzung):** In den Chat-Verläufen nachsehen, ob Befehle, Skills oder Tools des Plugins vorkamen:
  `grep -rl "<plugin-name>" ~/.claude/projects --include="*.jsonl" 2>/dev/null | wc -l`
  Dazu nach den Namen der Befehle/Skills (`<plugin>:<befehl>`) und Tools (`mcp__plugin_<plugin>_`) suchen. Nur Verläufe nach `installedAt` zählen. Das ist eine **Schätzung**, sag das.
- **Ressourcenfresser:** Plugins mit vielen MCP-Tools oder Hooks, die bei jedem Start laufen, machen Claude langsamer und füllen den Speicher für den Chat. Nenne sie, wenn sie kaum benutzt werden.
- **Sicherheit:** Hat ein Plugin Hooks/MCP und ist dir unbekannt? Dann `/plugin-scout:check` vorschlagen.

## 3. Ergebnis
In der Sprache des Nutzers, einfach (Überschriften und Beschriftungen unten übersetzen):

```
## 🧹 Plugin-Check: <Anzahl> Plugins installiert

| Plugin | Was es macht | Benutzt? | Status |
|---|---|---|---|
| <name> | <ein paar Wörter> | oft / selten / nie gesehen | ✅ behalten / 🔄 updaten / 🗑️ weg damit? / 🤔 doppelt |

### Meine Vorschläge
1. <konkret, mit Grund>
2. …

### So geht's
- Entfernen: `/plugin uninstall <plugin>@<marketplace>`
- Updaten: `/plugin` eintippen → Marketplace auswählen → Update
```

Ist alles in Ordnung, sag das einfach ("Alles aufgeräumt 👌"). Am Ende anbieten: "Soll ich dir Plugins suchen, die eine Lücke füllen würden?"
