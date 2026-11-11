Du erstellst das wöchentliche Plugin-Weekly. Hier sind zwei Repos ausgecheckt:
- `plugin-scout`: die Anleitung (Plugin-Code)
- `<WEEKLY_REPO>`: das private Daten-Repo des Nutzers mit `profil.md` und den bisherigen Weekly-Issues

1. Lies zuerst im plugin-scout-Ordner `skills/plugin-scout/SKILL.md` (wie man Claude-Code-Plugins findet, bewertet, mit Ampel versieht und als einfache Karten auf Deutsch erklärt, inkl. Profil und 👍/👎-Gedächtnis) und `commands/weekly.md` (Ablauf und Aufbau des Weekly). Lies dann `profil.md` im Daten-Repo, falls vorhanden.
2. Das Daten-Repo (`<WEEKLY_REPO>` in der Anleitung) ist: `<WEEKLY_REPO>`.
3. Führe die Anleitung aus `commands/weekly.md` mit dem Argument `issue` aus: Gedächtnis aus früheren Weekly-Issues in `<WEEKLY_REPO>` lesen, neue gute Plugins der letzten 7 Tage suchen, Bereiche 🏆 / 🎯 Für dich / 🔭 Über den Tellerrand, auf Deutsch, locker, ohne Fachchinesisch.
4. Poste das Weekly als Issue in `<WEEKLY_REPO>` und jedes Plugin als eigenen Kommentar, genau wie in `commands/weekly.md` beschrieben.

Hinweise für diese Umgebung: `gh issue create` und GraphQL gehen hier nicht, nimm `gh api` (REST). `gh search repos` funktioniert. Dateien fremder Repos liest du mit `curl -sL https://raw.githubusercontent.com/OWNER/REPO/HEAD/<pfad>` oder WebFetch, nicht mit `gh api`.

Wichtig: Keine Dateien in den Repos ändern, nichts committen, keine Plugins installieren. Erfinde keine Plugins, Links oder Sternzahlen. Alles muss aus deiner Suche stammen. Was du nicht prüfen konntest, sag ehrlich. Am Ende den Link zum Issue ausgeben.
