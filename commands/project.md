---
description: 'Looks at the project you are working on and suggests plugins that would really help it'
argument-hint: '[folder, default: current folder]'
---

Schau dir das Projekt des Nutzers an und schlag Plugins vor, die **diesem Projekt** wirklich helfen würden. Nutze dafür den Skill `plugin-scout`. Antworte in der Sprache des Nutzers (siehe Skill), locker und ohne Fachchinesisch.

Ordner: `$ARGUMENTS` (leer = aktueller Ordner)

**Grundregeln:**
- **Nur lesen.** Nichts installieren, nichts im Projekt ändern.
- **Sparsam, aber gründlich:** Kein Quellcode lesen, nur einen Überblick ("Fingerabdruck") und kleine Config-Dateien. Ist das Bild danach unklar, darfst du gezielt nachschauen (Anfang der README, 1–2 typische Dateien), statt zu raten. Qualität geht vor Sparen.
- **Geheime Dateien nie lesen**, auch nicht teilweise: `.env*`, `*.pem`, `*.key`, `*.p12`, `id_rsa*`, `credentials*`, `secrets*`, Ordner `.ssh/` und `.aws/`. Zählen ist okay.
- **Datenschutz:** Nach außen (Websuche, GitHub-Suche, Subagent) gehen nur allgemeine Begriffe wie "nextjs", "testing" oder "presentation". Nie Datei- oder Projektnamen, Pfade, Code oder Inhalte.

## 1. Welcher Ordner?
Wechsle in den Ordner und prüfe ihn mit `pwd`. Ist es das Home-Verzeichnis (`$HOME`) oder `/`, **nicht scannen**. Frag stattdessen, welcher Projektordner gemeint ist.

## 2. Schon gescannt? (Cache)
Der Cache liegt lokal in `~/.claude/plugin-scout/projekte/`, eine Datei pro Projekt:
```
P=$(git rev-parse --show-toplevel 2>/dev/null || pwd)
F=~/.claude/plugin-scout/projekte/$(basename "$P")-$(printf %s "$P" | shasum | cut -c1-6).md
H=$(cd "$P" && cat package.json requirements.txt pyproject.toml Cargo.toml go.mod Gemfile composer.json pubspec.yaml 2>/dev/null | shasum | cut -c1-12)
[ -f "$F" ] && cat "$F"; echo "config_hash_jetzt: $H"
```
Gibt es die Datei und ist `config_hash` gleich, nimm Typ, Werkzeuge und Größe von dort und überspring Schritt 3. Will der Nutzer es neu ("nochmal scannen", "genauer"), scannst du trotzdem.

## 3. Fingerabdruck
Ein einziger Befehl, kurze Ausgabe:
```
if [ "$(find . -maxdepth 4 -type f 2>/dev/null | head -20001 | wc -l)" -gt 20000 ]; then echo "SEHR GROSS"; fi
if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then L() { git ls-files; }
else L() { find . -maxdepth 6 -type f -not -path '*/node_modules/*' -not -path '*/.git/*' -not -path '*/dist/*' -not -path '*/build/*' -not -path '*/.venv/*' -not -path '*/venv/*' 2>/dev/null | sed 's|^\./||'; }; fi
echo "Dateien: $(L | wc -l | tr -d ' ')"
echo "Typen:"; L | sed -n 's/.*\.\([A-Za-z0-9]*\)$/\1/p' | tr 'A-Z' 'a-z' | sort | uniq -c | sort -rn | head -15
echo "Testdateien: $(L | grep -E -i '(^|/)(tests?|__tests__|spec|e2e)/|\.(test|spec)\.' | wc -l | tr -d ' ')"
echo "Vorhanden:"; for f in package.json requirements.txt pyproject.toml Cargo.toml go.mod Gemfile composer.json pubspec.yaml Dockerfile docker-compose.yml compose.yaml vercel.json netlify.toml prisma/schema.prisma .mcp.json CLAUDE.md README.md .github/workflows; do [ -e "$f" ] && echo "  $f"; done
L | grep -E -i '(^|/)(next|vite|astro|nuxt|svelte|tailwind|angular|remix)\.config\.' | head -5
```
Steht da "SEHR GROSS" und es ist kein Git-Projekt: frag kurz nach, ob das wirklich *ein* Projekt ist. Sonst nur flach weiterschauen.

Dann **nur** die Werkzeug-Listen lesen, gekürzt:
- `package.json`: `jq -r '((.dependencies // {}) + (.devDependencies // {})) | keys | join(", ")' package.json` (ohne `jq`: `head -60`)
- `requirements.txt`, `pyproject.toml`, `Cargo.toml`, `go.mod`: jeweils höchstens die ersten 40 Zeilen
- `CLAUDE.md`: höchstens die ersten 30 Zeilen

## 4. Was braucht das Projekt?
Bestimme mit der Tabelle **"Projekt-Signale"** im Skill:
- **Art des Projekts**, auch wenn es kein Code ist: Uni-Notizen, Texte, PDFs, Folien oder Recherche zählen genauso
- **Größe:** "groß" heißt mehr als ca. 500 Code-Dateien
- **Höchstens 3–4 Bedarfe**, der wichtigste zuerst. Ein Bedarf zählt nur, wenn ein Plugin hier **spürbar** hilft.
- Lies die installierten Plugins (siehe Skill). Was die schon abdecken, ist kein Bedarf.
- Steht im Cache unter `abgelehnt:` ein Plugin, schlag es nicht wieder vor.

Gibt es **keinen echten Bedarf**, überspring Schritt 5 und sag ehrlich:
"Für dieses Projekt fehlt dir gerade nichts Wichtiges 👍 Wenn du willst, schau ich noch genauer nach, zum Beispiel nach Kleinigkeiten oder Geheimtipps."
Keine Vorschläge aus Verlegenheit.

## 5. Suchen (im Hintergrund-Helfer)
Damit die vielen Suchergebnisse den Chat nicht vollmachen, lass die Suche von **einem** Subagent erledigen (Agent-Tool, allgemeiner Typ, **ohne** eigenes Modell, also dasselbe Modell wie hier). Gibt es kein Agent-Tool, such selbst. Gib ihm mit:
- die Bedarfe mit allgemeinen englischen Suchbegriffen, sonst nichts vom Projekt
- die Liste der installierten Plugins und, falls es eins gibt, das Gedächtnis (schon gezeigt, 👍/👎, siehe Skill)
- den Auftrag: "Nutze den Skill `plugin-scout` (Abschnitte 3–5 und 'Geheimtipps'). Such pro Bedarf gründlich und gib pro Bedarf die 1–2 besten Plugins als fertige Plugin-Karten zurück, inklusive Ampel und geprüftem Install-Befehl. Ein Geheimtipp nur, wenn er den Bedarf besser oder spezieller löst als die bekannten. Findest du für einen Bedarf nichts Gutes, schreib das. Erfinde nichts."

## 6. Ergebnis
1. **2–3 Sätze dazu, was du erkannt hast**, zum Beispiel: "Du baust eine Next.js-Webseite mit ~300 Dateien, aber ohne Tests. Für die Gestaltung nutzt du noch kein Plugin."
2. Pro Bedarf eine kurze Überschrift, dann 1–2 Plugin-Karten. Jede Karte bekommt direkt unter der Link-Zeile die Zeile **"Warum für dein Projekt:"** mit einem Satz.
3. Passt ein **installiertes** Plugin gar nicht zu diesem Projekt (und auch nicht zum Profil), ein kurzer Tipp: "Übrigens: <Plugin> brauchst du hier wohl nicht. Mit `/plugin-scout:cleanup` kannst du aufräumen." Nur als Tipp, nie selbst etwas entfernen.
4. Am Ende: "Willst du eins genauer checken (`/plugin-scout:check`) oder zwei vergleichen (`/plugin-scout:compare`)?"

## 7. Merken
- **Cache schreiben** (Ordner anlegen), lokal in `$F`. Bestehende Zeilen `plaene`, `hinweise` und `abgelehnt` beibehalten:
  ```
  typ: <zum Beispiel Next.js-Webseite / Uni-Notizen (Markdown + PDF)>
  werkzeuge: <wichtigste, kommagetrennt>
  groesse: <Anzahl Dateien>
  config_hash: <H>
  scan_datum: <YYYY-MM-DD>
  vorgeschlagen: <Plugin-Namen>
  abgelehnt: <Plugin-Namen, die der Nutzer nicht will>
  ```
  Sagt der Nutzer später "will ich nicht" zu einem Vorschlag, trag es unter `abgelehnt` ein.
- **Fürs Weekly** (nur einmal pro Projekt fragen, und nur wenn der Typ noch nicht im Profil steht): "Soll ich mir merken, dass du an <Typ> arbeitest? Dann findet dein Weekly auch dazu passende Plugins." Nur bei **Ja**: Im Profil `~/.claude/plugin-scout/profil.md` unter `## Projekte` (Abschnitt anlegen, falls nötig) eine Zeile `- <Typ> (<wichtigste Werkzeuge>)` ergänzen, **ohne Projektnamen, Pfade oder Inhalte**. Dann das Profil ins Daten-Repo hochladen, genau wie in `commands/start.md` Schritt 3 beschrieben (nur wenn es ein Daten-Repo gibt).
