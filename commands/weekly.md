---
description: Weekly-Update – neue, gute Plugins der letzten 7 Tage, passend zu dir
argument-hint: [issue]
---

Erstelle das **Plugin-Weekly**: neue, gute Claude-Code-Plugins der letzten 7 Tage. Nutze dafür den Skill `plugin-scout`.

Argument: `$ARGUMENTS`

## 1. Vorbereiten
- Lies das **Profil** (siehe Skill). Gibt es keins, mach ein allgemeines Weekly und schreib unten den Hinweis: "Tipp: Mach `/plugin-scout:start`, dann passt das Weekly zu dir."
- Lies das **Gedächtnis** aus den bisherigen Weekly-Issues (siehe Skill): was schon gezeigt wurde, was 👍 und was 👎 bekommen hat.

## 2. Suchen
- Zeitraum: Plugins, die in den **letzten 7 Tagen neu erschienen** sind oder ein **großes Update** bekommen haben. Datum ermitteln (`date +%Y-%m-%d`) und 7 Tage zurückrechnen (Linux: `date -d '7 days ago' +%Y-%m-%d`, Mac: `date -v-7d +%Y-%m-%d`).
- GitHub: `gh search repos --topic <topic> --created ">=<DATUM>" ...` und dasselbe mit `--updated ">=<DATUM>"` für alle Topics aus dem Skill. Außerdem: Was ist neu im offiziellen Marketplace?
- Web: neue Plugins, über die diese Woche auf Reddit, Hacker News oder in Blogs gesprochen wurde.
- Zusätzlich gezielt nach den Bereichen aus dem Profil suchen.
- Qualitätsfilter + Schnell-Check aus dem Skill. 🔴-Plugins fliegen raus. Schon gezeigte Plugins fliegen raus (außer großes Update).

## 3. Auswählen
- **🎯 Für dich:** 3–5 Plugins, die zum Profil passen. Hier zählen auch 👍/👎 aus dem Gedächtnis.
- **🔭 Über den Tellerrand:** 1–2 coole Plugins aus **ganz anderen Bereichen**, die nicht zum Profil passen, aber spannend sind (z. B. Spiele-Grafik, Musik, etwas Verrücktes). Nur richtig gute oder originelle.
- **🏆 Top-Tipp:** das beste Plugin aus "Für dich".
- Lieber 4 richtig gute als 8 mittelmäßige. Gab es diese Woche nichts wirklich Gutes, sag das ehrlich und zeig höchstens 1–2.

## 4. Aufbau
Text des Issues bzw. der Chat-Antwort:
```
# 🧩 Plugin-Weekly – KW <Kalenderwoche>

<1–2 Sätze: Was war diese Woche los?>

**Diese Woche:** 🏆 <Name> · 🎯 <Name>, <Name>, … · 🔭 <Name>, …

<falls es Gedächtnis gibt, ein Satz wie: "Weil dir letzte Woche X gefallen hat, hab ich mehr Richtung Y geschaut.">

👇 Jedes Plugin steht unten als eigener Kommentar. Reagier mit 👍 oder 👎, dann lerne ich, was dir gefällt.

---
Gezielt suchen: `/plugin-scout:suche <was du brauchst>` · Vor dem Installieren prüfen: `/plugin-scout:check <owner/repo>`
```
Dann jedes Plugin als **eigene Karte** (aus dem Skill), jeweils mit einer Überschrift-Zeile davor: `🏆 Top-Tipp der Woche`, `🎯 Für dich` oder `🔭 Über den Tellerrand`.

## 5. Ausgabe
- **Ohne** `issue` im Argument: Alles im Chat zeigen (Einleitung + alle Karten untereinander). Den 👍/👎-Satz weglassen.
- **Mit** `issue` im Argument: Als GitHub-Issue posten. **Nur über REST** (`gh issue create` und GraphQL gehen in der Cloud nicht):
  1. Einleitung in eine Datei schreiben (z. B. `weekly.md` im Scratchpad bzw. in `/tmp`).
  2. Issue anlegen:
     `gh api repos/Alessandro081206/plugin-scout/issues -f title="🧩 Plugin-Weekly – KW <KW>" -F body=@<datei> --jq .number`
  3. Jede Karte in eine eigene Datei schreiben und als **eigenen Kommentar** posten, in der Reihenfolge 🏆, 🎯, 🔭:
     `gh api repos/Alessandro081206/plugin-scout/issues/<NR>/comments -F body=@<karte> --jq .html_url`
  4. Den Link zum Issue ausgeben.
