# 🧩 plugin-scout

🇬🇧 [English version](README.md)

Ein Claude-Code-Plugin, das gute **andere Plugins** für dich findet, prüft und so erklärt, dass man sie sofort versteht.

## Was es kann

| Befehl | Was passiert |
|---|---|
| `/plugin-scout:start` | **Einstiegs-Guide.** Du sagst, wofür du Claude nutzt, und bekommst die wichtigsten Plugins dafür: Must-haves, Nice-to-haves und eine Überraschung. Dein Use Case wird gespeichert. |
| `/plugin-scout:suche <Wunsch>` | Sucht gezielt Plugins, z. B. `/plugin-scout:suche Präsentationen bauen`. Du bekommst 3–5 Vorschläge. |
| `/plugin-scout:check <Plugin>` | **Sicherheits-Check** vor dem Installieren: Was macht es auf deinem Rechner? Sind die Sterne echt? Am Ende gibt's eine Ampel 🟢🟡🔴. |
| `/plugin-scout:vergleich <A> <B>` | Vergleicht zwei Plugins und sagt, welches besser zu dir passt. |
| `/plugin-scout:aufraeumen` | Zeigt, welche deiner Plugins doppelt, veraltet oder unbenutzt sind. |
| `/plugin-scout:weekly` | Neue, gute Plugins der letzten 7 Tage, passend zu dir, plus 1–2 aus ganz anderen Bereichen. |
| `/plugin-scout:weekly-einrichten` | Richtet dein **automatisches Weekly** ein (jeden Montag als GitHub-Issue). |

Du kannst auch einfach fragen: *„Gibt's ein Plugin für Lernkarten?“* oder *„Ist Plugin X sicher?“*

Jedes Plugin wird als kleine Karte erklärt, mit Ampel 🟢🟡🔴. plugin-scout **installiert und löscht nie selbst etwas**, du entscheidest.

## Weekly, das dazulernt

`/plugin-scout:weekly-einrichten` legt dir ein **privates** GitHub-Repo an (z. B. `dein-name/plugin-scout-daten`) und eine Routine in der Cloud. Jeden Montag schreibt Claude das Weekly dort als **Issue** hinein, jedes Plugin als eigenen Kommentar. **Reagier mit 👍 oder 👎**, dann zeigt dir das nächste Weekly mehr von dem, was dir gefällt. Was du schon gesehen hast, kommt nicht nochmal.

Dein Profil (Use Case) liegt in diesem privaten Repo, nicht hier.

## Installieren

In Claude Code eintippen:

```
/plugin marketplace add Alessandro081206/plugin-scout
/plugin install plugin-scout@plugin-scout
```

Danach `/plugin-scout:start` eintippen.

**Für dich beim Entwickeln** (lokaler Ordner statt GitHub):

```
/plugin marketplace add ~/Projekte/plugin-scout
/plugin install plugin-scout@plugin-scout
```

Nach Änderungen am Plugin: `/plugin` → Marketplace `plugin-scout` → **Update**, dann Claude neu starten.

## Testen

- Schnell ausprobieren: `claude --plugin-dir ~/Projekte/plugin-scout`
- Aufbau prüfen: `sh tests/pruefen.sh` (kostenlos, läuft auf GitHub auch automatisch bei jedem Hochladen)
- Verhalten prüfen: `claude plugin eval . --allow-tools Bash WebFetch WebSearch` (Tests in `evals/`, kostet etwas Claude-Nutzung, ca. 1 $ für alle drei)

## Selbst erweitern

- Neuer Befehl: eine weitere `.md`-Datei in `commands/` anlegen. Der Dateiname wird zum Befehl.
- Wie gesucht, bewertet und erklärt wird, steht in `skills/plugin-scout/SKILL.md`.
- Der Auftrag für die Montags-Routine steht in `vorlagen/weekly-routine.md`.

## Lizenz

[MIT](LICENSE) © 2026 Alessandro081206
