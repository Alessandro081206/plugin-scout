---
description: Einstiegs-Guide – findet die wichtigsten Plugins für deinen Use Case
---

Starte den plugin-scout-Einstiegs-Guide. Nutze dafür den Skill `plugin-scout`. Sprich Deutsch, locker und freundlich, ohne Fachchinesisch.

Gehe Schritt für Schritt vor:

1. **Begrüßung** (max. 3 Sätze): Was plugin-scout kann: passende Plugins finden und einfach erklären, sie vorher auf Sicherheit prüfen, jeden Montag ein Weekly mit neuen Plugins, das mit der Zeit lernt, was dir gefällt.

2. **Use Case erfragen:** Frag, wofür der Nutzer Claude hauptsächlich nutzen will. Nutze dafür das AskUserQuestion-Tool, falls verfügbar (Mehrfachauswahl erlaubt), mit Beispielen wie: Programmieren / Apps bauen, Webseiten & Design, Uni & Lernen, Texte & Präsentationen, Recherche, Arbeit & Business. Freie Antwort ist erlaubt. Ohne Antwort nicht weitermachen. Gibt es schon ein Profil (`~/.claude/plugin-scout/profil.md`), zeig es kurz und frag, ob es noch stimmt.

3. **Profil speichern**, damit Suche und Weekly zu dir passen:
   - Schreibe `~/.claude/plugin-scout/profil.md` (Ordner vorher anlegen) in diesem Format:
     ```
     # Profil
     ## Use Case
     - <Bereiche, mit eigenen Worten des Nutzers>
     ## Interessen / Alltag
     - <was er nebenbei erwähnt hat, z. B. Beruf, Hobbys>
     ## Lieber nicht
     - <falls er etwas ausschließt>
     ```
   - Lade es zusätzlich ins Weekly-Repo hoch, damit das Weekly in der Cloud es kennt (nur wenn `gh` eingeloggt ist, sonst überspringen):
     ```
     R=repos/Alessandro081206/plugin-scout/contents/daten/profil.md
     C="$(base64 < ~/.claude/plugin-scout/profil.md | tr -d '\n')"
     SHA=$(gh api "$R" --jq .sha 2>/dev/null)
     if [ -n "$SHA" ]; then gh api -X PUT "$R" -f message="Profil aktualisiert" -f content="$C" -f sha="$SHA" --jq .content.path
     else gh api -X PUT "$R" -f message="Profil angelegt" -f content="$C" --jq .content.path; fi
     ```
   - Erwähne das in einem halben Satz ("Hab mir das gemerkt").

4. **Suchen** (sag kurz "Ich schau mal, was andere nutzen…"):
   - **Essentials:** 3–4 Plugins, die fast jeder gebrauchen kann. Vor allem aus dem offiziellen Anthropic-Marketplace (`anthropics/claude-plugins-official`), live nachschauen, nichts aus dem Gedächtnis.
   - **Für den Use Case:** Was empfehlen andere Leute mit genau diesem Use Case? Reddit/Hacker-News-Threads, Blogposts, Awesome-Listen auf GitHub, Marketplaces, Sterne. Was mehrfach empfohlen wird, kommt nach oben.
   - **Überraschung:** 1 richtig gutes Plugin aus einem ganz anderen Bereich, das trotzdem spannend sein könnte.
   - Schon installierte Plugins aussortieren.

5. **Ergebnis** als Plugin-Karten aus dem Skill (mit Ampel), in drei Gruppen:
   - **⭐ Must-have**: die 3–4 wichtigsten (Essentials + Top für den Use Case)
   - **👍 Nice-to-have**: 2–4 weitere gute Plugins
   - **🔭 Mal was anderes**: die Überraschung, mit einem Satz, warum sie trotzdem cool sein könnte
   Davor ein Satz, wonach du ausgewählt hast.

6. **Abschluss:**
   - "Sag mir einfach, welches ich dir genauer erklären oder checken soll."
   - Kurze Übersicht der Befehle: `/plugin-scout:suche <Wunsch>`, `/plugin-scout:check <Plugin>`, `/plugin-scout:vergleich <A> <B>`, `/plugin-scout:aufraeumen`, `/plugin-scout:weekly`
   - Danach ausführen (ohne es zu erwähnen), damit der Begrüßungs-Hinweis nicht mehr kommt:
     `mkdir -p ~/.claude/plugin-scout && touch ~/.claude/plugin-scout/guide-erledigt`

Zusätzliche Wünsche des Nutzers (falls angegeben): $ARGUMENTS
