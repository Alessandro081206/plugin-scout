---
description: Einstiegs-Guide – findet die wichtigsten Plugins für deinen Use Case
---

Starte den plugin-scout-Einstiegs-Guide. Nutze dafür den Skill `plugin-scout` (Quellen, Bewertung, Karten-Stil). Sprich Deutsch, locker und freundlich, ohne Fachchinesisch.

Gehe Schritt für Schritt vor:

1. **Begrüßung** (max. 3 Sätze): Was plugin-scout kann: passende Plugins finden, sie einfach erklären, jeden Montag ein Weekly mit neuen Plugins.

2. **Use Case erfragen:** Frag, wofür der Nutzer Claude hauptsächlich nutzen will. Nutze dafür das AskUserQuestion-Tool, falls verfügbar, mit Beispielen wie: Programmieren / Apps bauen, Webseiten & Design, Uni & Lernen, Texte & Präsentationen, Recherche, Arbeit & Business. Freie Antwort ist erlaubt (auch mehrere Bereiche). Ohne Antwort nicht weitermachen.

3. **Suchen** (sag kurz "Ich schau mal, was andere nutzen…"):
   - **Essentials:** 3–4 Plugins, die fast jeder gebrauchen kann. Vor allem aus dem offiziellen Anthropic-Marketplace (`anthropics/claude-plugins-official`), live nachschauen, nichts aus dem Gedächtnis.
   - **Für den Use Case:** Was empfehlen andere Leute mit genau diesem Use Case? Reddit/Hacker-News-Threads, Blogposts, Awesome-Listen auf GitHub, Marketplaces, Sterne. Was mehrfach empfohlen wird, kommt nach oben.
   - Schon installierte Plugins aussortieren (siehe Skill).

4. **Ergebnis** als Plugin-Karten aus dem Skill, in zwei Gruppen:
   - **⭐ Must-have**: die 3–4 wichtigsten (Essentials + Top für den Use Case)
   - **👍 Nice-to-have**: 2–4 weitere gute Plugins
   Davor ein Satz, wonach du ausgewählt hast (z. B. "Das nutzen Leute, die viel mit Webseiten machen").

5. **Abschluss:**
   - "Sag mir einfach, welches ich dir genauer erklären soll."
   - Kurzer Hinweis: Mit `/plugin-scout:suche <was du brauchst>` findest du jederzeit gezielt Plugins, und `/plugin-scout:weekly` zeigt, was es Neues gibt.
   - Danach diesen Befehl ausführen, damit der Begrüßungs-Hinweis nicht mehr kommt (ohne das extra zu erwähnen):
     `mkdir -p ~/.claude/plugin-scout && touch ~/.claude/plugin-scout/guide-erledigt`

Zusätzliche Wünsche des Nutzers (falls angegeben): $ARGUMENTS
