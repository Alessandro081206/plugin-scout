---
description: Weekly-Update – neue, gute Plugins der letzten 7 Tage, einfach erklärt
argument-hint: [issue]
---

Erstelle das **Plugin-Weekly**: neue, gute Claude-Code-Plugins der letzten 7 Tage. Nutze dafür den Skill `plugin-scout`.

Argument: `$ARGUMENTS`

## Suchen
- Zeitraum: Plugins, die in den **letzten 7 Tagen neu erschienen** sind oder ein **großes Update** bekommen haben (neues Feature, neue Version). Datum von heute ermitteln (`date +%Y-%m-%d`) und davon 7 Tage zurück.
- GitHub: z. B. `gh search repos --topic claude-code-plugin --created ">=<DATUM>" --sort stars --json fullName,description,stargazersCount,createdAt,updatedAt,url`, dasselbe mit den anderen Topics aus dem Skill und mit `--updated ">=<DATUM>"`. Außerdem neue Einträge im offiziellen Marketplace (`gh api "repos/anthropics/claude-plugins-official/commits?since=<DATUM>T00:00:00Z"`).
- Web: neue Plugins, über die diese Woche auf Reddit, Hacker News oder in Blogs gesprochen wurde.
- Qualitätsfilter aus dem Skill anwenden. Lieber 4 richtig gute als 8 mittelmäßige.

## Aufbau
```
# 🧩 Plugin-Weekly – KW <Kalenderwoche>

<1–2 Sätze: Was war diese Woche los?>

## 🏆 Top-Tipp der Woche
<Karte des besten Plugins + ein Satz, warum es das beste ist>

## Neu & gut
<weitere 3–7 Plugin-Karten>

---
Gezielt suchen: `/plugin-scout:suche <was du brauchst>`
```

Gab es diese Woche nichts wirklich Gutes, schreib das ehrlich in 2–3 Sätzen und nenn höchstens 1–2 Plugins, die einen Blick wert sind.

## Ausgabe
- Zeig das Weekly im Chat.
- **Nur wenn das Argument `issue` enthält:** Poste es zusätzlich als GitHub-Issue:
  1. Text in eine Datei schreiben, z. B. `/tmp/weekly.md`
  2. `gh issue create --repo Alessandro081206/plugin-scout --title "🧩 Plugin-Weekly – KW <Kalenderwoche>" --body-file /tmp/weekly.md`
  3. Den Link zum Issue ausgeben.
