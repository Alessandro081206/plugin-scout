---
description: Richtet dein eigenes Weekly ein – jeden Montag neue Plugins als GitHub-Issue, mit 👍/👎-Gedächtnis
---

Richte für den Nutzer das automatische **Plugin-Weekly** ein. Nutze dafür den Skill `plugin-scout`. Sprich in der Sprache des Nutzers (siehe Skill), locker, ohne Fachchinesisch, und erkläre jeden Schritt kurz.

**Grundregel:** Nichts anlegen, ohne vorher zu fragen. Jeder Schritt, der etwas auf GitHub oder in der Cloud erstellt, wird vorher in einem Satz angekündigt.

## 1. Erklären und fragen
In 2–3 Sätzen: Das Weekly sucht jeden Montag neue, gute Plugins und schreibt sie als Issue in ein **eigenes, privates** GitHub-Repo. Dort kannst du auf jedes Plugin mit 👍 oder 👎 reagieren, und das nächste Weekly lernt daraus. Dein Profil liegt auch dort, damit nur du es siehst.
Dann fragen, ob er das will (AskUserQuestion, falls verfügbar). Bei Nein: freundlich abbrechen und auf `/plugin-scout:weekly` hinweisen (zeigt das Weekly einmalig im Chat).

## 2. Voraussetzungen prüfen
- `gh auth status`: Ist `gh` nicht eingeloggt, erklären: "Tipp `! gh auth login` ein und folge den Schritten." Danach weiter.
- GitHub-Name: `gh api user --jq .login`
- Gibt es schon ein Daten-Repo (siehe Skill)? Dann nicht neu anlegen, sondern damit weitermachen.

## 3. Daten-Repo anlegen
Vorschlag: `<login>/plugin-scout-daten`. Der Nutzer darf einen anderen Namen wählen.
```
gh repo create <REPO> --private --description "Private Daten für plugin-scout: Profil und Weekly-Issues"
```
Immer `--private`. Danach eine kurze README hineinlegen (was das Repo ist, dass es privat bleiben soll).

## 4. Profil hochladen und merken
- Gibt es `~/.claude/plugin-scout/profil.md`, lade es als `profil.md` hoch (Befehl wie in `commands/start.md`, mit diesem Repo). Gibt es keins, vorher kurz den Use Case erfragen und das Profil wie im Guide anlegen.
- Lokal merken: `mkdir -p ~/.claude/plugin-scout && echo "weekly_repo=<REPO>" > ~/.claude/plugin-scout/config`

## 5. Montags-Routine in der Cloud anlegen
- Lies die Vorlage `vorlagen/weekly-routine.md` im plugin-scout-Ordner (eine Ebene über `skills/`) und ersetze **jedes** `<WEEKLY_REPO>` durch das echte Repo.
- Lege damit über den Skill `schedule` (bzw. das RemoteTrigger-Tool) eine Routine an:
  - Name: `Plugin-Weekly`
  - Zeit: jeden Montag 8 Uhr in der Zeitzone des Nutzers (Cron im Zweifel in UTC umrechnen und die Uhrzeit bestätigen lassen)
  - Repos (Quellen): `https://github.com/Alessandro081206/plugin-scout` **und** `https://github.com/<REPO>`
  - Tools: Bash, Read, Write, Edit, Glob, Grep, WebSearch, WebFetch
  - Prompt: die ausgefüllte Vorlage
- Den Link zur Routine und die nächste Ausführungszeit nennen.

## 6. Abschluss
- Kurz zusammenfassen: Repo-Link, wann das erste Weekly kommt, und dass man auf die Plugin-Kommentare mit 👍/👎 reagieren soll.
- Anbieten: "Soll ich gleich einen Testlauf starten? Dann kommt sofort ein Weekly."
