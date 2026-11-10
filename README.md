# 🧩 plugin-scout

Ein Claude-Code-Plugin, das gute **andere Plugins** für dich findet und sie so erklärt, dass man sie sofort versteht.

## Was es kann

| Befehl | Was passiert |
|---|---|
| `/plugin-scout:start` | **Einstiegs-Guide.** Du sagst, wofür du Claude nutzt, und bekommst die wichtigsten Plugins dafür, also das, was andere mit demselben Use Case nutzen. |
| `/plugin-scout:suche <Wunsch>` | Sucht gezielt Plugins, z. B. `/plugin-scout:suche Präsentationen bauen`. Du bekommst 3–5 Vorschläge. |
| `/plugin-scout:weekly` | Zeigt die neuen, guten Plugins der letzten 7 Tage. |

Du kannst auch einfach fragen: *„Gibt's ein Plugin für Lernkarten?“*, dann springt plugin-scout von selbst an.

Jedes Plugin wird als kleine Karte erklärt: was es macht, wofür du es nutzen kannst und welche Befehle du zum Installieren reinkopierst. plugin-scout **installiert nie selbst etwas**, du entscheidest.

## Testen

Im Terminal eintippen:

```
claude --plugin-dir ~/Projekte/plugin-scout
```

Beim ersten Start schlägt Claude dir den Guide vor.

## Weekly per Mail

Jeden Montag um 8 Uhr läuft automatisch ein Claude in der Cloud. Er schreibt das Weekly als **Issue** in dieses GitHub-Projekt, und GitHub schickt dir dazu eine Benachrichtigung.

## Selbst erweitern

- Neuer Befehl: eine weitere `.md`-Datei in `commands/` anlegen. Der Dateiname wird zum Befehl.
- Wie gesucht, bewertet und erklärt wird, steht in `skills/plugin-scout/SKILL.md`.
