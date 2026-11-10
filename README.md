# 🧩 plugin-scout

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

Du kannst auch einfach fragen: *„Gibt's ein Plugin für Lernkarten?“* oder *„Ist Plugin X sicher?“*

Jedes Plugin wird als kleine Karte erklärt, mit Ampel 🟢🟡🔴. plugin-scout **installiert und löscht nie selbst etwas**, du entscheidest.

## Weekly, das dazulernt

Jeden Montag um 8 Uhr schreibt ein Claude in der Cloud das Weekly als **Issue** in dieses GitHub-Projekt. Jedes Plugin steht dort als eigener Kommentar. **Reagier mit 👍 oder 👎**, dann zeigt dir das nächste Weekly mehr von dem, was dir gefällt. Was du schon gesehen hast, kommt nicht nochmal.

Dein Use Case aus dem Guide liegt in `daten/profil.md`.

## Testen

Im Terminal eintippen:

```
claude --plugin-dir ~/Projekte/plugin-scout
```

## Selbst erweitern

- Neuer Befehl: eine weitere `.md`-Datei in `commands/` anlegen. Der Dateiname wird zum Befehl.
- Wie gesucht, bewertet und erklärt wird, steht in `skills/plugin-scout/SKILL.md`.
